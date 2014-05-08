%%  Title:          FFT-Based Convolution (SAME)
%   Author:         David Greene, Howard University
%   Notes:          Performs a same-size convolution of A & B

%   VERSION 001:    Allows A(m,n) and B(1,n)

function RESULT = CONVFFT_VEC_SAME(A, B)

    % Determine Lengths
    lenA = size(A,2);
    lenB = size(B,2);
    lenR = lenA + lenB;

    % Run IFFT( FFT(A) .* FFT(B) )
    RESULT = ifft(bsxfun(@times, fft(A,lenR,2), fft(B,lenR)),[],2);
    
    % Crop the last sample
    RESULT = RESULT(:,floor(lenB * 0.5) + 1  : floor(lenB * 0.5) + lenA );

end


