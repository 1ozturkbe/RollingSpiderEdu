function [cob, y, idx] = rsedu_vis(binfilename)
    disp(binfilename);
    fid = fopen(binfilename);
    binfile = fread(fid);
    fclose(fid);
    pixdepth = 4;
    nx = 80;
    ny = 120;
    if length(binfile) == nx*ny*pixdepth
        yuv = reshape(binfile, [pixdepth, nx*ny]);
        firstrow = yuv(1,1:nx);
        y = 0;
        cob = 0;
        for i = 1:nx
            ytemp = 255-firstrow(i);
            if (ytemp>y)
                y = ytemp;
                cob = i-nx/2;
                idx = i;
            end
        end
    else
        cob = 0;
        y = 0;
        idx = 0;
    end
end