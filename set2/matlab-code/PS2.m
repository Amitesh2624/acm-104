%[text]{"align":"center"} # **ACM/IDS 104 \- Problem Set 2 \- MATLAB Problems**
%[text] *Before writing your MATLAB code, it is always good practice to get rid of any leftover variables and figures from previous scripts.*
clc; clear; close all;
%%
%[text] ## Problem 6 (10 points) Fundamental Matrix Subspaces
%[text] Your task for this problem is to write a function that takes a matrix $\\texttt{A}$ as its argument, and outputs four matrices: $\\texttt{K, I, cK}$ and $\\texttt{cI}$ where:
%[text] - Columns of $\\texttt{K}$ form a basis of the kernel of $\\texttt{A\n}$. If $\\text{ker}A = \\{0\\}$, then $\\texttt{K}$ must be a zero vector of the appropriate dimension.
%[text] - Columns of $\\texttt{I}$ form a basis of the image of $\\texttt{A\n}$. If $\\text{im}A = \\{0\\}$, then $\\texttt{I}$ must be a zero vector of the appropriate dimension.
%[text] - Columns of $\\texttt{cK}$ form a basis of the cokernel of $\\texttt{A\n}$. If $\\text{coker}A = \\{0\\}$, then $\\texttt{cK}$ must be a zero vector of the appropriate dimension.
%[text] - Columns of $\\texttt{cI}$ form a basis of the coimage of $\\texttt{A\n}$. If $\\text{coim}A = \\{0\\}$, then $\\texttt{cI}$ must be a zero vector of the appropriate dimension. \
%[text] Move to the bottom of this livescript to write the function.
%[text] Now, let us test our function:
A = [2 0; 2 2; 20 24] % feel free to define A as you like %[output:0e2e4503]
[K, I, cK, cI] = subspacer(A); % this is how you call a MATLAB function
disp(K); %[output:6a62e06b]
disp(I); %[output:0748298e]
disp(cK); %[output:63fddb4c]
disp(cI); %[output:35fae475]
%%
%[text] <u>***START HERE***</u> by writing the function:
function [K, I, cK, cI] = subspacer(A)
%{
This is the MATLAB function syntax. 
-> [K, I, cK, cI] are the outputs of the function.
-> "subspacer" is the name of the function. (you can change that if
                            you wish but make sure you change
                            every function call as well!)
-> A is the argument of the function.
%}
[m, n] = size(A);
r = rank (A);
r2 = rank(A');
%{
We start by finding out the dimensions and rank of A.
Let us consider the matrix K. There exist 2 cases:
1) The kernel is trivial i.e. kerA = {0}
2) The kernel is not trivial -> Hint: use null()
Complete the following if/else statement.
%}
if r == n % this condition is done for you
    K = zeros(n,1);
else
    K = null(A);
end
%{
Now, let us consider the matrix cK. 
As above, there exist 2 cases. Remember, you can use ' to
transpose a matrix.
Write a similar if/else statement to produce cK.
%}
if r2 == m
    cK = zeros(m,1);
else
    cK = null(A');
end

%{
For the image I and coimage cI, there exists only 1 condition
we must test, and that is if rankA = 0. With this in mind,
complete the following if/else statement.
-> Hint: orth() is useful here.
%}
if r == 0
    I = zeros(m,1);
    cI = zeros(n,1);
    
else
    I = orth(A);
    cI = orth(A');
    
end
end


%[text] 

%[appendix]
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":39.7}
%---
%[output:0e2e4503]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"A","rows":3,"type":"double","value":[["2","0"],["2","2"],["20","24"]]}}
%---
%[output:6a62e06b]
%   data: {"dataType":"text","outputData":{"text":"     0\n     0\n\n","truncated":false}}
%---
%[output:0748298e]
%   data: {"dataType":"text","outputData":{"text":"   -0.0409   -0.9856\n   -0.0897   -0.1597\n   -0.9951    0.0549\n\n","truncated":false}}
%---
%[output:63fddb4c]
%   data: {"dataType":"text","outputData":{"text":"   -0.1638\n    0.9831\n   -0.0819\n\n","truncated":false}}
%---
%[output:35fae475]
%   data: {"dataType":"text","outputData":{"text":"   -0.6423   -0.7665\n   -0.7665    0.6423\n\n","truncated":false}}
%---
