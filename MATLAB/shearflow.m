function [s,q] = shearflow(P, Ixx, tf, h, tw, b)

s1 = linspace(0, b, 20);
s2 = linspace(0, h, 100);
s3 = linspace(0, b, 20);

q1 = P/Ixx * tf*h/2 * s1;
q2 = P/Ixx * (tw*(h/2*s2 - s2.^2/2) + tf*h*b/2);
q3 = P/Ixx * (-tf*h/2 * s3 + tf*h*b/2);

q = horzcat(q1, q2, q3);
tau = horzcat(q1/tf, q2/tw, q3/tf);
s = horzcat(s1, s2 + b, s3 + b + h);

figure;
plot(s, q)
grid("on")
xlabel("s")
ylabel("q")

figure;
plot(s,tau)
plot(s, q)
grid("on")
xlabel("s")
ylabel("q/t")
end