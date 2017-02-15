
% Print covaraince matrix
covariance([1,2,3,4,5,6,7],[1,2,3,4,5,6,7]);

n = size(countrydata,1);
covariance_matrix = zeros(n);
for i = 1:n
    for j = 1:n
        covariance_matrix(i,j) = covariance(countrydata(i,:),countrydata(j,:));
    end
end
figure(1101)
clf
image(covariance_matrix);
colorbar
% Print correlation matrix, invariant to scaling because of the normalizing
correlation_matrix = zeros(n);
for i = 1:n
    for j = 1:n
        correlation_matrix(i,j) = correlation(countrydata(i,:),countrydata(j,:));
    end
end
figure(1102)
clf
imagesc(correlation_matrix);
colorbar


% function sqrt(Var(X)*Var(y))
% Normalize each of the features
normed_data = normalize(countrydata);

eigenvalues = pca(normed_data);
[sorted,sorted_index]= sort(eigenvalues,2,'descend');
scatterplot([normed_data(sorted_index(1),:);normed_data(sorted_index(2),:)]')

function y = normalize(x)
    c = x - mean(x);
    y = c ./ sqrt(sum(c.^2));
end
function var = variance(x)
    mx = (x - mean(x)).^2;
    var = sum(mx) / length(x);
end
function cov = covariance(x,y)
    mx = x - mean(x);
    my = y - mean(y);
    cov = sum(mx .* my);
    cov = cov / (length(mx)-1);
end
function corr = correlation(x,y)
    corr = covariance(x,y) ./ sqrt(variance(x).*variance(y));
end

function eigenvalues = pca(x)
    mx = (x - mean(x)) * (x - mean(x))';
    eigenvalues = sum(mx) / length(mx-1);
end