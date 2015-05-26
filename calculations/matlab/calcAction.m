function a = calcAction(x,y,lambda,n)
a = n*lambda * Ham(x) - n*lambda * (1-abs(x)) * x - 2*x*y;