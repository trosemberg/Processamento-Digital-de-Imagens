clc;clear;
#visualizando h1
h1 = ones(5,5)/25;
h2 = [1,2,1;0,0,0;-1,-2,-1];
fh1 = fft2(h1,100,100);
fh1 = abs(fh1);
fh1 = (fh1)/max(max(fh1));
fh1 = fftshift(fh1);
figure;
imshow(fh1);
imwrite(fh1,"moduloh1.png");
#terminando de visualizar o h1

#visualizando h2
fh2 = fft2(h2,100,100);
fh2 = abs(fh2);
fh2 = (fh2)/max(max(fh2));
fh2 = fftshift(fh2);
figure;
imshow(fh2);
imwrite(fh2,"moduloh2.png");
#terminando de visualizar o h2