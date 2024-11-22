function [] = warping(xi_s, T, G, J, h, b)
s1 = linspace(0,h/2,100);
s2 = linspace(0,b,100);

w1 = xi_s * (h/2 - s1 )* T / G / J * 1000;
w2 = h/2 * (xi_s-b+s2) * T / G / J * 1000;

figure;
plot(s1+b, w1, Color="blue")
hold on
plot(s2,w2, Color="blue")
plot(s1+b+h/2, -w1(end:-1:1), Color="blue")
plot(s2+b+h, -w2(end:-1:1), Color="blue")
xlabel("s")
ylabel("warping (mm)")
end