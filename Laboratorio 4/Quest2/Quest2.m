clc;clear;
%visualizando h1
h1 = ones(5,5)/25;
h2 = [1,2,1;0,0,0;-1,-2,-1];
fh1 = fft2(h1,100,100);
fh1 = abs(fh1);
fh1 = (fh1)/max(max(fh1));
fh1 = fftshift(fh1);
figure;
imshow(fh1);
imwrite(fh1,'moduloh1.png');
%terminando de visualizar o h1

%visualizando h2
fh2 = fft2(h2,100,100);
fh2 = abs(fh2);
fh2 = (fh2)/max(max(fh2));
fh2 = fftshift(fh2);
figure;
imshow(fh2);
imwrite(fh2,'moduloh2.png');
%terminando de visualizar o h2

%aplicando os filtros h1 e h2 no dominio da frequencia nas imagens
img1 = imread('footBallOrig.png');
img2 = imread('noiseball.png');
img3 = imread('woman.png');
fimg1 = fft2(img1);
fimg1h1 = filtrogeral(fimg1,h1);
fimg1h2 = filtrogeral(fimg1,h2);
img1h1 = ifft2(fimg1h1);
img1h2 = ifft2(fimg1h2);
if (max(max(img1h1))) ~= 0
  img1h1 = img1h1/(max(max(img1h1)));
end
if (max(max(img1h2))) ~= 0
  img1h2 = img1h2/(max(max(img1h2)));
end
imwrite(img1h1,'footballh1.png');
imwrite(img1h2,'footballh2.png');

fimg2 = fft2(img2);
fimg2h1 = filtrogeral(fimg2,h1);
fimg2h2 = filtrogeral(fimg2,h2);
img2h1 = ifft2(fimg2h1);
img2h2 = ifft2(fimg2h2);
if (max(max(img2h1))) ~= 0
  img2h1 = img2h1/(max(max(img2h1)));
end
if (max(max(img2h2))) ~=0
  img2h2 = img2h2/(max(max(img2h2)));
end

imwrite(img2h1,'noiseballh1.png');
imwrite(img2h2,'noiseballh2.png');

fimg3 = fft2(img3);
fimg3h1 = filtrogeral(fimg3,h1);
fimg3h2 = filtrogeral(fimg3,h2);
img3h1 = ifft2(fimg3h1);
img3h2 = ifft2(fimg3h2);
if (max(max(img3h1))) ~= 0
  img3h1 = img3h1/(max(max(img3h1)));
end
if (max(max(img3h2))) ~= 0
  img3h2 = img3h2/(max(max(img3h2)));
end
imwrite(img3h1,'womanh1.png');
imwrite(img3h2,'womanh2.png');