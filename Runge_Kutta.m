f = @(x, y) y + 3*x - x.^2;
t = 0.0;
y = 1.0;
last_value = 5;
y_ = double.empty(50,0);
y_ = [y_,y];
while t + h <= last_value
    k1 = h * f(t, y);
    k2 = h * f(t + 0.5 * h, y + 0.5 * k1);
    k3 = h * f(t + 0.5 * h, y + 0.5 * k2);
    k4 = h * f(t + h, y + k3);
    
    y = y + (1.0/6.0) * (k1 + 2 * k2 + 2 * k3 + k4);
    t = t + h;
    y_ = [y_,y];
    result = y
end
x = 0:h:5;
f_ = (2 * exp(x) )+ x .^2 - x - 1;
plot(x, f(x, y_))
hold on
plot(x, f_,'r')
