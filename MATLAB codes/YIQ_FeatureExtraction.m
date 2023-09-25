clear all;
close all;
clc;
load 'LichensInput1.mat'
m=1;
YIQColorkfs=[];
YIQFv=[];
nb=6;
[m n]=size(LichensInput1)
for i = 1 : n
    im = rgb2ntsc(double(LichensInput1{1,i}));
    Y = im(:,:,1);
    I = im(:,:,2);
    Q = im(:,:,3);
    % Mean
    Ymean = mean2(Y);
    Imean = mean2(I);
    Qmean = mean2(Q);
    %variance 
    Yvar = var(Y(:));
    Ivar = var(I(:));
    Qvar = var(Q(:));
    %standard Devation
    Ystd= std2(Y);
    Istd = std2(I);
    Qstd = std2(Q);
    %skewness
    Yskew = skewness(Y(:));
    Iskew = skewness(I(:));
    Qskew = skewness(Q(:));
    %kurtosis
    Ykurt = kurtosis(Y(:));
    Ikurt = kurtosis(I(:));
    Qkurt = kurtosis(Q(:));
    YIQFv = [Ymean;Imean;Qmean;Yvar;Ivar;Qvar;Ystd;Istd;Qstd;Yskew;Iskew;Qskew;Ykurt;Ikurt;Qkurt];
    YIQColorkfs = [YIQColorkfs;YIQFv'];
end
csvwrite('Lichens_YIQColorFeatures119.csv',YIQColorkfs);
save YIQColorfs.mat
