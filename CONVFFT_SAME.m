%%  Title:          FFT-Based Convolution (SAME)
%   Author:         David Greene, Howard University
%   Notes:          Performs a same-size convolution of A & B

%   VERSION 000:    Initial Function

function RESULT = CONVFFT_SAME(A, B)

    % Determine Lengths
    lenA = length(A);
    lenB = length(B);
    lenR = lenA + lenB;

    % Run IFFT( FFT(A) .* FFT(B) )
    RESULT = ifft(fft(A,lenR) .* fft(B,lenR));
    
    % Crop the last sample
    RESULT = RESULT(floor(lenB * 0.5) + 1  : floor(lenB * 0.5) + lenA );

end


