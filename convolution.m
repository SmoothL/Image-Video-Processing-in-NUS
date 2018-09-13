pic =imread('3.jpg');
figure
imshow(pic);
red = pic(:,:,1);
green = pic(:,:,2);
blue = pic(:,:,3);

 g3 = [
     -2 -1 0
     -1 1 1
    0 1 1];



r = conv2(red, g3);
g = conv2(green, g3);
b = conv2(blue, g3);

conr = uint8(255 * mat2gray(r));
cong = uint8(255 * mat2gray(g));
conb = uint8(255 * mat2gray(b));

B = cat(3, conr ,cong, conb);
figure
imshow(B);

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
imshow(im2uint8(uSobel));

imag = uSobel;
N = conv2(imag, g3);
figure
imshow(N);

[m n]= size(imag);
M = ones(m,n);
new = ones(m+2,n+2) - N;
figure
imshow(new);
