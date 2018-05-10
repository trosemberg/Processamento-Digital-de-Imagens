clc;clear;
img = imread('fig_lista3_1.png');
histograma = zeros(256);
oi = 0;
tamimg = size(img);

for linha = 1:1:tamimg(1)
  for coluna = 1:1:tamimg(2)
   oi =  img(linha,coluna);
   histograma(oi) = histograma (oi) + 1;
 end
end
bar(histograma,0.1);
print('Q1hist_fig_lista_3_1','-dpng');