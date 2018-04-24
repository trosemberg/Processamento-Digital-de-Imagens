clc;clear;

img = imread("woman.png");

#retorno apenas do modulo
imgabs = fft2(img);
imgabs = ifft2(abs(imgabs));
imgabs = (imgabs)/max(max(imgabs));
%imgabs = log10(imgabs);
imgabs = fftshift(imgabs);
figure;
imshow(imgabs);
imwrite(imgabs,"modulo.png");
#fim do modulo

#retorna apenas a fase
ang = fft2(img);
ang = abs(ifft2(exp(1i*angle(ang))));
ang = ang/(max(max(ang)));

figure;
imshow(ang);
imwrite(ang,"fase.png");
#fim da fase