%limpando tudo
clear;clc;

%testando as paradas
imagem = "reduz16X.png";
dime = (16);

usar_func = dimensionamentoBILINEAR(imagem,dime);
imshow(imagem);
figure;
imshow(usar_func);
imwrite(usar_func,"BIamplia16X.png");