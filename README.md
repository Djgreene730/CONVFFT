- - - - - - - - - - - - - - - - - - - - - - - - - - -
Title:          FFT-Based Convolution Functions
Author:         David Greene, Howard University
- - - - - - - - - - - - - - - - - - - - - - - - - - -

Description:

Takes the convolution of A & B using the IFFT/FFT
method.

 CONVFFT_FULL
  Takes the full convolution of A & B, which are
  1xn or mx1 vectors. Similar to conv(A,B).

 CONVFFT_SAME
  Takes the center of the full convolution of A & B,
  which are 1xn or mx1 vectors, returning length(A).
  Similar to conv(A,B,'same').

 CONVFFT_VEC_FULL
  Performs the same routine as CONVFFT_FULL but A can
  be an mxn matrix and B is a 1xn vector. The result
  contains the convolution of each row in A against B.

 CONVFFT_VEC_SAME
  Performs the same routine as CONVFFT_SAME but A can
  be an mxn matrix and B is a 1xn vector. The result
  contains the convolution of each row in A against B
  and returns a matrix with the same dimensions as A.


- - - - - - - - - - - - - - - - - - - - - - - - - - -

CHANGELOG:

- - - - - - - - - - - - - - - - - - - - - - - - - - -

Version 001: 2014-05-08
 - Added vectorized functions.

Version 000: 2014-05-08
 - Initial release.
