%********************************** FACE RECOGNITION USING PCA ***********************************************
%STUDENT NAMES:
%USN NUMBER:
%
%Ref:
%**************************************************************************************************************
clear;clc;
close all;
%**************************************************************************
%***************

ns1 = 1; % one subject for testing with existing data base

DatabasePath1 = uigetdir; % selecting image data path for testing
tic
[Data1,DS1]=CDT_new_V3(ns1,DatabasePath1); % gives the vectored matrix output of all images in testing image folder
toc

load('training.mat');

[ProjectedImages_testing] = Image_Projection(Data1,Mn,Eigenfaces);

[rec,dist] = RecognitionV1(ProjectedImages_testing,ProjectedImages,DS1,DS)
% recognizeded image class is
imaage_class = ceil(rec(1)/10); % since each class has 10 images
recognized_image_class = strcat('s',num2str(imaage_class))
distance = sum(abs(dist))
%*******************************************8888888888888888888888888
% displaying input image and ouput image

if distance > 8.99e+004
    h = msgbox('Urecognized image set');
else
    Files = dir(DatabasePath1);
    for i = 1:3

        if not(strcmp(Files(i).name,'.')|strcmp(Files(i).name,'..')|strcmp(Files(i).name,'Thumbs.db'))
            figure('Name','input_image')
            img_in = imshow(strcat(DatabasePath1,'\',Files(i).name));
            filename = Files(5).name; % to show different image in a set
        end
    end
    
    figure('Name','output_image')
    
    recognized_image = strcat(DatabasePath,'\', recognized_image_class,'\',filename);
    img_out = imshow(recognized_image);
end



