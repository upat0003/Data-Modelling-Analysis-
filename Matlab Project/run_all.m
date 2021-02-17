clear all; close all; clc;

%demonstrators will only run this file
%ensure that everything works when this file is run
%enure that you suppress all unnecessary outputs

%question1
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
pause(10)

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

pause(10)



%%Section 1C
% Name: Utkarsh Patel (student Id: 29143926)
% Task: q1c
% Date of last modification: 30th April,2018


disp('Modified secant method is most preferable root finding method ')          %displaying why modified secant method is more preferable over other root finding methods
disp('As it requires less iterations than secant and newton raphson root finding method')
disp('With less iteration, it would be more efficient than any other methods')

pause(10)



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

pause(10)





%question 2
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

pause(10)


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
pause(10)



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

pause(10)


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

pause(10)



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