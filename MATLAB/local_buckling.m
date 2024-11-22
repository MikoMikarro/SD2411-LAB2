function [] = local_buckling(h,b,tf,tw,E, A)
pcr_f = 0.38*E*(tf/b)^2*A;
pcr_w = 3.6*E*(tw/h)^2*A; 
disp("local buckling")
disp("flange")
disp(pcr_f)
disp("web")
disp(pcr_w)
end