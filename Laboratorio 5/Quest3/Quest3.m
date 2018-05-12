clc;clear;
%% definição apenas das imagens(criação das imagens e imagens temporarias necessarias para a questão)
einstein = imread ('einsteinLowContrast.png');
fig = imread ('fig_lista3_1.png');
hist_einstein = histograma(einstein,'einstein');
hist_fig_list = histograma(fig,'fig');
tameinstein = size(einstein);
tamfig = size(fig);
einst5X5temp = zeros(tameinstein(1)+4,tameinstein(2)+4);
einst7X7temp = zeros(tameinstein(1)+6,tameinstein(2)+6);
fig5x5temp =zeros(tamfig(1)+4,tamfig(2)+4);
fig7x7temp =zeros(tamfig(1)+6,tamfig(2)+6);
einst5X5 = einstein;
einst7X7 = einstein;
fig5x5 = fig;
fig7x7 = fig;
einst5X5temp(3:tameinstein(1)+2,3:tameinstein(2)+2) = einstein(1:tameinstein(1),1:tameinstein(2));
einst7X7temp(4:tameinstein(1)+3,4:tameinstein(2)+3) = einstein(1:tameinstein(1),1:tameinstein(2));
fig5x5temp(3:tamfig(1)+2,3:tamfig(2)+2) = fig(1:tamfig(1),1:tamfig(2));
fig7x7temp(4:tamfig(1)+3,4:tamfig(2)+3) = fig(1:tamfig(1),1:tamfig(2));
%% termino de setar as imagens necessarias para o trabalho

%% começo da equalização
img_eq = zeros(5,5);
for linha = 1:1:tameinstein(1) %primeira equalização, einstein5X5
    for coluna = 1:1:tameinstein(2)
        hist_einst5X5 = semihist(einst5X5temp(linha:linha+4,coluna:coluna+4));
        for x=1:5
            for y=1:5
                img_eq(x,y) = (255*sum(hist_einst5X5(1:einst5X5temp(linha+x-1,coluna+y-1)+1)))/25;
            end
        end
        einst5X5(linha,coluna) = img_eq(3,3);
    end
end
einst5X5 = uint8(einst5X5);
hist_einstein5X5 = histograma(einst5X5,'einstein5X5');
imwrite(einst5X5,'einstein5X5.png');

img_eq = zeros(7,7);
for linha = 1:1:tameinstein(1) %Segunda equalização, einstein7X7
    for coluna = 1:1:tameinstein(2)
        hist_einst7X7 = semihist(einst7X7temp(linha:linha+6,coluna:coluna+6));
        for x=1:7
            for y=1:7
                img_eq(x,y) = (255*sum(hist_einst7X7(1:einst7X7temp(linha+x-1,coluna+y-1)+1)))/49;
            end
        end
        einst7X7(linha,coluna) = img_eq(4,4);
    end
end
einst7X7 = uint8(einst7X7);
hist_einstein7X7 = histograma(einst7X7,'einstein7X7');
imwrite(einst7X7,'einstein7X7.png');

img_eq = zeros(5,5);
for linha = 1:1:tamfig(1) %terceira equalização, fig5X5
    for coluna = 1:1:tamfig(2)
        hist_fig5X5 = semihist(fig5x5temp(linha:linha+4,coluna:coluna+4));
        for x=1:5
            for y=1:5
                img_eq(x,y) = (255*sum(hist_fig5X5(1:fig5x5temp(linha+x-1,coluna+y-1)+1)))/25;
            end
        end
        fig5x5(linha,coluna) = img_eq(3,3);
    end
end
fig5x5 = uint8(fig5x5);
hist_fig_list5X5 = histograma(fig5x5,'fig5X5');
imwrite(fig5x5,'fig5X5.png');

img_eq = zeros(7,7);
for linha = 1:1:tamfig(1) %quarta equalização, fig7X7
    for coluna = 1:1:tamfig(2)
        hist_fig7X7 = semihist(fig7x7temp(linha:linha+6,coluna:coluna+6));
        for x=1:7
            for y=1:7
                img_eq(x,y) = (255*sum(hist_fig7X7(1:fig7x7temp(linha+x-1,coluna+y-1)+1)))/49;
            end
        end
        fig7x7(linha,coluna) = img_eq(4,4);
    end
end
fig7x7 = uint8(fig7x7);
hist_fig_list7X7 = histograma(fig7x7,'fig7X7');
imwrite(fig7x7,'fig7x7.png');

