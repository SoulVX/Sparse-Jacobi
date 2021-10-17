function [A, b] = generate_probabilities_system(rows)
n = rows*(rows+1)/2;
A = zeros(n);
b = zeros(n,1);
  
for i = 1:rows
	for j = 1:i
		UL=(i-2)*(i-1)/2+j-1;
		UR=(i-2)*(i-1)/2+j;
		L=i*(i-1)/2+j-1;
		curr = i*(i-1)/2+j;
		R=i*(i-1)/2+j+1;
		DL=i*(i+1)/2+j;
		DR=i*(i+1)/2+j+1;
      
		if j == 1
			if i == 1
				%Varf sus
				A(curr,DL) = -1;
				A(curr,DR) = -1;
				A(curr,curr) = 4;
			elseif i == rows
				%Varf stanga
				A(curr,UR) = -1;
				A(curr,R) = -1;
				A(curr,curr) = 4;
				b(curr) = 1;
			else
				%Latura stanga
				A(curr,UR) = -1;
				A(curr,R) = -1;
				A(curr,DL) = -1;
				A(curr,DR) = -1;
				A(curr,curr) = 5;
			endif
			
		elseif j == i
			if i == rows
				%Varf dreapta
				A(curr,UL) = -1;
				A(curr,L) = -1;
				A(curr,curr) = 4;
				b(curr) = 1;
			else
				%Latura dreapta
				A(curr,UL) = -1;
				A(curr,L) = -1;
				A(curr,DL) = -1;
				A(curr,DR) = -1;
				A(curr,curr) = 5;
			endif
			
		elseif i == rows && j > 1 && j < rows
			%Latura jos
			A(curr,UR) = -1;
			A(curr,R) = -1;
			A(curr,UL) = -1;
			A(curr,L) = -1;
			A(curr,curr) = 5;
			b(curr)=1;  
		  
		else
			%Interior
			A(curr,UR) = -1;
			A(curr,R) = -1;
			A(curr,UL) = -1;
			A(curr,L) = -1;
			A(curr,DL) = -1;
			A(curr,DR) = -1;
			A(curr,curr) = 6;
			
		  endif 
    endfor
endfor
endfunction
