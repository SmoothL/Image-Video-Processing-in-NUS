close all
clear all

x1 = [1 1 1 1 1 0 0 1 0 0 0 0 0 0 0 0];
xfft1 = abs(fftshift(fft(x1)));


figure
subplot(2,1,1), stem(x1);
subplot(2,1,2), stem(xfft1);


pic = imread('nus.JPG');
figure
imagesc(pic);

grayPic = pic(:,:,1);
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

imag = pic;
imag = rgb2gray(imag);        %转化为灰度图
subplot(121);
imshow(imag);
title('原图'); 
[high,width] = size(imag);   % 获得图像的高度和宽度
F2 = double(imag);        
U = double(imag);       
uSobel = imag;
for i = 2:high - 1   %sobel边缘检测
    for j = 2:width - 1
        Gx = (U(i+1,j-1) + 2*U(i+1,j) + F2(i+1,j+1)) - (U(i-1,j-1) + 2*U(i-1,j) + F2(i-1,j+1));
        Gy = (U(i-1,j+1) + 2*U(i,j+1) + F2(i+1,j+1)) - (U(i-1,j-1) + 2*U(i,j-1) + F2(i+1,j-1));
        uSobel(i,j) = sqrt(Gx^2 + Gy^2); 
    end
end 
subplot(122);
imshow(im2uint8(uSobel));
title('边缘检测后');  %画出边缘检测后的图像


  

