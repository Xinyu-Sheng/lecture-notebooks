% 定义 Q 矩阵
Q = diag([0.5, 1]);

% 定义函数 f(x) 使用匿名函数
f = @(x) 0.5 * (x - [1; 0])' * Q * (x - [1; 0]);

% 创建 x1 和 x2 的范围
x1 = linspace(-5, 5, 100);
x2 = linspace(-5, 5, 100);

% 创建网格
[X1, X2] = meshgrid(x1, x2);

% 计算 Z 值用于第一个函数
Z1 = zeros(size(X1));
for i = 1:numel(X1)
    Z1(i) = f([X1(i); X2(i)]);
end

% 绘制第一个函数的三维图
figure;
surf(X1, X2, Z1);
title('f(x) = 0.5*(x-[1; 0])''*Q*(x-[1; 0])');
xlabel('x_1');
ylabel('x_2');
zlabel('f(x)');
shading interp;
colorbar;

% 定义第二个函数 g(x1, x2) = x1^2 + 2*x1 - x2
g = @(x1, x2) x1.^2 + 2*x1 - x2;

% 计算 Z2 值用于第二个函数
Z2 = g(X1, X2);

% 绘制第二个函数的三维图
figure;
surf(X1, X2, Z2);
title('g(x1, x2) = x1^2 + 2*x1 - x2');
xlabel('x_1');
ylabel('x_2');
zlabel('g(x1,x2)');
shading interp;
colorbar;