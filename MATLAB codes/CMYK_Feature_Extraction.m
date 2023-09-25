clear all;
close all;
clc;
load 'LichensInput1.mat'
m=1;
CMYKColorkfs=[];
CMYKmean=[];
nb=6;
[m n]=size(LichensInput1)
for i = 1 : n
    im = double(LichensInput1{1,i});
    im = rgb2cmyk(im);
    C = im(:,:,1);
    M = im(:,:,2);
    Y = im(:,:,3);
    K = im(:,:,4);
    % Mean
    Cmean = mean2(C);
    Mmean = mean2(M);
    Ymean = mean2(Y);
    Kmean = mean2(K);
    %variance 
    Cvar = var(C(:));
    Mvar = var(M(:));
    Yvar = var(Y(:));
    Kvar = var(K(:));
    %standard Devation
    Cstd= std2(C);
    Mstd = std2(M);
    Ystd = std2(Y);
    Kstd = std2(K);
    %skewness
    Cskew = skewness(C(:));
    Mskew = skewness(M(:));
    Yskew = skewness(Y(:));
    Kskew = skewness(K(:));
    
    %kurtosis
    Ckurt = kurtosis(C(:));
    Mkurt = kurtosis(M(:));
    Ykurt = kurtosis(Y(:));
    Kkurt = kurtosis(K(:));
    CMYKFv = [Cmean;Mmean;Ymean;Kmean;Cvar;Mvar;Yvar;Kvar;Cstd;Mstd;Ystd;Kstd;Cskew;Mskew;Yskew;Kskew;Ckurt;Mkurt;Ykurt;Kkurt];
    CMYKColorkfs = [CMYKColorkfs;CMYKFv'];
end
csvwrite('Lichens_CMYKColorFeatures119.csv',CMYKColorkfs);
save CMYKColorkfs.mat
