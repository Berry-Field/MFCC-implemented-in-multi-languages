%# -*- coding: utf-8 -*-
%
%Created on Sun Fir 24 12:10:28 2021
%@author: JIA HB
%
clc; clear; close all;
[x,Fs]=audioread('C:\\Users\\12610\\Downloads\\Music\\OSR_us_000_0010_8k.wav');
bank=melbankm(40,200,Fs,0,0.5,'t');
bank=full(bank);
bank=bank/max(bank(:));
x = x(1:28000);
x=filter([1 -0.97],1,x);
x=enframe(x,200,80);
for k=1:15 %DCT
n=0:39;
dctcoef(k,:)=cos((2*n+1)*k*pi/(2*24));
end
for i=1:size(x,1)
y=x(i,:); 
s=y'.*hamming(200); 
s=y'.*hamming(200); 
t=abs(fft(s)); 
t=t.^2; 
c=dctcoef*log(bank*t(1:101)); %通过Mel滤波器、对数运算和DCT
m(i,:)=c'; 
end
m=m';
heatmap(m);