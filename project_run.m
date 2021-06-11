
clc; close all; clear variables;

%% MATH 131 Group 12: Final Project Run File
% Use this  file to run the different functions: modified_gram_schmidt.m,
% classical_gram_schmidt.m, and vectarrow.m 

% "vectarrow.m": 

% INPUT: matrix A where the columns are linearly independent (not multiples
% of each other)

% NOTE: Make sure the matrix is square to ensure linear independence!
% (number of rows match number of columns!)

%% Demonstration Chooser
% '1' shows a 3x3 matrix passed through MGS, and the
%     output is graphed in 3D space.
% '2' shows a 4x3 matrix passed through MGS, in which the output is used to
%     determine a QR factorization for A.
% '3' shows a 2x2 matrix passed through MGS, in which the output is graphed
%     in 2D space
% '4' is an error analysis between MGS and CGS. We compare the methods by
%     passing them with a two kinds of matrices as k grows large, a random 
%     kxk matrix and a kxk Hilbert matrix (one that "notoriously difficult
%     to use in numerical computation") (Wikipedia).

demo = '4';

switch demo
    
%% Using MGS with a 3x3 Matrix and Graphing it
    case '1'
        A = [1 1 1;
            -1 0 1;
            1 1 2];
        B = modified_gram_schmidt(A)
        
        % Graphing B
        origin = [0 0 0]';
        vectarrow(origin, B(:,1));
        hold on;
        vectarrow(origin, B(:,2));
        hold on;
        vectarrow(origin, B(:,3));

%% Using MGS with a 4x3 matrix in QR Factorization
    case '2'
        A = [1 0 0;
            1 1 0;
            1 1 1;
            1 1 1];

        % Showing that A = QR
        Q = modified_gram_schmidt(A)
        R = Q' * A
        QR = Q * R
        
%% Using MGS with a 2x2 matrix and Graphing it
    case '3' % Vectors in R^2
        A = [1 0;
            1 1];
        B = classical_gram_schmidt(A)
        
        % Graphing B
        origin = [0 0]';
        vectarrow(origin, B(:,1));
        hold on;
        vectarrow(origin, B(:,2));
        
%% Error Analysis between CGS and MGS
    case '4'
        
        % Choose any n value > 0
        % NOTE: values > 100 will run slower!
        n = 100;

        % Variable Declaration
        CGS_error = zeros(n,1);
        MGS_error = zeros(n,1);
        CGS_count = 0;
        MGS_count = 0;
        
        for k = n:-1:1
            disp(k); % Shows the "loadtime progress" of computing the kxk matrix
            
            % Comment out ONLY ONE A matrix
%             A = rand(k);                    % Random integer kxk matrix
            A = 0.00001*eye(k)+hilb(k);   % kxk Hilbert matrix

            % Computes orthonormal basis vectors
            Q1 = classical_gram_schmidt(A);
            Q2 = modified_gram_schmidt(A);
            
            % Computes error
            CGS_error(k) = abs(norm(eye(k) - (Q1' * Q1)));
            MGS_error(k) = abs(norm(eye(k) - (Q2' * Q2)));
            
            % Comparison count between the two methods
            if MGS_error(k) < CGS_error(k) 
                MGS_count = MGS_count + 1; 
            else
                CGS_count = CGS_count + 1;
            end
        end
        
        disp(MGS_count) % we want this to win and be the highest 
        disp(CGS_count) % we want this to lose to MGS_count

        % Graphing the Result
        scatter(1:1:n, CGS_error);
        hold on
        scatter(1:1:n, MGS_error,'filled');
        hold on

        set(gca,'yscale','log','FontSize',15);
        title('Classical and Modified Gram Schmidt Process: Error Analysis')
        legend('CGS Error', 'MGS Error')
        xlabel('Size of k\times k matrix (k)')
        ylabel('Error comparing to k\times k Identity matrix')
end

