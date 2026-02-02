% Llamar al ODE
T = [0 10];
x0 = [0  0  deg2rad(1)  0];
[t,x] = ode45(@dinamica, T, x0);

% Graficas
figure
plot(t, x(:,1))   % x
hold on % sirve para que no se borre la gráfica anterior
plot(t, x(:,2))   % xpunto
plot(t, x(:,3))   % alfa
plot(t, x(:,4))   % alfa punto
grid on
xlabel('Tiempo (s)')
ylabel('Estados')
legend('x_c','x_c punto','\alpha','\alpha punto')
title('Estados del sistema')