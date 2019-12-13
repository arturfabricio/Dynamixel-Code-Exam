%% Fourier Series %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all; clc                                       %                                                
syms t                                               %
syms n                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% A0 variables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     fun_a0 = @(t) -2*t.^2;                          %
     q_a0 = integral(fun_a0,-pi,pi);                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
%% Time Variables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = 2*pi; % second                                   %
N = 150; % resolution                                %
i = 0;                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% For Loop for the simulation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                                                      %
for t = linspace(-T, T, N)                                                            %
     i = i + 1; time(i) = t;                                                          %
     y(i) = -2*t^2;                                                                   %
                                                                                      %
     a0 = 1/(2*pi) * q_a0;                                                            %
     %an and bn were calculated in paper                                              %
     an = -1/(pi*(n.^3))*(4*((pi.^2)*sin(n*pi)*n.^2+2*n*cos(n*pi)*pi-2*sin(n*pi)));   %
     bn = 0;                                                                          %
                                                                                      %
     sum1 = (an*cos(n*t) + bn*sin(n*t));                                              %
     f(i) = a0 + symsum(sum1,n,1,10);           %N = 10                               %
     x(i) = a0 + symsum(sum1,n,1,1);            %N = 1                                %
end                                                                                   %
                                                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Plotting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)                                              %                  
clf                                                    %                 
figure(1)                                              %                  
hold on                                                %                                        
plot(time, y, 'b','Linewidth',1)                       %
plot(time, x, 'r','Linewidth',1)                       %
plot(time, f, 'g','Linewidth',1)                       %
hold off                                               %                
title('Fourier Series')                                % 
legend('Original Function', 'N=1', 'N=10')             %                                                                    
grid on;                                               %                  
xlabel('Time [s]');                                    %
xlim([-6.4 6.4]);                                      %
ylim([-25 5]);                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%