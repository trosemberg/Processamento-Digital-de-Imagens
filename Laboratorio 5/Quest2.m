clc;clear;
##histograma original fig_lista3_1
img = imread('fig_lista3_1.png');
histograma = zeros(256);
oi = 0;
tamimg = size(img);

for (linha = 1:1:tamimg(1))
  for (coluna = 1:1:tamimg(2))
   oi =  img(linha,coluna);
   histograma(oi) = histograma (oi) + 1;
 end
end
eixox = 0:1:255;
bar(histograma,0.1);
print('Q2hist_fig_original','-dpng');
##fim histograma original 

##histograma original einstein
einst = imread('einsteinLowContrast.png');
histeinst = zeros(256);
temp = 0;
tamimg = size(einst);

for (linha = 1:1:tamimg(1))
  for (coluna = 1:1:tamimg(2))
   temp =  einst(linha,coluna);
   histeinst(temp) = histeinst (temp) + 1;
 end
end
eixox = 0:1:255;
bar(eixox,histeinst,0.1);
print('Q2hist_einstein_original','-dpng');
##fim histograma einstein

