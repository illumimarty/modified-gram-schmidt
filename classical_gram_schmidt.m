
function U = classical_gram_schmidt(V)
    % inputs a set of vectors V
    % outputs an orthonormal vector set based on V

%% Variable Declaration
    n = size(V, 1);
    k = size(V, 2);
    U = zeros(n, k);
    R = zeros(n, k);

%% Classical Gram Schmidt Process
    % Pseudocode from Wikipedia
    % (written in terms of 3 utility functions to compare with MGS)
    for j = 1:k
        R(:,j) = V(:,j);
        Rj = R(:,j);
        for i = 1: j-1
            Rj = Rj - proj(U(:,i),V(:,j));
        end
        U(:,j) = Rj / vec_length(Rj);
    end
end

%% Projection of Two Vectors
function P = proj(U,V)
    P = (inner_prod(U,V)).*U./(inner_prod(U,U));
end

%% Inner Product of Two Vector
function prod = inner_prod(U, V)
    % V = column vector to be projected
    % U = column vector that V is projected onto
    
    mat = U.*V;
    prod = 0;
    for k = 1:size(mat)
        prod = prod + mat(k);
    end
end

%% Length of a Vector
function length = vec_length(v)
    % v = column vector
    sum = 0;
    for k = 1:size(v)
        sum = sum + v(k).^2;
    end
    
    length = sqrt(sum);
end