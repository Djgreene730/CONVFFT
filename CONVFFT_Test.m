%%  Title:          Performance Comparison of CONV vs. FFT/IFFT
%   Author:         EIML, Howard University

clear all;


%% Setup Trial Parameters
MatrixSize = [10:10:90 100:100:900 1000:1000:9000 10000:10000:100000];
Trials = 100;

% Setup Results Matrix
Results_CONV = zeros(length(MatrixSize),Trials);
Results_FFT = zeros(length(MatrixSize),Trials);
Results_CONVFFT = zeros(length(MatrixSize),Trials);
Results_MSE = zeros(length(MatrixSize),Trials);


% Create a ProgressBar
pBar = waitbar(0,'Starting Trials...');

% Incriment the MatrixSize
for nIndex = 1:length(MatrixSize)
    
    % Set the Matrix Size
    n = MatrixSize(nIndex);
    
    % Setup Random Matrices
    A = rand(1,n);
    B = rand(1,n);
   
    % Run Trials
    for trial = 1:Trials;

        % Perallocate the Storage Matrices
        C_CONV = zeros(2*n,1);
        C_FFT = zeros(2*n,1);
        C_CONVFFT = zeros(n,1);
        
        % CONV Timing Trial
        tic();
        C_CONV = conv(A, B);
        Results_CONV(nIndex, trial) = toc();
        
        % FFT/IFFT CONV Trial
        tic();
        C_FFT = ifft(fft(A,2*n) .* fft(B,2*n));
        Results_FFT(nIndex, trial) = toc();
        
        % CONVFFT Trial
        tic();
        C_CONVFFT = CONVFFT_FULL(A,B);
        Results_CONVFFT(nIndex, trial) = toc();
       
        % Determine the MSE
        Results_MSE(nIndex, trial) = mean((C_CONVFFT - C_CONV).^2);
        
    end
    
    % Display Mean Times for Current Trial
    disp(['Trial: ' num2str(nIndex,'%0.4i') ' | Mean CONV: ' num2str(mean(Results_CONV(nIndex,:)),'%0.4f') ' | Mean FFT: ' num2str(mean(Results_FFT(nIndex,:)),'%0.4f') ' | Mean CONVFFT: ' num2str(mean(Results_CONVFFT(nIndex,:)),'%0.4f')]);
    
    
    % Update the ProgressBar
    pBar = waitbar(nIndex/length(MatrixSize), pBar, ['Computing Trial: ',num2str(nIndex),'/',num2str(length(MatrixSize))]);
        
end

% Close the ProgrssBar
close(pBar);

%% Plot Results
figure(1);
loglog(MatrixSize,mean(Results_CONV,2),MatrixSize,mean(Results_FFT,2),MatrixSize,mean(Results_CONVFFT,2));
title(['CONV vs. FFT, MatrixSize(' num2str(min(MatrixSize)) ':' num2str(max(MatrixSize)) ')']);
xlabel('Trial'); ylabel('Execution Time (s)');
legend('CONV', 'FFT', 'CONVFFT');


% Plot MSE
figure(2); loglog(MatrixSize, mean(Results_MSE,2));
title(['MSE, MatrixSize(' num2str(min(MatrixSize)) ':' num2str(max(MatrixSize)) ')']);
xlabel('Trial'); ylabel('MSE');




