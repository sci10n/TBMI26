function [ Y, L, H ] = runMultiLayer( X, W, V )
%RUNMULTILAYER Calculates output and labels of the net
%   Inputs:
%               X  - Features to be classified (matrix)
%               W  - Weights of the hidden neurons (matrix)
%               V  - Weights of the output neurons (matrix)
%
%   Output:
%               Y = Output for each feature, (matrix)
%               L = The resulting label of each feature, (vector) 

 H = W*X;
 H = tanh(H);
 % H = [ones(1,size(X,2)); H];
 H(1,:) = ones(1,size(X,2));
 Y = V*H;

% Calculate classified labels
[~, L] = max(Y,[],1);
L = L(:);

end

