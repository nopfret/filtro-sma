function graficofft(x,Fs)
y = fft(x);
z = fftshift(y);

ly = length(y);
f = (-ly/2:ly/2-1)/ly*Fs;
subplot(2,1,2)
stem(f,abs(z))
title("Gráfico do sinal no domínio da frequencia (modulo da FFT)")
xlabel("Frequencia (Hz)")
ylabel("|y|")
grid
end