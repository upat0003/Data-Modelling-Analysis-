% Name: Utkarsh Patel (student Id: 29143926)
% Task: q1d
% Date of last modification: 30th April,2018


clc; 
clear all; 
close all;

a=1;                                                                        % all values are given
b=2;
c=4;
d=5;
thita2=0:0.01:360;
xi=120;
del=0.01;
precision=0.0001;

f=@(x) 5*cosd(x)-(5/4)*cosd(thita2)+4.75-cosd(thita2-x);                    % anonymoose function to put itself as input inside moodisecant fuction


[outputAngle,iter]=Modisecant(f,xi,del,precision);

filename='fourbar.txt';                                                     % creating new file and save it into same folder
file_id=fopen(filename,'wt');                                               % giving file the writing permission

fprintf(file_id,'All data has been read is as follow:\n\n');                %writing all necessary datas into file including appropriate spaces
fprintf(file_id,'%20s %30s \n\n','I/p Angle','O/p Angle');
fprintf(file_id,'%25.15f %25.15f \n', thita2,outputAngle);

disp('The data operation to import that data into new file has been performed! ');
fclose(file_id);                                                            % CLOSING THAT FILE



