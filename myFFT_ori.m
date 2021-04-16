function [f,phase,amp] = myFFT(in,fs)


%% FFT
m = mean(in);
%m=0;
x(:,1) = in(:,1) - m;
%x=in;
NFFT(:,1) = 2^nextpow2(length(x(:,1)));
y(:,1) = fft(x(:,1),NFFT(:,1))/length(x(:,1));
%power(:,1) = y(:,1).* conj(y(:,1))/(pow2(nextpow2(length(y(:,1)))));
power(:,1)=2*abs(y(1:NFFT/2+1));
phase=imag(y(1:length(y)/2+1,1))./real(y(1:length(y)/2+1,1));
f(:,1) = fs/2*linspace(0,1,NFFT(:,1)/2+1);
amp=power(1:NFFT(:,1)/2+1,1);
figure;plot(f(:,1),amp);
xlabel('Frequency (Hz)')
ylabel('Amplitude')

end