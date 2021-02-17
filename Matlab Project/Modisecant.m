% Name: Utkarsh Patel (student Id: 29143926)
% Function: Modisecant
% Date of last modification: 30th April,2018



function [root,iter] = Modisecant(f,xi,pt,precision)
%Input arguments 
%an anonymous function of f with a handle of x
%an input value of xi 
%pt is the pertubation factor
%the precision is the value set before iterations to determine the accuracy
%for the root computed

%Output arguments
%Returns the value of the root and the number of iterations

 fxi=f(xi); %initial value of fxi
 fxpt = f(xi + pt*xi); %initial value of fxpt based on the pertubation factor
i = 0; %initial iteration number

%the loop will go on so long as the absolute value of fxr is larger than
%the value of the precision 
 while abs(fxi)> precision 
     i = i + 1; 
     xi = xi - ((pt*xi.*fxi)./(fxpt - fxi));
     fxi=f(xi);
     fxpt = f(xi + pt*xi);
 end

    root = xi; 
    iter = i; 
end