function [] = combined_buckling(E, Ixx, Iyy, I0, GJ,L ,b, h, tf, tw, xi, A, xs)

gamma = tw*xi^2*h^3/12 + tf*h^2/2*(xi^2*b-xi*b^2+b^3/3);


Pxx = pi^2*E*Ixx/4/L^2;
Pyy = pi^2*E*Iyy/4/L^2;
Prot =  A/I0*(GJ+pi^2*E*gamma/L^2);



A = @(x) [x-Pxx, -x*xs;-x*xs, I0/A*(x-Prot)];
det_A = @(x) det(A(x));
% solution = fzero(det_A, 0);

% Définir une plage de valeurs initiales
x_values = linspace(0,Pxx, 20); % Points initiaux potentiels

% Initialiser un tableau pour stocker les solutions
solutions = [];
for x0 = x_values
    % Essayer de trouver une solution proche de x0
    try
        sol = fzero(det_A, x0);
        % Ajouter uniquement les solutions uniques (éviter les doublons)
        if isempty(solutions) || all(abs(solutions - sol) > 1e-6)
            solutions = [solutions; sol];
        end
    catch
        % Ignorer les erreurs si fzero échoue
        continue;
    end
end


disp(solutions);



end