% clc
% clf
% clear all
% close all
data = read_complex_binary('output',2e6);
figure()
pwelch(data, [], [], [], 30.72e6);
% fs = 30.72e6;
% fc = 1.7e9;
% t = transpose((0:1/fs:(length(data)-1)/fs));
% c = 3e8;% velocity of light
% l1 = 100;% distance between transmitter to target
% l2 = 20;% distance between receiver to target
% angle = pi/6;
% v = 125/9;% velocity of vehicle
% A1 = 1/(l1+l2).^2;
% 
% t1 = (l1+l2)/c;
% w1 = (v*cos(angle)) / c *fc;
% Na = [];
% Na = find(isnan(data));
% for id = 1:length(Na)
%     data(Na(id)) = 0;
% end
% 
% X1 = fft(data);
% X1 = X1.*exp(j*w1*t1);
% nn2 = A1.*ifft(X1).*exp(j*w1*t); %signal multiple with h(t)
% 
% 
% l3 = sqrt(8400);
% A2 = 1/l3^2;
% t2 = l3/c;
% w2 = (v*cos(angle)) / c*2*pi*fc;
% X2 = fft(data);
% X2 = X2.*exp(j*w2*t2);
% nn = A2.*ifft(X2).*exp(j*w2*t);
% 
% 
% 
% bs = 256; % batch size （每批数量）
% fmap = -100:100; %
% % nn2 = reflect_sig(:); 
% % nn = direct_sig(:);
% 
% sigt = transpose(((1:length(nn))-1)/fs); 
% rdmapX = zeros(length(fmap), length(nn)); 
% nn2F = conj(fft(nn2));
% for (fi=1:length(fmap))
%     f = fmap(fi);
%     nnf = nn .* exp(j*2*pi*-f*sigt); %frequency shift;
%     
%     rdmapX(fi,:) = ifft( fft(nnf).* nn2F); %
% end
% overlap = 800; % corresponds to maximum timeshift?
% nbatches = floor((length(nn)-overlap)/bs); %取整运算
% stRDmap = zeros(nbatches, overlap);
% sdata = size(stRDmap); %取出行数和列数
% gridx = 0:1:overlap-1; %横坐标的范围
% gridy = fmap; %纵坐标的范围
% rdmapXTRUNC = rdmapX(:, 1:overlap);
% rdmap_data = log(abs(rdmapXTRUNC));
% % rdmap_data(rdmap_data <163 ) = 163 ; % set threshold
% % %     rdmap_data = (rdmap_data + stRDmap)/2;
% figure(1)
% imagesc(gridx, gridy, rdmap_data);% imagesc
% xlabel('Range (samples)');
% ylabel('Doppler (Hz)');
% 
