function [values, colind, rowptr] = matrix_to_csr(A)

n=size(A);
k1=1;
k2=1;
k3=1;

for i = 1:n
	r=1;
	for j = 1:n
		if A(i,j) != 0
			values(k1) = A(i,j);
			k1=k1+1;
			colind(k2) = j;
			k2 = k2+1;
			if r == 1
				rowptr(k3) = k1-1;
				k3 = k3+1;
				r = 0;
			endif
		endif
	endfor
endfor

rowptr(k3) = k1;

endfunction
