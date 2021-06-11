
function U = modified_gram_schmidt(V)
    % inputs a set of vectors V
    % outputs an orthonormal vector set based on V
    
%% Variable Declaration
    n = size(V,1);
    k = size(V,2);
    U = zeros(n,k);
    R = zeros(n,k);

%% Modified Gram Schmidt Process
    for j = 1:k
        % This step orthonormalizes the jth column of U for j = 1..k
        U(:,j) = V(:,j) ./ vec_length(V(:,j));
        Uj = U(:,j);                            
        for p = j+1:k
            % This intermediate step prepares the p+1th vector of V in
            % efforts to reduce error caused in the classical GS process
            % using the prorjection of V_p onto U_j
            V(:,p) = V(:,p) - proj(Uj,V(:,p));
        end
    end
end

%% Projection of Two Vectors
function P = proj(U,V)
    % U,V input vectors
    % P = resultant vectors
    
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
