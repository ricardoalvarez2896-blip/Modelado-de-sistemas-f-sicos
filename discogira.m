% Parámetros del sistema[cite: 1]
m = 10;    % Masa (kg)[cite: 1]
r = 0.05;  % Radio (m)[cite: 1]
k = 100;   % Constante del resorte (N/m)[cite: 1]

% Condiciones iniciales: x0 = [theta_0; theta_punto_0][cite: 1]
x0 = [0; 2];[cite: 1]

% Tiempo de simulación (0 a 10 segundos)
tspan = [0 10];

% Sistema de ecuaciones de estado[cite: 1]:
% dx1/dt = x2
% dx2/dt = - (2 * k / (3 * m)) * x1
sistema = @(t, x) [x(2); -(2 * k / (3 * m)) * x(1)];[cite: 1]

% Resolver la ecuación diferencial usando ode45[cite: 1]
[t, x] = ode45(sistema, tspan, x0);

% Graficar resultados
figure;
plot(t, x(:, 1), 'b-', 'LineWidth', 1.5); hold on;
plot(t, x(:, 2), 'r--', 'LineWidth', 1.5);
grid on;
xlabel('Tiempo (s)');
ylabel('Respuesta');
legend('\theta (rad)', '\dot{\theta} (rad/s)');
title('Respuesta del sistema disco-resorte');