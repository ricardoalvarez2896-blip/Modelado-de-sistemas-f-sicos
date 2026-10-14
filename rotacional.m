function practica4_ejercicio1()
% Parámetros del sistema
m = 10;    % Masa (kg)
r = 0.05;  % Radio (m)
k = 100;   % Constante del resorte (N/m)

% Tiempo de simulación
tspan = [0 10];

% Condiciones iniciales: [theta(0); theta_punto(0)]
x0 = [0; 2];

% Integración numérica mediante ode45
[t, x] = ode45(@(t, x) sistema_disco(t, x, m, k), tspan, x0);

% Graficación de estados
figure;
subplot(2,1,1);
plot(t, x(:,1), 'b-', 'LineWidth', 1.5);
grid on;
ylabel('\theta (rad)');
title('Respuesta del sistema: Posición angular \theta(t)');

subplot(2,1,2);
plot(t, x(:,2), 'r-', 'LineWidth', 1.5);
grid on;
xlabel('Tiempo (s)');
ylabel('d\theta/dt (rad/s)');
title('Respuesta del sistema: Velocidad angular \theta\cdot(t)');
end

function dxdt = sistema_disco(~, x, m, k)
dxdt = zeros(2,1);
dxdt(1) = x(2);                       % dx1/dt = x2
dxdt(2) = -(2 * k / (3 * m)) * x(1);   % dx2/dt = -(2k / 3m) * x1
end