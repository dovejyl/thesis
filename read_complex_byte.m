function v = read_complex_byte(filename,count)
%% usage: read_complex_byte (filename, [count])
%%
%%  open filename and return the contents as a column vector,
%%  reading 8bit unsigned, and treating them as doubles (and normalizing
%% to (+/- 1)
%%

% if ((m = nargchk (1,2,nargin)))
%   usage (m);
% endif;

if (nargin < 2) %函数输入宗量数
count = Inf; %无穷大
end;

f = fopen (filename, 'rb');
if (f < 0)
v = 0;
else
t = fread (f, [2, count], 'uint8=>double'); %从文件读二进制数
fclose (f);
v = t(1,:)-127 + (t(2,:)-127)*1i; %li?
v = v / 128;
[r, c] = size (v);
v = reshape (v, c, r); %改变数组维数、大小
end;
