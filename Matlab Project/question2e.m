% Name: Utkarsh Patel (student Id: 29143926)
% Task: q2e
% Date of last modification: 30th April,2018


clc;
clear all;
close all;

filename='amplitude_data.xlsx';
fileInformation=importdata(filename);

time=fileInformation.data(:,1);
amplitude=fileInformation.data(:,2);
derivativeOfLog=fileInformation.data(:,3);

check=amplitude<2;                                          % logical- check for values of Amplitude less than 2
index=logical(check);                                       % declaring that in logical type 
next_amplitude=amplitude(index);                             % convert time into logical type
next_time=time(index);                                       % change amplitude into logical type

next_derivative=derivativeOfLog(index);                         % convert derivativeOfLog into logical type

t=time<=900;                                                    %check for time if it's less than 900
i=logical(t);                                                    %define i in this condition of time
t=next_time(i);                                                  % CHANGE TIME into the format of type where time should be less than 900
Next_amplitude=next_amplitude(i).^2;
Next_derivative=next_derivative(i);                             %creating new variable for derivative regarding time range

Final_amplitude=(Next_amplitude)>=1e-4;                         %logical check for values of amplitudes greater than 1e-4
Final_index=logical(Final_amplitude);                            %define them in logical detatype

x=Next_amplitude(Final_index);                                  %making new amplitude value in x axes
y=Next_derivative(Final_index);                                 %making new derivative value in y axes 

p=polyfit(x,y,1);                                               %polyfit for linear

A1=p(1);                                                        %A1 for coefficient in linear
A2=p(2);                                                        %A2 for coefficient in linear
xu=0.0007;                                                                      %xu is given in the question which is upper value, xu=0.0007
xl=0.0001;                                                                      %xl is given which is lower value , xl=0.0001
precision=1e-4;                                                                 %precision

func=@(x) p(1)*x+p(2)+(7e-4);                                                   %anonymoose function which is linear equation
[Bisectionvalues,iter]=bisection(func,xl,xu,precision);                         %bisection method to find the root which is A^2

plot(Next_amplitude,Next_derivative,'kd',Bisectionvalues,-xu,'r*');             %plot 
xlabel('Amplitude^2  (mm^2)');          
ylabel('Derivative of Log(Amplitude)  (mm/s)');
legend('derivative vs A^2', 'derivative of log=7*10^-4 with A^2');
title('derivative of log(Amplitude) against A^2');
grid on

answer=sqrt(Bisectionvalues);                                                   % the square root of this output (means A^2) will lead us to A which is called answer here
fprintf('The value A while derivative falls down 7*10^-4 is: %.4f\n', answer)   %printing that A value