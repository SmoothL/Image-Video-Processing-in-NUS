
function rgb1 = light(rgb,k)
[m,n,k] = size(rgb); %��ȡͼƬ��С 
hsv = rgb2hsv(rgb); %��ɫ�ռ�ת�� 
H = hsv(:,:,1); % ɫ�� 
S = hsv(:,:,2); % ���Ͷ� 
V = hsv(:,:,3); % ����

for i = 1:m %����ÿһ�����ص㣬���Ը�����Ҫѡ���Լ���Ҫ��������� 
for j = 1: n 
hsv(i,j,3) =k* hsv(i,j,3); %1.5λ��Ҫ��ǿ�ı��������Ը���ͼƬ�����̬���� 
end 
end

rgb1 = hsv2rgb(hsv); %תΪRGB��������ʾ 
% imshow(rgb1) 
end