%2D FFT Demo
%Import images
function [imageC, imageD]=phase(imageA, imageB)
imageA = im2double(imageA);
imageB = im2double(imageB);
%Display images

figure, imshow(imageA)
title('Image A - Greek Church')
figure, imshow(imageB)
title('Image B - Aishwarya Rai')
%Perform 2D FFTs

fftA = fft2(imageA);
fftB = fft2(imageB);
%Display magnitude and phase of 2D FFTs
% 
% figure, imshow(abs(fftshift(fftA)),[24 100000]), colormap gray
% title('Image A FFT2 Magnitude')
% figure, imshow(angle(fftshift(fftA)),[-pi pi]), colormap gray
% title('Image A FFT2 Phase')
% figure, imshow(abs(fftshift(fftB)),[24 100000]), colormap gray
% title('Image B FFT2 Magnitude')
% figure, imshow(angle(fftshift(fftB)),[-pi pi]), colormap gray
% title('Image B FFT2 Phase')
%Switch magnitude and phase of 2D FFTs

fftC = abs(fftA).*exp(1i*angle(fftB));
fftD = abs(fftB).*exp(1i*angle(fftA));
%Perform inverse 2D FFTs on switched images

imageC = ifft2(fftC);
imageD = ifft2(fftD);

figure
imshow(imageC);

figure
imshow(imageD);
%Calculate limits for plotting
% 
% cmin = min(min(abs(imageC)));
% cmax = max(max(abs(imageC)));
% 
% dmin = min(min(abs(imageD)));
% dmax = max(max(abs(imageD)));
% %Display switched images
% 
% figure, imshow(abs(imageC), [cmin cmax])
% title('Image C  Magnitude')
% figure, imshow(abs(imageD), [dmin dmax])
% title('Image D  Magnitude')
end

