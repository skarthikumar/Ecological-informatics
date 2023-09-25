clear all;
close all;
clc;
load 'LichensInput1.mat'
m=1;
HSVColorkfs=[];
HSVmean=[];
nb=6;
[m n]=size(LichensInput1)
for i = 1 : n
    im = rgb2hsv(double(LichensInput1{1,i}));
    H = im(:,:,1);
    S = im(:,:,2);
    V = im(:,:,3);
    % Mean
    Hmean = mean2(H);
    Smean = mean2(S);
    Vmean = mean2(V);
    %variance 
    Hvar = var(H(:));
    Svar = var(S(:));
    Vvar = var(V(:));
    %standard Devation
    Hstd= std2(H);
    Sstd = std2(S);
    Vstd = std2(V);
    %skewness
    Hskew = skewness(H(:));
    Sskew = skewness(S(:));
    Vskew = skewness(V(:));
    %kurtosis
    Hkurt = kurtosis(H(:));
    Skurt = kurtosis(S(:));
    Vkurt = kurtosis(V(:));
    HSVFv = [Hmean;Smean;Vmean;Hvar;Svar;Vvar;Hstd;Sstd;Vstd;Hskew;Sskew;Vskew;Hkurt;Skurt;Vkurt];
    HSVColorkfs = [HSVColorkfs;HSVFv'];
end
csvwrite('Lichens_HSVColorFeatures119.csv',HSVColorkfs);
save HSVColorkfs.mat
