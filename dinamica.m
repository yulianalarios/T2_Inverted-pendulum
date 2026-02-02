% Función dinámica (espacios de estado)
function dx = dinamica(t,x)

% Parámetros
Ip = 0.0079;
Mc = 0.7031;
lp = 0.3302;
Mp = 0.23;
Fc = 0;
Beq = 4.3;
Bp = 0.0024;
g = 9.81;

dx = zeros(4,1);

% Nuevas variables
% xc        = x(1);  % dx(1) = dx       -esta variable no se usa en la ecuación
xpunto    = x(2);    % dx(2) = ddx
alfa      = x(3);    % dx(3) = da
alfapunto = x(4);    % dx(4) = dda 

% Simplificar términos
denominador = (Mc+Mp)*Ip + Mc*Mp*lp^2 + Mp^2*lp^2*(sin(alfa))^2;
ddx = ((Ip + Mp*lp^2)*Fc + Mp^2*lp^2*g*cos(alfa)*sin(alfa) - (Ip + Mp*lp^2)*Beq*xpunto - (Ip*Mp*lp - Mp^2*lp^3)*(alfapunto^2)*sin(alfa) - Mp*lp*Bp*alfapunto*cos(alfa)) / denominador;
dda = ((Mc + Mp)*Mp*g*lp*sin(alfa) - (Mc + Mp)*Bp*alfapunto + Fc*Mp*lp*cos(alfa) - Mp^2*lp^2*(alfapunto^2)*sin(alfa)*cos(alfa) - Beq*Mp*lp*xpunto*cos(alfa)) / denominador;

% Espacios de estado
dx(1) = x(2);
dx(2) = ddx;
dx(3) = x(4);
dx(4) = dda;

end
