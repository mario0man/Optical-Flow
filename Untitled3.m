clear all; close all; 
addpath('mex');
%load the two images 
%load video 3-d matrix 
load('h22.mat');
%load desired images from video frames 
img1 = gvid(:,:,1);
img2 = gvid(:,:,2);
img3 = gvid(:,:,3);
img21 = gvid(:,:,21);
% set optical flow parameters (see Coarse2FineTwoFrames.m for param defs)
alpha = 0.012;
ratio = 0.75;
minWidth = 20;
nOuterFPIterations = 7;
nInnerFPIterations = 1;
nSORIterations = 30;
para = [alpha,ratio,minWidth,nOuterFPIterations,nInnerFPIterations,nSORIterations];
% this is the core part of calling the mexed dll file for computing optical flow
% it also returns the time that is needed for two-frame estimation
[vx,vy,warp] = Coarse2FineTwoFrames(img1,img3,para);
figure;imshow(img1);figure;imshow(img3);
% visualize flow field
clear flow;
flow(:,:,1) = vx;
flow(:,:,2) = vy;
imflow = flowToColor(flow);
figure;imshow(imflow);