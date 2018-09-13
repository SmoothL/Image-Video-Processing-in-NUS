function s = kmeans_im(he)
 lab_he = rgb2lab(he);
 ab = lab_he(:,:,2:3);
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

nColors = 3;
% repeat the clustering 3 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3);
pixel_labels = reshape(cluster_idx,nrows,ncols);


segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors
    color = he;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end
s = segmented_images{3};
% subplot(221);
% imshow(he);
% subplot(222);
% imshow(segmented_images{1});
% subplot(223);
% imshow(segmented_images{2});
% subplot(224);
% imshow(segmented_images{3});

end