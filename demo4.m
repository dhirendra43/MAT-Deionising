clc; clear;close all;
load colorflower.mat
OrignalImage=colorflower.Orig
NoisyImage=colorflower.Noisy
FilterImage=wdenoise2(NoisyImage,2)
figure
subplot(1,3,1);imshow(OrignalImage)
subplot(1,3,2);imshow(NoisyImage)
subplot(1,3,3);imshow(FilterImage)