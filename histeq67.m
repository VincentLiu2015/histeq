%author=����
%ֱ��ͼ���⻯��ҵ
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
title('ԭͼ');
subplot(3,3,2);
plot(IHist);
title('ԭͼͳ�ƻҶ�ֱ��ͼ');
%ֱ��ͼ��һ������
IHist=IHist./(M*N);
%��������ͼ������ۻ��������лҶȼ�ӳ�����
Sk=zeros(1,256);
for k=0:255
    Sk(k+1)=sum(IHist(1:k+1));
end
subplot(3,3,3);
plot(Sk);
title('�ۻ��������лҶȼ�ӳ��');
%�Ҷȼ���������
Smin=min(Sk)
Sk=uint8(255*(Sk-Smin)./(1-Smin)+0.5);
subplot(3,3,4);
plot(Sk);
title('�Ҷȼ���������');
%�������ֱ��ͼ���⻯��ͼ��
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
title('�Զ����ֱ��ͼ���⻯ͼ��');

h=imread('mudan.jpg');
leq=histeq(h,256);
subplot(3,3,6);
imshow(leq);
title('���ú�����ֱ��ͼ���⻯');
%���һ�����ú������ִ��󣬴���������ʾ�����ڻ�û�и�����
%Error using histeq
%Expected input number 1, I, to be two-dimensional.

%Error in histeq (line 78)
 %     validateattributes(a,{'uint8','uint16','double','int16','single'}, ...

%Error in histeq67 (line 46)
%leq=histeq(h,256);




