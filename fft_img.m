
function fft_img(pic)
figure
imagesc(pic);

grayPic = rgb2gray(pic);
figure
imagesc(grayPic);
colormap('gray');

picFFT = fftshift(fft2(grayPic));
figure
imagesc(log(abs(picFFT)+1e-5));
colormap('gray');

g = gausswin(32,5);
g2 = g * g.';
figure
imagesc(g2);
colormap('gray');

g2FFT = fftshift(fft2(g2));
figure
imagesc(abs(g2FFT));
colormap('gray');

[nrows, ncols] = size(grayPic);

g3 = [g2 zeros(size(g2,1), ncols-size(g2,2));
      zeros(nrows-size(g2,1), ncols)];
     
figure
imagesc(g3);
colormap('gray');

g3FFT = fftshift(fft2(g3));

figure
imagesc(abs(g3FFT));
colormap('gray');

convFFT = picFFT .* g3FFT;

convSpatial = ifft2(convFFT);

figure
imagesc(abs(convSpatial));
colormap('gray');
end