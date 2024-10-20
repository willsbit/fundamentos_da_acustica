x = -100:1:400

gamma = 1.4
R = 287.052874 % j/kg*K

ideal_gas = sqrt(gamma*R*(273.15 + x))
linear_approx = 331.2 + 0.6*x

relative_error = 100 * abs(ideal_gas - linear_approx)./abs(ideal_gas)

figure
p = plot(x, ideal_gas,x,linear_approx)
p(1).Color = "#006400"
p(2).Color = "Blue"

legend()
grid()
title('Velocidade do som no ar em função da temperatura')
xlabel('Temperatura [°C]')
ylabel('Velocidade do som [m/s]')
legend('Gás ideal','Aproximação linear')

figure
plot(x, relative_error,'Color','Red')
grid()
title('Erro relativo da aproximação linear em função da temperatura')
xlabel('Temperatura [°C]')
ytickformat('percentage')
ylabel('Erro relativo')

