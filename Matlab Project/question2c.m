% Name: Utkarsh Patel (student Id: 29143926)
% Task: q2c
% Date of last modification: 30th April,2018




clc;
clear all;
close all;

filename='amplitude_data.xlsx';

fileInformation=importdata(filename);

time=fileInformation.data(:,1);
amplitude=fileInformation.data(:,2);
derivativeOfLog=fileInformation.data(:,3);

i=find(time<=900);                                                          %find all points where time<=900 and set time and amplitude values corresponding to that
new_time=time(i);
next_amplitude=amplitude(i);

index=find(next_amplitude<2);                                               %finding point where amplitude<2 and set all values
t=time(index);
final_amplitude=next_amplitude(index);

log_amplitude=log(final_amplitude);


% data for the first segment

j=find(t>=0 & t<=60);                                                       %find points between time range of 0 and 60 and set values of time and amplitude corresponding that range
final_time1=t(j);
log_amplitude1=log_amplitude(j);

subplot(3,1,1)
plot(final_time1,log_amplitude1,'m-','LineWidth',5)                         %use subplot with having three as raw so that three graph will be vertically in a figure
title(['Errorless Data for t>=0 and t<=900'])                               %plotting it for log_amplitude1 vs final_time1 with meganda colour and 5 as line width and labelling the graph                    
xlabel('Time Range between 0 and 60(seconds)')
ylabel('log of Amplitude(mm) ')
grid on
hold on


% data for the second segment

k=find(t>=60 & t<=900);                                                    % find points between time 60 and 00 and set time and log of amplitude values corresponding to that
final_time2=t(k);
log_amplitude2=log_amplitude(k);

subplot(3,1,2)
plot(final_time2,log_amplitude2,'r-','LineWidth',5)                         %subplotting- plot it in the middle with red cotinuous line
xlabel('Time Range between 60 and 900(seconds)')
ylabel('log of Amplitude')
grid on
hold on



%plotting
subplot(3,1,3)
plot(final_time1,log_amplitude1,'m-',final_time2,log_amplitude2,'r-','LineWidth',5)
grid on
xlabel('Time between 0 and 900(seconds)')
ylabel('log of Amplitude')
