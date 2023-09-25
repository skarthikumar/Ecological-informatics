clear all;
close all;
clc;
load 'LichensInput1.mat'
m=1;
LABColorkfs=[];
LABFv=[];
nb=6;
[m n]=size(LichensInput1)
for i = 1 : n
    im = rgb2lab(double(LichensInput1{1,i}));
    L = im(:,:,1);
    A = im(:,:,2);
    B = im(:,:,3);
    % Mean
    Lmean = mean2(L);
    Amean = mean2(A);
    Bmean = mean2(B);
    %variance 
    Lvar = var(L(:));
    Avar = var(A(:));
    Bvar = var(B(:));
    %standard Devation
    Lstd= std2(L);
    Astd = std2(A);
    Bstd = std2(B);
    %skewness
    Lskew = skewness(L(:));
    Askew = skewness(A(:));
    Bskew = skewness(B(:));
    %kurtosis
    Lkurt = kurtosis(L(:));
    Akurt = kurtosis(A(:));
    Bkurt = kurtosis(B(:));
    LABFv = [Lmean;Amean;Bmean;Lvar;Avar;Bvar;Lstd;Astd;Bstd;Lskew;Askew;Bskew;Lkurt;Akurt;Bkurt];
    LABColorkfs = [LABColorkfs;LABFv'];
end
csvwrite('Lichens_LABColorFeatures119.csv',LABColorkfs);
save LABColorfs.mat
