%limpando tudo
clear;clc;

%testando as paradas
imagem = "lena512color.tiff";
filter = [1,1,1,1,1,1,1,1,1,1,1
          1,1,1,1,1,1,1,1,1,1,1
          1,1,1,1,1,1,1,1,1,1,1
          1,1,1,1,1,1,1,1,1,1,1
          1,1,1,1,1,1,1,1,1,1,1
          1,1,1,1,1,1,1,1,1,1,1
          1,1,1,1,1,1,1,1,1,1,1
          1,1,1,1,1,1,1,1,1,1,1
          1,1,1,1,1,1,1,1,1,1,1
          1,1,1,1,1,1,1,1,1,1,1
          1,1,1,1,1,1,1,1,1,1,1]
img = imread(imagem);             %le imagem
tamimg = size(img);               %vetor com o tamanho da imagem
tamfil = size(filter);            %vetor com tamanho do filtro
sumfilter = sum(sum(filter));     %multiplicando o vetor pelo inverso da soma da matriz
if sumfilter ~= 0
  filter = filter/sumfilter;    
end
filter = flip(filter,1);          %duas linhas para espelhar a matriz, primeira
filter = flip(filter,2);          %espelha em relacao as linhas e seguna as colunas
imgtemp = zeros(tamimg(1) + 2*tamfil(1) , tamimg(2) + 2*tamfil(2), tamimg(3));%cria uma imagem temporaria com o tamanho da imagem mais duas vezes o tamanho do filtro de altura e largura
imgtemp (tamfil(1)+1:tamimg(1) + tamfil(1),tamfil(2)+1:tamimg(2) + tamfil(2), 1:tamimg(3))...
=img(1:tamimg(1),1:tamimg(2),1:tamimg(3)); %preenche a imagem temporaria para que tenha uma borda ao redor da imagem original, sendo tal borda do tamanho do filtro
novaimg = zeros(tamimg(1),tamimg(2),tamimg(3));%cria a nova imagem que sera a filtrada
novaimg = double(novaimg);
img = double(img);
imgtemp = double(imgtemp);
for(prof = 1:1:tamimg(3)) %for variando o canal da imagem de 1 a 3
  for(linha = tamfil(1)+1:1:tamimg(1) + tamfil(1)) %for para varrer as linhas 
    for(coluna = tamfil(2)+1:1:tamimg(2) + tamfil(2)) %for para varrer as colunas
      novaimg(linha-tamfil(1),coluna-tamfil(2),prof) = imgtemp(linha-5,coluna-5,prof)* filter(1,1)+imgtemp(linha-5,coluna-4,prof)* filter(1,2)+imgtemp(linha-5,coluna-3,prof)* filter(1,3)+imgtemp(linha-5,coluna-2,prof)* filter(1,4)+imgtemp(linha-5,coluna-1,prof)* filter(1,5)+imgtemp(linha-5,coluna,prof)* filter(1,6)+imgtemp(linha-5,coluna+1,prof)* filter(1,7)+imgtemp(linha-5,coluna+2,prof)* filter(1,8)+imgtemp(linha-5,coluna+3,prof)* filter(1,9)+imgtemp(linha-5,coluna+4,prof)* filter(1,10)+imgtemp(linha-5,coluna+5,prof)* filter(1,11)+...
      imgtemp(linha-4,coluna-5,prof)* filter(2,1)+imgtemp(linha-4,coluna-4,prof)* filter(2,2)+imgtemp(linha-4,coluna-3,prof)* filter(2,3)+imgtemp(linha-4,coluna-2,prof)* filter(2,4)+imgtemp(linha-4,coluna-1,prof)* filter(2,5)+imgtemp(linha-4,coluna,prof)* filter(2,6)+imgtemp(linha-4,coluna+1,prof)* filter(2,7)+imgtemp(linha-4,coluna+2,prof)* filter(2,8)+imgtemp(linha-4,coluna+3,prof)* filter(2,9)+imgtemp(linha-4,coluna+4,prof)* filter(2,10)+imgtemp(linha-4,coluna+5,prof)* filter(2,11)+...
      imgtemp(linha-3,coluna-5,prof)* filter(3,1)+imgtemp(linha-3,coluna-4,prof)* filter(3,2)+imgtemp(linha-3,coluna-3,prof)* filter(3,3)+imgtemp(linha-3,coluna-2,prof)* filter(3,4)+imgtemp(linha-3,coluna-1,prof)* filter(3,5)+imgtemp(linha-3,coluna,prof)* filter(3,6)+imgtemp(linha-3,coluna+1,prof)* filter(3,7)+imgtemp(linha-3,coluna+2,prof)* filter(3,8)+imgtemp(linha-3,coluna+3,prof)* filter(3,9)+imgtemp(linha-3,coluna+4,prof)* filter(3,10)+imgtemp(linha-3,coluna+5,prof)* filter(3,11)+...
      imgtemp(linha-2,coluna-5,prof)* filter(4,1)+imgtemp(linha-2,coluna-4,prof)* filter(4,2)+imgtemp(linha-2,coluna-3,prof)* filter(4,3)+imgtemp(linha-2,coluna-2,prof)* filter(4,4)+imgtemp(linha-2,coluna-1,prof)* filter(4,5)+imgtemp(linha-2,coluna,prof)* filter(4,6)+imgtemp(linha-2,coluna+1,prof)* filter(4,7)+imgtemp(linha-2,coluna+2,prof)* filter(4,8)+imgtemp(linha-2,coluna+3,prof)* filter(4,9)+imgtemp(linha-2,coluna+4,prof)* filter(4,10)+imgtemp(linha-2,coluna+5,prof)* filter(4,11)+...
      imgtemp(linha-1,coluna-5,prof)* filter(5,1)+imgtemp(linha-1,coluna-4,prof)* filter(5,2)+imgtemp(linha-1,coluna-3,prof)* filter(5,3)+imgtemp(linha-1,coluna-2,prof)* filter(5,4)+imgtemp(linha-1,coluna-1,prof)* filter(5,5)+imgtemp(linha-1,coluna,prof)* filter(5,6)+imgtemp(linha-1,coluna+1,prof)* filter(5,7)+imgtemp(linha-1,coluna+2,prof)* filter(5,8)+imgtemp(linha-1,coluna+3,prof)* filter(5,9)+imgtemp(linha-1,coluna+4,prof)* filter(5,10)+imgtemp(linha-1,coluna+5,prof)* filter(5,11)+...
      imgtemp(linha,coluna-5,prof)* filter(6,1)+imgtemp(linha,coluna-4,prof)* filter(6,2)+imgtemp(linha,coluna-3,prof)* filter(6,3)+imgtemp(linha,coluna-2,prof)* filter(6,4)+imgtemp(linha,coluna-1,prof)* filter(6,5)+imgtemp(linha,coluna,prof)* filter(6,6)+imgtemp(linha,coluna+1,prof)* filter(6,7)+imgtemp(linha,coluna+2,prof)* filter(6,8)+imgtemp(linha,coluna+3,prof)* filter(6,9)+imgtemp(linha,coluna+4,prof)* filter(6,10)+imgtemp(linha,coluna+5,prof)* filter(6,11)+...
      imgtemp(linha+1,coluna-5,prof)* filter(7,1)+imgtemp(linha+1,coluna-4,prof)* filter(7,2)+imgtemp(linha+1,coluna-3,prof)* filter(7,3)+imgtemp(linha+1,coluna-2,prof)* filter(7,4)+imgtemp(linha+1,coluna-1,prof)* filter(7,5)+imgtemp(linha+1,coluna,prof)* filter(7,6)+imgtemp(linha+1,coluna+1,prof)* filter(7,7)+imgtemp(linha+1,coluna+2,prof)* filter(7,8)+imgtemp(linha+1,coluna+3,prof)* filter(7,9)+imgtemp(linha+1,coluna+4,prof)* filter(7,10)+imgtemp(linha+1,coluna+5,prof)* filter(7,11)+...
      imgtemp(linha+2,coluna-5,prof)* filter(8,1)+imgtemp(linha+2,coluna-4,prof)* filter(8,2)+imgtemp(linha+2,coluna-3,prof)* filter(8,3)+imgtemp(linha+2,coluna-2,prof)* filter(8,4)+imgtemp(linha+2,coluna-1,prof)* filter(8,5)+imgtemp(linha+2,coluna,prof)* filter(8,6)+imgtemp(linha+2,coluna+1,prof)* filter(8,7)+imgtemp(linha+2,coluna+2,prof)* filter(8,8)+imgtemp(linha+2,coluna+3,prof)* filter(8,9)+imgtemp(linha+2,coluna+4,prof)* filter(8,10)+imgtemp(linha+2,coluna+5,prof)* filter(8,11)+...
      imgtemp(linha+3,coluna-5,prof)* filter(9,1)+imgtemp(linha+3,coluna-4,prof)* filter(9,2)+imgtemp(linha+3,coluna-3,prof)* filter(9,3)+imgtemp(linha+3,coluna-2,prof)* filter(9,4)+imgtemp(linha+3,coluna-1,prof)* filter(9,5)+imgtemp(linha+3,coluna,prof)* filter(9,6)+imgtemp(linha+3,coluna+1,prof)* filter(9,7)+imgtemp(linha+3,coluna+2,prof)* filter(9,8)+imgtemp(linha+3,coluna+3,prof)* filter(9,9)+imgtemp(linha+3,coluna+4,prof)* filter(9,10)+imgtemp(linha+3,coluna+5,prof)* filter(9,11)+...
      imgtemp(linha+4,coluna-5,prof)* filter(10,1)+imgtemp(linha+4,coluna-4,prof)* filter(10,2)+imgtemp(linha+4,coluna-3,prof)* filter(10,3)+imgtemp(linha+4,coluna-2,prof)* filter(10,4)+imgtemp(linha+4,coluna-1,prof)* filter(10,5)+imgtemp(linha+4,coluna,prof)* filter(10,6)+imgtemp(linha+4,coluna+1,prof)* filter(10,7)+imgtemp(linha+4,coluna+2,prof)* filter(10,8)+imgtemp(linha+4,coluna+3,prof)* filter(10,9)+imgtemp(linha+4,coluna+4,prof)* filter(10,10)+imgtemp(linha+4,coluna+5,prof)* filter(10,11)+...
      imgtemp(linha+5,coluna-5,prof)* filter(11,1)+imgtemp(linha+5,coluna-4,prof)* filter(11,2)+imgtemp(linha+5,coluna-3,prof)* filter(11,3)+imgtemp(linha+5,coluna-2,prof)* filter(11,4)+imgtemp(linha+5,coluna-1,prof)* filter(11,5)+imgtemp(linha+5,coluna,prof)* filter(11,6)+imgtemp(linha+5,coluna+1,prof)* filter(11,7)+imgtemp(linha+5,coluna+2,prof)* filter(11,8)+imgtemp(linha+5,coluna+3,prof)* filter(11,9)+imgtemp(linha+5,coluna+4,prof)* filter(11,10)+imgtemp(linha+5,coluna+5,prof)* filter(11,11);
    end
  end
end
novaimg = uint8(novaimg);
img = uint8(img);
imgtemp = uint8(imgtemp);
imshow(img);
figure
imshow(novaimg);
imwrite(novaimg,"Filtro11X11.png");