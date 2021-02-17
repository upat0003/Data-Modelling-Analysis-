% Name: Utkarsh Patel (student Id: 29143926)
% Task: q2b
% Date of last modification: 30th April,2018




clc;
clear all;
close all;

filename='amplitude_data.xlsx';


fileInformation=importdata(filename);

% declaring the time, amplitude and amplitude rate variables
time=fileInformation.data(:,1);
amplitude=fileInformation.data(:,2);
derivativeOfLog=fileInformation.data(:,3);

index1=find(amplitude<2);                                                   %using find built in function to find points where amplitude is less than 2
new_amplitude=amplitude(index1);                                            %give those points to amplitude, time and log(amplitude) so that they will get their values corresponding to amplitude<2            
new_time=time(index1);
log_amplitude=log(new_amplitude);
%plotting the data

subplot(1,2,1)                                                              %using right numbers in subplot to get two horizontal left ad right graph
plot(new_time,new_amplitude,'k-')                                           %PLOTTING that amplitude value vs corresponding time to get without erronus point result
grid on
hold on
xlabel('Corresponding Values of Time(s)')
ylabel('Amplitude Without Erroneous Values(mm)')                            % labeling the graph as shown here

subplot(1,2,2)
plot(new_time,log_amplitude,'r-')
grid on
xlabel('Corresponding Values of Time(seconds)')
ylabel('log(A) After removing Erroneous(mm/s)')

grid on
hold on

n=length(new_time);

for i=1:(n-1)
    if new_time(i)>=1455 && new_time(i)<=1457                               %finding that noisy data starting value using data-cursor
        index2=i;
    end
end
                                                                            %set amplitude and time values corresponding to that noisy value
consitime=new_time(1:index2);
consiamplitude=log(new_amplitude(1:index2));
figure()

plot(consitime,consiamplitude,'k-')                                         %plot consistence noisy value for amplitude vs time and labeling graph
grid on
xlabel('consistent time(seconds)')
ylabel('consistent amplitude(mm)')

grid on

fprintf('The time when amplitude goes consistently noisy is %f seconds\n', consitime(index2))  %print that starting value wgere noisy data becomes consistence
hold on
