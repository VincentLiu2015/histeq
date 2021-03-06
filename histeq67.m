%author=刘琦
%直方图均衡化作业
I=imread('mudan.jpg');
[M,N]=size(I);
Id=double(I);
IHist=zeros(1,256);
for i=1:M
    for j=1:N
        IHist(Id(i,j)+1)=IHist(Id(i,j)+1)+1;
    end
end
subplot(3,3,1);
imshow('mudan.jpg');
title('原图');
subplot(3,3,2);
plot(IHist);
title('原图统计灰度直方图');
%直方图归一化处理
IHist=IHist./(M*N);
%采用输入图像概率累积函数进行灰度级映射计算
Sk=zeros(1,256);
for k=0:255
    Sk(k+1)=sum(IHist(1:k+1));
end
subplot(3,3,3);
plot(Sk);
title('累积函数进行灰度级映射');
%灰度级重新量化
Smin=min(Sk)
Sk=uint8(255*(Sk-Smin)./(1-Smin)+0.5);
subplot(3,3,4);
plot(Sk);
title('灰度级重新量化');
%输出经过直方图均衡化的图像
Ieq=zeros(M,N);
for i=1:M
    for j=1:N
        L=double(I(i,j))+1;
        Ieq(i,j)=Sk(L);
    end
end
B=mat2gray(Ieq);
subplot(3,3,5);
imshow(B);
title('自定义的直方图均衡化图像');

h=imread('mudan.jpg');
leq=histeq(h,256);
subplot(3,3,6);
imshow(leq);
title('调用函数的直方图均衡化');
%最后一个调用函数出现错误，错误如下提示，现在还没有搞明白
%Error using histeq
%Expected input number 1, I, to be two-dimensional.

%Error in histeq (line 78)
 %     validateattributes(a,{'uint8','uint16','double','int16','single'}, ...

%Error in histeq67 (line 46)
%leq=histeq(h,256);





