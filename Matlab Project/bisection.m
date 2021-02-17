% Name: Utkarsh Patel (student Id: 29143926)
% Function: bisection
% Date of last modification: 30th April,2018



function [root,iterations]=bisection(f,xL,xU,Precision)
fxL=f(xL);%The value of the function at xL
fxr=2;%Give any value greter than Precision
iterations=0;
while abs(fxr)>Precision %While loop condition must be true
    xr=(xL+xU)/2;%The mid-point of the interval
    fxr=f(xr);%The value of the function at xr
    if fxL*fxr<0
        xU=xr;%The new upper bound
    else
        xL=xr;%The new lower bound
        fxL=f(xL);
    end
    iterations=iterations+1;
end
root=xr;


