% Name: Utkarsh Patel (student Id: 29143926)
% Task: q1a
% Date of last modification: 30th April,2018



%% Section 1a
clc; clear all; close all;                      % clear all commands from workspace and command window

a = 1;                                          % input link of length
b = 2;                                          % input link of length
c = 4;                                          % output link of length
d = 5;                                          % fixed link of length
pt = 0.01;                                      % error
prec = 0.0001;                                  % precision
xi = 120;                                       % xi value is given
thita2 = 30;                                    % given in question
GraphValueRange = 120:0.01:160;                 % the range in which we will get graph


% Define input parameters and anonymous functions

f=@(x) (5*cosd(x))-cosd(((thita2)-x))+(-((1.25).*cosd(thita2))+4.75); %anonymoose fuction with having x as variable to pass

[root_usingModiSecant,iter] = Modisecant(f,xi,pt,prec); % modisecant function call with root as the output
fprintf('The thita4 value is %0.12f \n',root_usingModiSecant) % printing the value of thita-4 which is called root_usingModiSecant here


optionForGraph = input('Would you like to see a Graph for that? {yes-1 or no-0}: '); %asking if user wants to see graph or not

if optionForGraph == 1
    plot(root_usingModiSecant,f(root_usingModiSecant),'b*',GraphValueRange,f(GraphValueRange),'r') % plotting the graph of thita4 vs thita2
    xlabel('Thita2')
    ylabel('Thita4')

end


