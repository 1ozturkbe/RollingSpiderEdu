exchange = ['/home/johannes/RollingSpiderEdu/'...
    'MIT_MatlabToolbox/DroneExchange/imgs/'];
fid = fopen([exchange 'img6.bin']);
binfile = fread(fid);
pixdepth = 4;
width_pix = 80;
height_pix = 120;
yuvfile = reshape(binfile, [height_pix width_pix pixdepth]);

