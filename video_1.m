v = VideoReader('my.mp4');

BLUR1 = @(Z) rgb(Z,12);
BLUR2 = @(Z) rgb(Z,24);
BLUR3 = @(Z) rgb(Z,36);
BLUR4 = @(Z) rgb(Z,48);

K = @(Z) kmeans_im(Z);
CAN = @(Z) canny(Z);
SO = @(Z) sobel(Z);

v.CurrentTime = 0;
currAxes = axes;

v1 = VideoWriter('new11.avi');
open(v1);

videosh(v, v1, 1.5);

object.mode = 0;
object.v = v;
object.v1 = v1;

object.fun = BLUR1;
object.time = 1.5+1*0.8;
videofft(object);

object.fun = BLUR2;
object.time = 1.5+2*0.8;
videofft(object);

object.fun = BLUR3;
object.time = 1.5+3*0.8;
videofft(object);

object.fun = BLUR4;
object.time = 1.5+4*0.8;
videofft(object);


% for i=4:1
%     object.fun = BLUR{i};
%     object.time = 4.7+i*0.8;
%     videofft(object);
% end

object.fun = CAN;
object.time = 8.2;
videofft(object);

videosh(v, v1, 9.3);

object.fun = K;
object.time = 10.2;
videofft(object);

object.fun = SO;
object.time = 11;
videofft(object);


close(v1);

% 
% while hasFrame(v)
%     vidFrame = readFrame(v);
%     [A, B] = rgb(vidFrame);
%     writeVideo(v1,A);
% %     image(A, 'Parent', currAxes);
% %     currAxes.Visible = 'off';
% %     pause(1/v.FrameRate);
%    if v.CurrentTime == 3
%         break;
%    end
% end
% 
% while hasFrame(v)
%     vidFrame = readFrame(v);
% %     [A, B] = rgb(vidFrame);
% %     vidFrame = A;
% %     writeVideo(v1,kmeans_im(vidFrame));
%     A = kmeans_im(vidFrame);
%     writeVideo(v1,A);
% %     image(A, 'Parent', currAxes);
% %     currAxes.Visible = 'off';
% %     pause(1/v.FrameRate);
%    if v.CurrentTime == 3.5
%         break;
%    end
% end
% 
% while hasFrame(v)
%     vidFrame = readFrame(v);
%     [A, B] = rgb(vidFrame);
%     writeVideo(v1,A);
% %     image(A, 'Parent', currAxes);
% %     currAxes.Visible = 'off';
% %     pause(1/v.FrameRate);
%    if v.CurrentTime == 6
%         break;
%    end
% end
% close(v1);