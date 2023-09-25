clear all;
close all;
clc;
load 'LichensInput1.mat'
m=1;
ycbcrColorkfs=[];
ycbcrmean=[];
nb=6;
[m n]=size(LichensInput1)
for i = 1 : n
    im = rgb2ycbcr(double(LichensInput1{1,i}));
    y = im(:,:,1);
    cb = im(:,:,2);
    cr = im(:,:,3);
    % Mean
    Ymean = mean2(y);
    Cbmean = mean2(cb);
    Crmean = mean2(cr);
    %variance 
    Yvar = var(y(:));
    Cbvar = var(cb(:));
    Crvar = var(cr(:));
    %standard Devation
    Ystd= std2(y);
    Cbstd = std2(cb);
    Crstd = std2(cr);
    %skewness
    Yskew = skewness(y(:));
    Cbskew = skewness(cb(:));
    Crskew = skewness(cr(:));
    %kurtosis
    Ykurt = kurtosis(y(:));
    Cbkurt = kurtosis(cb(:));
    Crkurt = kurtosis(cr(:));
    ycbcrFv = [Ymean;Cbmean;Crmean;Yvar;Cbvar;Crvar;Ystd;Cbstd;Crstd;Yskew;Cbskew;Crskew;Ykurt;Cbkurt;Crkurt];
    ycbcrColorkfs = [ycbcrColorkfs;ycbcrFv'];
end
csvwrite('Lichens_YCbCrColorFeatures119.csv',ycbcrColorkfs);
save ycbcrColorkfs.mat
