% Name: Utkarsh Patel (student Id: 29143926)
% Task: q1b
% Date of last modification: 30th April,2018



%% Section 1b
clc; clear; close all;                                                       % clear all commands from workspace and command window

a = 1;                                                                       %input link of length
b = 2;                                                                       % input link of length
c = 4;                                                                       % output link of length
d = 5;                                                                       % fixed link of length                                                                             
pt = 0.01;                                                                   % error 
xi = 120;                                                                    % xi value is given
thita2 = 0:0.01:360;                                                         % given in question
prec = 0.0001;                                                               % precision


                                         
                                          
     

f=@(x) (5.*cosd(x))-cosd(((thita2)-x))+(-((1.25).*cosd(thita2))+4.75);      %anonymoose function with x as input 
[root_usingSuitableMethod,iter] = Modisecant(f,xi,pt,prec);                 %getting modisecant method to get output of thita-4

plot(thita2,root_usingSuitableMethod,'b-');                                 %plotting the values of thita-4 vs thit-2 with title given
grid on
title('Input Angle vs Output Angle')
xlabel('Thita-2')
ylabel('Thita-4')
legend('Thita-2 vs Thita-4', 'Location', 'NorthEast');

fprintf('The output angle in terms of thita-4 would be %f\n',root_usingSuitableMethod); % printing thita-4 value and iteration numbers
fprintf('Modisecant is taking %f iterations to execute\n',iter)

% Define crank length
%% Section 1C



%% Section 1D

% Write the result into text file
