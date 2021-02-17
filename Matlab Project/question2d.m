% Name: Utkarsh Patel (student Id: 29143926)
% Task: q2d
% Date of last modification: 30th April,2018

clc;
clear all;
close all;

filename='amplitude_data.xlsx';
fileInformation=importdata(filename);

Time=fileInformation.data(:,1);
Amplitude=fileInformation.data(:,2);
derivativeOfLog=fileInformation.data(:,3);


check=Amplitude<2;                                 % logical- check for values of Amplitude less than 2
index=logical(check);                              % declaring that in logical type  
Time=Time(index);                                  % convert time into logical type
Amplitude=Amplitude(index);                        % change amplitude into logical type

t=Time<900;                                        %check for time if it's less than 900
index_t=logical(t);                                %define index in this condition of time
Time=Time(index_t);                                % CHANGE TIME into the format of type where time should be less than 900
Amplitude=Amplitude(index_t);

check1=(Time>0)&(Time<=60);                         %check again for time to be in range of 0 and 60
index1=logical(check1);                             %declare index into logical type for this time range
time1=Time(index1);                                 %change that time into logical type for this time range
amplitude1=Amplitude(index1);                       %convert Amplitude into logical way for this time range
log_amplitude1=log(amplitude1);                     %Get the log of newly generated amplitude value for this time range


check2=(Time>=60)&(Time<=900);                      %check for time whether it's between 60 and 900
index2=logical(check2);                             %define index into logical type for the time range here
time2=Time(index2);                                 %convert Time into logical type for this time range
amplitude2=Amplitude(index2);                       %convert amplitude into logical type for this time range
log_amplitude2=log(amplitude2);                     %get the log value of amplitude



p1=polyfit(time1,log_amplitude1,2);                 %polyfit for 2nd order (degree) curve fit
p2=polyfit(time2,log_amplitude2,1);                 %polyfit for linear curve fitting

A1=p1(1);                                           %A1 is coefficient of x^2 for 2nd order
A2=p1(2);                                           %A2 is coefficient of x^1 for 2nd order    
A3=p1(3);                                           %A3 is last coefficient of x^0 for 2nd order 

A_(1)=p2(1);                                        %A_(1)-coefficient of x^1 in linear fitting
A_(2)=p2(2);                                        %A_(2)-coefficient of x^0 in linear fitting

y1=A1.*(time1.^2)+A2.*time1+A3;                     %polyfit function for 2nd order curve fitting
y2=A_(1).*time2+A_(2);                              %polyfit function for linear fitting

st_1=sum((log_amplitude1-(mean(log_amplitude1))).^2); 
st_2=sum((log_amplitude2-(mean(log_amplitude2))).^2);

sr_1=sum(log_amplitude1-(A1*(time1.^2)+A2*time1+A3)).^2;
sr_2=sum(log_amplitude2-A_(2)-(A_(1).*time2)).^2;

R_1=(st_1-sr_1)/st_1;                               %coefficient of determination formula for both polyfit curve and linear fitting 
R_2=(st_2-sr_2)/st_2;

figure(1)
plot(time1,log_amplitude1,'bo', time1, y1, 'r-');   %plotting the graph
grid on;
xlabel('time range between 0 and 60(seconds)');     %labeling the x-axes
ylabel('log of Amplitude(mm)');                     %labeling y-axes
legend('lnA vs time', 'fitted function');
title(['r^2 = 1, log(Amplitude) vs time with fitted function: ' num2str(A1) 'x^2' num2str(A2) 'x' num2str(A3) ]) %giving the title to the graoh

figure(2)
plot(time2,log_amplitude2,'bo', time2, y2, 'r-');   %plotting the graph with blue circle
grid on
xlabel('60 less time less 900(seconds)');           %labeling x acxes
ylabel('lnA(mm)');                                  %labeling y axes
legend('lnA vs time', 'fitted function');
title(['r^2 = 1, log(Amplitude) vs time with fitted function: ' num2str(A_(1)) 'x' num2str(A_(2))])    %giving title to the graph

fprintf('r^2 for t=0 to t=60 would be %s and for t=60 to t=900 would be %s\n',num2str(R_1),num2str(R_2)) %printing the value of coefficient of determination for both polyfit function

