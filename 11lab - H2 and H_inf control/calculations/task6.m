% 6 task

% plant parameters
A = [0 1; 0 0];
B1 = [-2 1 0; 1/2 3 0];
B2 = [0; 1];
C1 = [1 0];
D1 = [0 0 2];
C2 = [2 -1; 7 0; 0 0];
D2 = [0; 0; 3];
g = 33.7; % 50 40 35 33.7

% find regulator matrix
[Q, ~, ~] = icare(A,B2,C2'*C2,D2'*D2,0,eye(2),(g.^-2).*B1*B1')
K = -inv(D2'*D2)*B2'*Q

% find observer matrix
[P, ~, ~] = icare(A',C1',B1*B1',D1*D1',0,eye(2),(g.^-2).*C2'*C2)
L = -P*inv(eye(2)-(g.^-2).*Q*P)*(C1+(g.^-2).*D1*B1'*Q)'*inv(D1*D1')

% eigenvalues
eig(Q)
eig(P)
max(eig(P*Q))
g^2

% transfer functions
W1 = [tf([-4.5 -24.3023 -86.3282 -1.2737],[1 5.62274 13.353 15.9313 7.31332]) tf([-1 0.377256 36.3148 87.4311],[1 5.62274 13.353 15.9313 7.31332]) tf([31.8626 -49.0986 -29.2533],[1 5.62274 13.353 15.9313 7.31332]);
    tf([-14 -75.2184 -167.262 46.7353],[1 5.62274 13.353 15.9313 7.31332]) tf([7 60.3592 211.548 280.412],[1 5.62274 13.353 15.9313 7.31332]) tf([-223.038 -102.387],[1 5.62274 13.353 15.9313 7.31332]);
    tf([95.5878 557.449 1377.77 205.151 -146.482],[1 11.2455 58.3212 166.092 275.192 253.851 97.6545]) tf([-47.7939 -434.055 -1633.57 -2577.62 -878.89],[1 11.2455 58.3212 166.092 275.192 253.851 97.6545]) tf([-95.5878 -581.346 -1523.11 -585.927 0 0],[1 11.2455 58.3212 166.092 275.192 253.851 97.6545])];

W2 = [tf([-4.5 -35.9061 -154.425 -6.1059],[1 8.20135 22.6112 30.4382 14.3586]) tf([-1 -2.20135 57.0351 150.026],[1 8.20135 22.6112 30.4382 14.3586]) tf([60.8764 -93.0356 -57.4342],[1 8.20135 22.6112 30.4382 14.3586]);
    tf([-14 -111.319 -287.852 79.1392],[1 8.20135 22.6112 30.4382 14.3586]) tf([7 78.4095 330.507 474.835],[1 8.20135 22.6112 30.4382 14.3586]) tf([-426.135 -201.02],[1 8.20135 22.6112 30.4382 14.3586]);
    tf([182.629 1538.3 4440.03 738.98 -486.997],[1 16.4027 112.485 401.323 775.26 806.004 324.664]) tf([-91.3145 -1065.92 -4793.95 -8228.03 -2921.98],[1 16.4027 112.485 401.323 775.26 806.004 324.664]) tf([-182.629 -1583.96 -4836.02 -1947.99 0 0],[1 16.4027 112.485 401.323 775.26 806.004 324.664])];

W3 = [tf([-4.5 -107.22 -571.735 -35.9667],[1 24.0488 79.36 119.332 57.6633]) tf([-1 -18.0488 184.265 533.823],[1 24.0488 79.36 119.332 57.6633]) tf([238.664 -362.002 -230.653],[1 24.0488 79.36 119.332 57.6633]);
    tf([-14 -333.183 -1026.87 277.76],[1 24.0488 79.36 119.332 57.6633]) tf([7 189.342 1060.54 1666.56],[1 24.0488 79.36 119.332 57.6633]) tf([-1670.65 -807.287],[1 24.0488 79.36 119.332 57.6633]);
    tf([715.993 17385.8 60750.4 11171.6 -6864.24],[1 48.0976 737.064 3936.35 9225.46 10856.9 4576.16]) tf([-357.997 -9856.36 -58917.9 -111441 -41185.4],[1 48.0976 737.064 3936.35 9225.46 10856.9 4576.16]) tf([-715.993 -17564.8 -65141.6 -27457 0 0],[1 48.0976 737.064 3936.35 9225.46 10856.9 4576.16])];

W4 = [tf([-4.5 -2155.37 -12551.9 -894.614],[1 479.1938 1708.537921 2671.3341 1301.5758]) tf([-1 -473.194 3837.96 11552.8],[1 479.1938 1708.537921 2671.3341 1301.5758]) tf([5342.67 -8082.18 -5206.3],[1 479.1938 1708.537921 2671.3341 1301.5758]);
    tf([-14 -6705.21 -22242.4 5979.88],[1 479.1938 1708.537921 2671.3341 1301.5758]) tf([7 3375.36 22022.8 35879.3],[1 479.1938 1708.537921 2671.3341 1301.5758]) tf([-37398.7 -18222.1],[1 479.1938 1708.537921 2671.3341 1301.5758]);
    tf([16028 7684320 29204600 5561080 -3335690],[1 958.388 233044 1640110 4200490 5187780 2223790]) tf([-8014 -3868210 -27095800 -53361400 -20014100],[1 958.388 233044 1640110 4200490 5187780 2223790]) tf([-16028 -7688330 -31126700 -13342800 0 0],[1 958.388 233044 1640110 4200490 5187780 2223790])];

% plot amplitude frequency response
% first case
% ampW1 = bodeplot(W1);
% setoptions(ampW1,'FreqScale','linear','MagUnits','abs','Grid','on','PhaseVisible','off','IOGrouping','all');
% xlim([0 5]);
% second case
% ampW2 = bodeplot(W2);
% setoptions(ampW2,'FreqScale','linear','MagUnits','abs','Grid','on','PhaseVisible','off','IOGrouping','all');
% xlim([0 5]);
% third case
% ampW3 = bodeplot(W3);
% setoptions(ampW3,'FreqScale','linear','MagUnits','abs','Grid','on','PhaseVisible','off','IOGrouping','all');
% xlim([0 20]);
% fourth case
% ampW4 = bodeplot(W4);
% setoptions(ampW4,'FreqScale','linear','MagUnits','abs','Grid','on','PhaseVisible','off','IOGrouping','all');
% xlim([0 200]);

% plot singular values to frequency
% first case
% sinValW1 = sigmaplot(W1);
% setoptions(sinValW1,'FreqScale','linear','MagUnits','abs','Grid','on');
% xlim([0 5]);
% second case
% sinValW2 = sigmaplot(W2);
% setoptions(sinValW2,'FreqScale','linear','MagUnits','abs','Grid','on');
% xlim([0 5]);
% third case
% sinValW3 = sigmaplot(W3);
% setoptions(sinValW3,'FreqScale','linear','MagUnits','abs','Grid','on');
% xlim([0 20]);
% fourth case
% sinValW4 = sigmaplot(W4);
% setoptions(sinValW4,'FreqScale','linear','MagUnits','abs','Grid','on');
% xlim([0 200]);

% find h_2 norm
norm(W4)

% find h_inf norm
getPeakGain(W4)