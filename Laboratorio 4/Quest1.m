clc;clear;

img = imread("woman.png");

#retorno apenas do modulo
imgabs = fft2(img);
imgabs = ifft2(abs(imgabs));
imgabs = (imgabs)/max(max(imgabs));
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

#completa
imgabs = abs(fft2(img));
ang = fft2(img);
ang = (exp(1i*angle(ang)));
total = imgabs.*ang;
total = ifft2(total);
total = total/(max(max(total)));
figure;
imshow(total);
imwrite(total,"total.png");
#fim da completa