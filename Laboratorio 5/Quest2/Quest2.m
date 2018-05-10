clc;clear;
%%histograma original fig_lista3_1
img = imread('fig_lista3_1.png');
histograma = zeros(1,256);
oi = 0;
tamimg = size(img);

for linha = 1:1:tamimg(1)
  for coluna = 1:1:tamimg(2)
   oi =  img(linha,coluna);
   histograma(oi+1) = histograma (oi+1) + 1;
 end
end
bar(0:255,histograma);
xlim([0 255]);
saveas(gcf,'Q2_hist_fig.png');
%%fim histograma original
%%-------------------------------------------------------------------------------------------
%%histograma original einstein
einst = imread('einsteinLowContrast.png');
histeinst = zeros(1,256);
temp = 0;
tameinst = size(einst);


for linha = 1:1:tameinst(1)
  for coluna = 1:1:tameinst(2)
   temp =  einst(linha,coluna);
   histeinst(temp+1) = histeinst (temp+1) + 1;
 end
end
bar(0:255,histeinst);
xlim([0 255]);
saveas(gcf,'hist_eintein.png');
%%fim histograma einstein
%%-------------------------------------------------------------------------------------------
%%equalizar os histogramas
img_eq = zeros(tamimg(1),tamimg(2));
einst_eq = zeros(tameinst(1),tameinst(2));
for linha=1:1:tamimg(1)
    for coluna=1:1:tamimg(2)
        img_eq(linha,coluna) = (255*sum(histograma(1:img(linha,coluna)+1)))/(tamimg(1)*tamimg(2));
    end
end
for linha=1:1:tameinst(1)
    for coluna=1:1:tameinst(2)
       einst_eq(linha,coluna) = (255*sum(histeinst(1:einst(linha,coluna)+1)))/(tameinst(1)*tameinst(2));
    end
end
img_eq = uint8(img_eq);
einst_eq = uint8(einst_eq);
imwrite(img_eq,'fig_equalizada.png');
imwrite(einst_eq,'einstein_equalizado.png');
%%termindo da equalização das imagens
%%-------------------------------------------------------------------------------------------
%%histograma das imagens equalizadas
%%histograma da fig equalizada
histograma = zeros(1,256);
oi_eq = 0;
tamimg_eq = size(img_eq);

for linha = 1:1:tamimg_eq(1)
  for coluna = 1:1:tamimg_eq(2)
   oi_eq =  img_eq(linha,coluna);
   histograma(oi_eq+1) = histograma (oi_eq+1) + 1;
 end
end
bar(0:255,histograma);
xlim([0 255]);
saveas(gcf,'Q2_hist_fig_eq.png');
%%fim histograma fig equalizada
%%histograma einstein equalizado
histeinst = zeros(1,256);
temp_eq = 0;
tameinst_eq = size(einst_eq);


for linha = 1:1:tameinst_eq(1)
  for coluna = 1:1:tameinst_eq(2)
   temp_eq =  einst_eq(linha,coluna);
   histeinst(temp_eq+1) = histeinst (temp_eq+1) + 1;
 end
end
bar(0:255,histeinst);
xlim([0 255]);
saveas(gcf,'hist_eintein_eq.png');
%%fim histograma einstein equalizado

%%termino do histograma das imagens equalizadas

