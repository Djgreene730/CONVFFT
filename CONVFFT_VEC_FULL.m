%%  Title:          FFT-Based Convolution (FULL)
%   Author:         David Greene, Howard University
%   Notes:          Performs a full convolution of A & B

%   VERSION 001:    Allows A(m,n) and B(1,n)

function RESULT = CONVFFT_VEC_FULL(A, B)

    % Run IFFT( FFT(A) .* FFT(B) )
    RESULT = ifft(bsxfun(@times, fft(A,size(A,2)+size(B,2),2), fft(B,size(A,2)+size(B,2))),[],2);
    
    % Crop the last sample
    RESULT = RESULT(:,1:end-1);

end


