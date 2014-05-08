%%  Title:          FFT-Based Convolution (FULL)
%   Author:         David Greene, Howard University
%   Notes:          Performs a full convolution of A & B

%   VERSION 000:    Initial Function

function RESULT = CONVFFT_FULL(A, B)

    % Run IFFT( FFT(A) .* FFT(B) )
    RESULT = ifft(fft(A,length(A)+length(B)) .* fft(B,length(A)+length(B)));
    
    % Crop the last sample
    RESULT = RESULT(1:end-1);

end


