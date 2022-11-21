clc
clear all
close all

open amostras_temperatura.mat
dd = ans;

Fs = 1e3;
t = 0:(5e-3):10;



%% 1a)


subplot(2,1,1)
plot(t,dd.amostras_temperatura)
title(" Gráfico do sinal original no domínio do tempo")
xlabel("Tempo")
ylabel("Temperatura °C")

graficofft(dd.amostras_temperatura,Fs)

%% 1b)
m = 17;
b1 = (1/m)*ones(1,m);
a1 = [1];

[h1,w1] = freqz(b1,a1);
figure(1)
plot(h1)
subplot(2,1,1)
plot((w1/(2*pi))*Fs,20*log10(abs(h1)))
xlabel('Frequência (Hz)')
ylabel('Magnitude (dB)')
subplot(2,1,2)
plot((w1/(2*pi))*Fs,phase(h1)*180/pi)
xlabel('Frequência (Hz)')
ylabel('Fase (graus)')

%% 1c)

y = filter(b1,a1,dd.amostras_temperatura);
figure;
subplot(2,1,1)
plot(t,y)
title(" Gráfico do sinal original no domínio do tempo")
xlabel("Tempo")
ylabel("Temperatura °C")

graficofft(y,Fs)


%% 2 a)
b = 1;


 b2 = b*ones(size(dd.amostras_temperatura,2));

a(1) = b2(1);
for i = 2:size(dd.amostras_temperatura,2)

    a2(i) = a2(i-1)*(1-b);

end

[h2,w2] = freqz(b2,a2);
figure(2)
plot(h2)
subplot(2,1,1)
plot((w2/(2*pi))*Fs,20*log10(abs(h2)))
xlabel('Frequência (Hz)')
ylabel('Magnitude (dB)')
subplot(2,1,2)
plot((w2/(2*pi))*Fs,phase(h2)*180/pi)
xlabel('Frequência (Hz)')
ylabel('Fase (graus)')












