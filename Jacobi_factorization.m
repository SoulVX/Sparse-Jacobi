function [G_J, c_J] = Jacobi_factorization(A, b)

n = size(A);

D = L = U = zeros(n,n);

for i = 1:n
	D(i,i) = A(i,i);
endfor

for i = 1:n
	for j = i+1:n
		U(i,j) = -A(i,j);
	endfor
endfor

for i = 1:n
	for j = 1:i-1
		L(i,j) = -A(i,j);
	endfor
endfor

G_J = inv(D) * (L+U);
c_J = inv(D) * b;

endfunction
