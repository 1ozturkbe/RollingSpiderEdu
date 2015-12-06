exchange = ['/home/johannes/Dropbox (MIT)/16.30 Project/Images/'...
    'imgs-old/'];
processed = [exchange 'processed/'];
ims = dir(processed);
readImg = {};
cob = [];
y = [];
idx = [];
counter = 0;
binfile = {};
for i = 1:length(ims)
    match = regexp(ims(i).name, 'img_rgb_.*','match');
    numberstr = regexp(ims(i).name, '\d*','match');
    if ~isempty(match)
        counter = counter +1;
        number = str2double(numberstr{1});      
        binfile{counter} = [exchange sprintf('img%d.bin',number)];
        [cob(counter), y(counter), idx(counter)] = rsedu_vis(binfile{counter});
        imagetemp = imread([processed match{1}]);
        if idx(counter) ~= 0
            imagetemp(1,idx(counter),1) = 255;
            imagetemp(1,idx(counter),2) = 255;
            imagetemp(1,idx(counter),3) = 0;
            imagetemp(2,idx(counter),1) = 255;
            imagetemp(2,idx(counter),2) = 255;
            imagetemp(2,idx(counter),3) = 0;
        end
        [rows, ~] = size(imagetemp);
        stretchedImage = imresize(imagetemp, [rows 160]);
        readImg{counter} = stretchedImage;
    end
end
 
figure
loops = length(readImg);
for j = 1:loops
    imshow(readImg{j});
    if idx(j) ~= 0
        viscircles([2*idx(j) 1], 20,'Color','y');
    end
    drawnow
    F(j) = getframe;
end
movie2avi(F, 'test.avi', 'compression', 'None');

