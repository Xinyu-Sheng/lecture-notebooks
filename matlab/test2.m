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

% 定义第二个函数 g(x1, x2) = x1^2 + 2*x1 - x2
g = @(x1, x2) x1.^2 + 2*x1 - x2;

% 计算 Z2 值用于第二个函数
Z2 = g(X1, X2);

% 绘制第一个函数的三维图
figure;
surf(X1, X2, Z1, 'FaceColor', 'interp', 'EdgeColor', 'none'); % 设置颜色插值，无边线
hold on;

% 绘制第二个函数的三维图，使用不同的颜色或透明度
hsurf = surf(X1, X2, Z2, 'FaceAlpha', 0.5, 'EdgeColor', 'none', 'FaceColor', 'r'); % 设置半透明红色表面
alpha(0.5); % 可选：设置全局透明度

% 设置图形属性
title('f(x) and g(x1, x2)');
xlabel('x_1');
ylabel('x_2');
zlabel('f(x) / g(x1,x2)');
shading interp;
colorbar;

% 添加一个图例
legend('f(x) = 0.5*(x-[1; 0])''*Q*(x-[1; 0])', 'g(x1, x2) = x1^2 + 2*x1 - x2');

% 调整视角以更好地查看两个表面的关系
view(140, 30);

% 确保两个曲面在 z 轴上的比例合适，可以正确比较
axis tight;

hold off;