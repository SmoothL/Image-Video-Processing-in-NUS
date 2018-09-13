function B = canny(pic,k)
 %pic = imread('06.jpeg');
% figure
% imshow(pic);
red = pic(:,:,1);
green = pic(:,:,2);
blue = pic(:,:,3);

 g2 = [
     -2 -1 0
     -1 k 1
    0 1 1];


[nrows, ncols] = size(red);
g3 = [g2 zeros(size(g2,1), ncols-size(g2,2));
      zeros(nrows-size(g2,1), ncols)];
 
conr1= abs(ifft2(fftshift(fft2(red)).* fftshift(fft2(g3))));
cong1 = abs(ifft2(fftshift(fft2(green)).* fftshift(fft2(g3))));
conb1 = abs(ifft2(fftshift(fft2(blue)).* fftshift(fft2(g3))));

[m, n] = size(red);
M = im2uint8(ones(m,n)*255);

conr = M - uint8(255 * mat2gray(conr1));
cong = M - uint8(255 * mat2gray(cong1));
conb = M - uint8(255 * mat2gray(conb1));


B = cat(3, conr ,cong, conb);



% title('±ßÔµ¼ì²âºó');  %»­³ö±ßÔµ¼ì²âºóµÄÍ¼Ïñ
end





