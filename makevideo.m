videoName = 'final';%������Ƶ�ļ���ַ
fps = 30;%��Ƶ֡��
startFrame = 1;%����һ֡��ʼ
endFrame = 1010;%����һ֡����������Լ�����ͼƬ�Ķ�������
videoObj = VideoWriter(videoName);
videoObj.FrameRate = fps;
open(videoObj);
for i = startFrame : endFrame
    fileName = '';%����Ҫ��filename���ַ�ƴ�Ӵ���
    frames=imread(fullfile('/Users/smooth/Desktop/image/my',['original_frame',num2str(i),'.bmp']));
    frames=im2frame(frames);
    writeVideo(videoObj,frames);
end
close(videoObj);