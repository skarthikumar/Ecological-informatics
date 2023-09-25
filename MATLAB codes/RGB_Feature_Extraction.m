clear all;
close all;
clc;
load 'LichensInput1.mat'
m=1;
RGBColorkfs=[];
RGBmean=[];
nb=6;
[m n]=size(LichensInput1)
for i = 1 : n
    im = double(LichensInput1{1,i});
    R = im(:,:,1);
    G = im(:,:,2);
    B = im(:,:,3);
    
    % Mean
    Rmean = mean2(R);
    Gmean = mean2(G);
    Bmean = mean2(B);
    %variance 
    Rvar = var(R(:));
    Bvar = var(G(:));
    Gvar = var(B(:));
    %standard Devation
    Rstd= std2(R);
    Gstd = std2(G);
    Bstd = std2(B);
    %skewness
    Rskew = skewness(R(:));
    Gskew = skewness(G(:));
    Bskew = skewness(B(:));
    %kurtosis
    Rkurt = kurtosis(R(:));
    Gkurt = kurtosis(G(:));
    Bkurt = kurtosis(B(:));
    RGBmean = [Rmean; Gmean; Bmean;Rvar;Gvar;Bvar;Rstd;Gstd;Bstd;Rskew;Gskew;Bskew;Rkurt;Gkurt;Bkurt];
    RGBColorkfs = [RGBColorkfs;RGBmean'];
end
csvwrite('Lichens_RGBColorFeatures119.csv',RGBColorkfs);
save RGBColorkfs.mat
