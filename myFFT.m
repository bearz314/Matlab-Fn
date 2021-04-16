%% [f,phase,amp] = myFFT(in,fs,[nxtPower2])
%  For a given data vector `in` sampled at `fs` Hz,
%  compute its phase and amplitude at frequencies 1:fs/2
%
%  nxtPower2 (default False) = if set to true, NFFT is
%  the next largest 2^n >= length(in)
function [f,phase,amp] = myFFT(in,fs,nxtPower2)

if ~isvector(in)
    error("Only 1 dimensional array allowed");
end

% magnitude from mean
m = mean(in);
x = in - m;

% compute fft with custom visual resolution
if exist("nxtPower2","var") && nxtPower2 == true
    NFFT = 2^nextpow2(length(x));
else
    NFFT = length(x);
    if mod(NFFT,2) == 1
        NFFT = NFFT + 1;
    end
end
y = fft(x,NFFT)/length(x);

% compute answers
f = fs/2*linspace(0,1,NFFT/2+1);
phase = imag(y(1:length(y)/2+1))./real(y(1:length(y)/2+1));
amp = 2*abs(y(1:NFFT/2+1)); % single-sided spectrum

if nargout == 0
    figure; plot(f,amp);
    xlabel('Frequency (Hz)')
    ylabel('Amplitude')
end

end

%% Original

% %% FFT
% m = mean(in);
% %m=0;
% x(:,1) = in(:,1) - m;
% %x=in;
% NFFT(:,1) = 2^nextpow2(length(x(:,1)));
% y(:,1) = fft(x(:,1),NFFT(:,1))/length(x(:,1));
% %power(:,1) = y(:,1).* conj(y(:,1))/(pow2(nextpow2(length(y(:,1)))));
% power(:,1)=2*abs(y(1:NFFT/2+1));
% phase=imag(y(1:length(y)/2+1,1))./real(y(1:length(y)/2+1,1));
% f(:,1) = fs/2*linspace(0,1,NFFT(:,1)/2+1);
% amp=power(1:NFFT(:,1)/2+1,1);
% figure;plot(f(:,1),amp);
% xlabel('Frequency (Hz)')
% ylabel('Amplitude')