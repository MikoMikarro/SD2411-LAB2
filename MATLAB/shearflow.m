function [] = shearflow(P, Ixx, tf, h, tw, b)

s1 = linspace(0, b, 200);
s2 = linspace(0, h, 200);
s3 = linspace(0, b, 200);

q1s = P/Ixx * tf*h/2 * s1;
q2s = P/Ixx * (tw*(h/2*s2 - s2.^2/2) + tf*h*b/2);
q3s = P/Ixx * (-tf*h/2 * s3 + tf*h*b/2);


q2 = P/Ixx * (tw*(h/2*s2 - s2.^2/2));% + tf*h*b/2);
q3 =- P/Ixx * (-tf*h/2 * s3);% + tf*h*b/2);

q = horzcat(q1s, q2s, q3s);
tau = horzcat(q1s./tf, q2s./tw, q3s./tf);
s = horzcat(s1, s2 + b, s3 + b + h);

figure;
plot(s, q)
grid("on")
xlabel("s")
ylabel("q")

figure;
plot(s1,q1s/tf, Color="red")
hold on
plot(s2+b, q2/tw, Color='magenta')
plot(s3+h+b, q3/tf, Color="red")
grid("on")
xlabel("s")
ylabel("q/t")
hold off 

figure;
plot(s, tau)
grid("on")
xlabel("s")
ylabel("q/t")
end