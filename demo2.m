clc; clear;close all;
a=imread('rose.png')
R=a(:,:,1);
G=a(:,:,2);
B=a(:,:,3);
R=imnoise(R,'salt & pepper',0.12);
G=imnoise(G,'salt & pepper',0.12);
B=imnoise(B,'salt & pepper',0.12);
NoisyImage1(:,:,1)=R;
NoisyImage1(:,:,2)=G;
NoisyImage1(:,:,3)=B;
imwrite(NoisyImage1,'Noisy1.png')
figure;imshow(NoisyImage1)