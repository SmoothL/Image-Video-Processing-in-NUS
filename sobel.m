function uSobel = sobel(pic)
imag = rgb2gray(pic);
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
% figure
[m, n] = size(uSobel);
M = im2uint8(ones(m,n)*255);
uSobel =M - uSobel*2;
uSobel = cat(3, uint8(uSobel), uint8(uSobel), uint8(uSobel));
% imshow(uSobel);
end