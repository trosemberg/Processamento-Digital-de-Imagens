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
for linha = 1:1:tameinstein(1) %primeira equalização, einstein5X5
    for coluna = 1:1:tameinstein(2)
    end
end
for linha = 1:1:tameinstein(1) %segunda equalização, einstein7X7
    for coluna = 1:1:tameinstein(2)
    end
end
for linha = 1:1:tamfig(1) %terceira equalização, fig5X5
    for coluna = 1:1:tamfig(2)
    end
end
for linha = 1:1:tamfig(1) %quarta equalização, fig7X7
    for coluna = 1:1:tamfig(2)
    end
end
%% histograma da equalização

einst5X5 = uint8(einst5X5);
einst7X7 = uint8(einst7X7);
fig5X5 = uint8(fig5X5);
fig7X7 = uint8(fig7X7);
hist_einstein = histograma(einstein,'einstein');
hist_fig_list = histograma(fig,'fig');
hist_einstein = histograma(einstein,'einstein');
hist_fig_list = histograma(fig,'fig');
hist_einstein = histograma(einstein,'einstein');
hist_fig_list = histograma(fig,'fig');
