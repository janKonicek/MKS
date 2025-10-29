clc
clear all
close all


R = 10e3;     
resolution = 2^10;

data = csvread("ntc.csv");
temp = data(:,1);
resistance = data(:,2) * 1e3;
ad = (resistance) ./ (R + resistance) * resolution;

p = polyfit(ad, temp, 10);

figure;
plot(ad, temp, 'o');
ad2 = 0:1023; 
t2 = round(polyval(p, ad2), 1); 
hold on, plot(ad2, t2, 'r'); 

xlabel('ADC Value');
ylabel('Temperature (C)');
title('NTC Thermistor ADC Value vs Temperature');


dlmwrite('data.dlm', t2*10, ',');

