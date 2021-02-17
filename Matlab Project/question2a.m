% Name: Utkarsh Patel (student Id: 29143926)
% Task: Q2a
% Date of last modification: 30th April,2018


% import the data
clc;                                                                        % Clear all commands and anything running from command window and workspace
clear all;
close all;

filename='amplitude_data.xlsx';                                             %entering the file name
fileInformation=importdata(filename);                                       %importing all data inside that file

time=fileInformation.data(:,1);                                             % getting data from file's first columns
amplitude=fileInformation.data(:,2);                                        % getting data from 2nd column
derivativeOfLog=fileInformation.data(:,3);                                  % getting data from 3rd column
log_amplitude=log(amplitude);                                               % introducing new variable to convert into log function for plotting


%plotting the data

subplot(2,2,[1,3])                                                          %using subplot to plot 2 figure in one
plot(time,amplitude,'k-')                                                   %plotting amplitude vs data with black continuous line
xlabel('Time(seconds)')
ylabel('Amplitude(mm)')                                                     %labeling the graph
grid on
hold on


subplot(2,2,[2,4])                                                          % SUBPLOT AGAIN and plotting same way for log(amplitude) vs time
plot(time,log_amplitude,'b-')
xlabel('Time(seconds)')
ylabel('log(Amplitude) (mm/s)')
grid on
