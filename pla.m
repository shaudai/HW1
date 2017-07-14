clear
data = dlmread('hw1_15_train.dat');
y = data(:, 5);
m = length(y);
X = [ones(m, 1) , data(:, [1: 4])];
w = zeros(size(X, 2), 1);

completed = 0;
update = 0;
idx = 0;

while completed < m

		n = mod(idx + completed, m)+ 1;
	
		if X(n, :)* w > 0
			y_pred = 1;
		else
			y_pred = -1;
		end

		if y(n) != y_pred
			update += 1;
			w = w + y(n)* X(n, :)' ;
            idx += (completed + 1);
			completed = 0;
			continue;
		end
		completed += 1;
	
end
fprintf('It took %d updates to complete PLA\r\n', update);