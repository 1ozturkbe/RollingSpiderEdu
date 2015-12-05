exchange = ['/home/johannes/RollingSpiderEdu/'...
    'MIT_MatlabToolbox/DroneExchange/imgs/'];
ims = dir(exchange);
readImg = {};
counter = 0;
for i = 1:length(ims)
    counter = counter +1;
    if regexp(ims(i).name, 'img_rgb_.')
    end
end
    
fl = imread([exchange 'processed/img_rgb_0612.ppm']);
 
fid = fopen([exchange 'img6.bin']);
binfile = fread(fid);
pixdepth = 4;
width_pix = 80;
height_pix = 120;
yuvfile = reshape(binfile, [height_pix width_pix pixdepth]);
rgb = zeros(height_pix, width_pix, pixdepth-1);
for i = 1:height_pix
    for k = 1:width_pix
        rgb(i,k,:) = yuv2rgb(yuvfile(i,k,:));
    end
end
