%limpando tudo
clear;clc;

%testando as paradas
imagem = "lena512color.tiff";
filter = [1,2,1
          0,1,0
          -1,-2,-1];

usar_func = filtro3X3(imagem,filter);
