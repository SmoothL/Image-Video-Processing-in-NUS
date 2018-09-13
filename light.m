
function rgb1 = light(rgb,k)
[m,n,k] = size(rgb); %读取图片大小 
hsv = rgb2hsv(rgb); %颜色空间转换 
H = hsv(:,:,1); % 色调 
S = hsv(:,:,2); % 饱和度 
V = hsv(:,:,3); % 亮度

for i = 1:m %遍历每一个像素点，可以根据需要选择自己需要处理的区域 
for j = 1: n 
hsv(i,j,3) =k* hsv(i,j,3); %1.5位需要增强的倍数，可以根据图片情况动态调整 
end 
end

rgb1 = hsv2rgb(hsv); %转为RGB，进行显示 
% imshow(rgb1) 
end