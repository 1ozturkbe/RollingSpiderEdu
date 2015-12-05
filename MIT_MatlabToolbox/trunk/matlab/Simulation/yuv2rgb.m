function rgb = yuv2rgb(yuv)
    yuv = [yuv(1);yuv(2);yuv(4)];
    C = [0; 128; 128];
    D = [1  0 1.13983; 
         1 -0.39465 -0.58060; 
         1 2.03211 0];
    yuv1 = yuv - C;
    rgb = round(D * yuv1);
end