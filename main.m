clc; clear; close all;
%{
%tin hieu dau vao
[x1, Fs1] = audioread('E:\TinHieuHuanLuyen\phone_M2.wav');
[x2, Fs2]  = audioread('E:\TinHieuHuanLuyen\phone_F2.wav');
[x3, Fs3] = audioread('E:\TinHieuHuanLuyen\studio_M2.wav');
[x4, Fs4] = audioread('E:\TinHieuHuanLuyen\studio_F2.wav');
%de cho
F0mean1 = 129; F0std1 = 18.6;
F0mean2 = 145; F0std2 = 33.7;
F0mean3 = 155; F0std3 = 30.8;
F0mean4 = 200; F0std4 = 46.1;
%dai F0
[F1,frv1, fruv1] = findFundamentalFrequency(x1, Fs1, 36, 64);
[F2,frv2, fruv2] = findFundamentalFrequency(x2, Fs2, 68, 110);
[F3,frv3, fruv3] = findFundamentalFrequency(x3, Fs3, 48, 12);
[F4,frv4, fruv4] = findFundamentalFrequency(x4, Fs4, 88, 100);
%F0mean va F0std
[F01, Fstd1] = F0Average(medianFilter(F1,5));
[F02, Fstd2] = F0Average(medianFilter(F2,5));
[F03, Fstd3] = F0Average(medianFilter(F3,5));
[F04, Fstd4] = F0Average(medianFilter(F4,5));
%chenh lech
d1 = abs(F01 - F0mean1);
d2 = abs(F02 - F0mean2);
d3 = abs(F03 - F0mean3);
d4 = abs(F04 - F0mean4);
dstd1 = abs(Fstd1 - F0std1);
dstd2 = abs(Fstd2 - F0std2);
dstd3 = abs(Fstd3 - F0std3);
dstd4 = abs(Fstd4 - F0std4);
%}

[x1, Fs1] = audioread('E:\TinHieuKiemThu\phone_M1.wav');
[x2, Fs2]  = audioread('E:\TinHieuKiemThu\phone_F1.wav');
[x3, Fs3] = audioread('E:\TinHieuKiemThu\studio_M1.wav');
[x4, Fs4] = audioread('E:\TinHieuKiemThu\studio_F1.wav');
%de cho
F0mean1 = 122; F0std1 = 18;
F0mean2 = 217; F0std2 = 23;
F0mean3 = 113; F0std3 = 26;
F0mean4 = 232; F0std4 = 40;
%dai F0
[F1,frv1, fruv1] = findFundamentalFrequency(x1, Fs1, 76, 58);
[F2,frv2, fruv2] = findFundamentalFrequency(x2, Fs2, 80, 56);
[F3,frv3, fruv3] = findFundamentalFrequency(x3, Fs3, 50, 12);
[F4,frv4, fruv4] = findFundamentalFrequency(x4, Fs4, 60, 22);
%F0mean va F0std
[F01, Fstd1] = F0Average(F1);
[F02, Fstd2] = F0Average(F2);
[F03, Fstd3] = F0Average(F3);
[F04, Fstd4] = F0Average(F4);
%chenh lech
d1 = abs(F01 - F0mean1);
d2 = abs(F02 - F0mean2);
d3 = abs(F03 - F0mean3);
d4 = abs(F04 - F0mean4);
dstd1 = abs(Fstd1 - F0std1);
dstd2 = abs(Fstd2 - F0std2);
dstd3 = abs(Fstd3 - F0std3);
dstd4 = abs(Fstd4 - F0std4);
%}
        %x1
figure('Name','Phone-M1','NumberTitle','off');
subplot(4,2,1);
plot(fruv1);
title('Unvoice');
xlabel('Lag(sample)');
ylabel('Autocorrelation');
ylim([-1 1]);
subplot(4,2,2);
plot(frv1);
title('Voice');
xlabel('Lag(sample)');
ylabel('Autocorrelation');
ylim([-1 1]);
subplot(4,2,[3,4]);
plot((1:length(x1))/Fs1, x1);
title('Input signal phone-M1 ');
xlabel('Time(s)');
ylabel('Amplitude');
subplot(4,2,[5,6]);
stem((1:length(F1))*0.025,F1,'*','linestyle','none');
ylim([0 450]);
title('F0 uses autocorrelaton function');
xlabel('Time(s)');
ylabel('Hz');
subplot(4,2,[7,8]);
stem((1:length(F1))*0.025,medianFilter(F1,5),'*','linestyle','none');
ylim([0 450]);
title('F0 uses medium filters');
xlabel('Time(s)');
ylabel('Hz');
        %x2
figure('Name','Phone-F1','NumberTitle','off');
subplot(4,2,1);
plot(fruv2);
title('Unvoice');
xlabel('Lag(sample)');
ylabel('Autocorrelation');
ylim([-1 1]);
subplot(4,2,2);
plot(frv2);
title('Voice');
xlabel('Lag(sample)');
ylabel('Autocorrelation');
ylim([-1 1]);
subplot(4,2,[3,4]);
plot((1:length(x2))/Fs2, x2);
title('Input signal phone-F1 ');
xlabel('Time(s)');
ylabel('Amplitude');
subplot(4,2,[5,6]);
stem((1:length(F2))*0.025,F2,'*','linestyle','none');
ylim([0 450]);
title('F0 uses autocorrelaton function');
xlabel('Time(s)');
ylabel('Hz');
subplot(4,2,[7,8]);
stem((1:length(F2))*0.025,medianFilter(F2,5),'*','linestyle','none');
ylim([0 450]);
title('F0 uses medium filters');
xlabel('Time(s)');
ylabel('Hz');
        %x3
