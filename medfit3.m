function medfilimg = medfit3(img)
medfilimg = img;
[n, m, l] = size(img);
k=5;
for i =7:n-7
    for j = 7:m-7
        if sum(img(i,j,:))> 190*3
%             R = img(i-k:i+k, j-k:j+k,1);
%             G = img(i-k:i+k, j-k:j+k,2);
%             B = img(i-k:i+k, j-k:j+k,3);
%             medfilimg(i-k:i+k, j-k:j+k,1) = medfilt2(R,[9 9]);
%             medfilimg(i-k:i+k, j-k:j+k,2) = medfilt2(G,[9 9]);
%             medfilimg(i-k:i+k, j-k:j+k,3) = medfilt2(B,[9 9]);

            
            medfilimg(i-2:i+2,j-1:j+1,1) = min(min(img(i-6:i+6,j-6:j+6,1)));
            medfilimg(i-2:i+2,j-1:j+1,2) = min(min(img(i-6:i+6,j-6:j+6,2)));
            medfilimg(i-2:i+2,j-1:j+1,3) = min(min(img(i-6:i+6,j-6:j+6,3)));
        end
    end
end


end