figure('Name','Studio-M1','NumberTitle','off');
subplot(4,2,1);
plot(fruv3);
title('Unvoice');
xlabel('Lag(sample)');
ylabel('Autocorrelation');
ylim([-1 1]);
subplot(4,2,2);
plot(frv3);
title('Voice');
xlabel('Lag(sample)');
ylabel('Autocorrelation');
ylim([-1 1]);
subplot(4,2,[3,4]);
plot((1:length(x3))/Fs3, x3);
title('Input signal studio-M1 ');
xlabel('Time(s)');
ylabel('Amplitude');
subplot(4,2,[5,6]);
stem((1:length(F3))*0.025,F3,'*','linestyle','none');
ylim([0 450]);
title('F0 uses autocorrelaton function');
xlabel('Time(s)');
ylabel('Hz');
subplot(4,2,[7,8]);
stem((1:length(F3))*0.025,medianFilter(F3,5),'*','linestyle','none');
ylim([0 450]);
title('F0 uses medium filters');
xlabel('Time(s)');
ylabel('Hz');
        %x4
figure('Name','Studio-F1','NumberTitle','off');
subplot(4,2,1);
plot(fruv4);
title('Unvoice');
xlabel('Lag(sample)');
ylabel('Autocorrelation');
ylim([-1 1]);
subplot(4,2,2);
plot(frv4);
title('Voice');
xlabel('Lag(sample)');
ylabel('Autocorrelation');
ylim([-1 1]);
subplot(4,2,[3,4]);
plot((1:length(x4))/Fs4, x4);
title('Input signal studio-F1 ');
xlabel('Time(s)');
ylabel('Amplitude');
subplot(4,2,[5,6]);
stem((1:length(F4))*0.025,F4,'*','linestyle','none');
ylim([0 450]);
title('F0 uses autocorrelaton function');
xlabel('Time(s)');
ylabel('Hz');
subplot(4,2,[7,8]);
stem((1:length(F4))*0.025,medianFilter(F4,5),'*','linestyle','none');
ylim([0 450]);
title('F0 uses medium filters');
xlabel('Time(s)');
ylabel('Hz');

    function [f,frv,fruv] = findFundamentalFrequency(x, fs, frindexv, frindexuv)
    frameTime = 0.025;
    frameLength = floor(frameTime * fs);
    totalFrame = floor(length(x)/frameLength);
    global start;
    start = 1;
    f = zeros(1,totalFrame);
    
    for frame = 1 : totalFrame - 1
        x1 = x(start:start + frameLength);
        y = zeros(1,length(x1)); 
        
        %ACF
        ymax = 0;
        for k = 1 : frameLength - 1 
            ymax = ymax + x1(k)*x1(k);
        end
        for lag = 1 : frameLength 
            for j = 1 : frameLength - 1 - lag
                y(lag) = y(lag) + x1(j) * x1(j + lag);
            end                                   
        end
        %chuan hoa
        for i = 1 : frameLength
            y(i) = y(i) / ymax;
        end
        maxPeak = 0;
        index = 0;
        for i = floor(fs/450) : floor(fs/70) 
            if (y(i) > y(i -1) && y(i) > y(i+1) && y(i) >= maxPeak)   
                maxPeak = y(i);                
                index = i;
            end
        end
        if(maxPeak >= 0.35)
            f(frame) = fs/index;
        end
        if frame == frindexv
            if maxPeak >= 0.35
                frv = y;
            else
                frv = zeros(1,length(x1));
            end
        end
        if frame == frindexuv
            if maxPeak < 0.35
                fruv = y;
            else 
                fruv = zeros(1,length(x1));
            end
        end
        start = start + frameLength;
    end
end

function [F0, F0std] = F0Average(f)
    count = 0 ; 
    F0 = 0 ;
    F0std = 0;
    for i = 1:length(f)
        if f(i) > 70 && f(i) < 450            
            F0 = F0 + f(i); 
            count = count + 1;           
        end
    end
    F0 = F0/count; 
    
    count = 0;
    for j = 1:length(f)
        if f(j) > 70 && f(j) < 450            
            F0std = F0std + abs(F0-f(j));
            count = count + 1;
        end
    end
    F0std = F0std/count; 
end 
%ham loc trung vi
function m = medianFilter(s, w)
    w2 = floor(w/2);
    w = 2*w2 + 1;
    n = length(s);
    m = zeros(w,n+w-1);
    s0 = s(1); sl = s(n);
    for i=0:(w-1)
        m(i+1,:) = [s0*ones(1,i) s sl*ones(1,w-i-1)];
    end
    m = median(m);
    m = m(w2+1:w2+n);
end