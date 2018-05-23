mundo = imread('world_map.png');
vista = imread('view.png');
tammundo = size(mundo);
tamvista = size(vista);
new_mundo = zeros(tammundo(1),tammundo(2),3);
new_vista = zeros(tamvista(1),tamvista(2),3);
new_mundo(:,:,1) = mundo(:,:);
new_mundo(:,:,2) = mundo(:,:);
new_mundo(:,:,3) = mundo(:,:);
lim_vista=20;
new_vista(:,:,1) = vista(:,:);
new_vista(:,:,2) = vista(:,:);
new_vista(:,:,3) = vista(:,:);
for linha = 1:tammundo(1)
    for coluna = 1: tammundo(2)
        if((mundo(linha,coluna)<27) && (linha<2*(tammundo(1)/3)))%preto->azul
            new_mundo(linha,coluna,1) = 51-1.5*mundo(linha,coluna);
            new_mundo(linha,coluna,2) = 204-1.5*mundo(linha,coluna);
            new_mundo(linha,coluna,3) = 255-1.5*mundo(linha,coluna);
        elseif(mundo(linha,coluna)>210)%cinzando a parte branca do mapa
            new_mundo(linha,coluna,1) = 210+mundo(linha,coluna)/210;
            new_mundo(linha,coluna,2) = 210+mundo(linha,coluna)/210;
            new_mundo(linha,coluna,3) = 210+mundo(linha,coluna)/210;
        elseif((mundo(linha,coluna)<16) && (linha>2*(tammundo(1)/3)))%->tentando nao pintar argentina
            new_mundo(linha,coluna,1) = 51-1.5*mundo(linha,coluna);
            new_mundo(linha,coluna,2) = 204-1.5*mundo(linha,coluna);
            new_mundo(linha,coluna,3) = 255-1.5*mundo(linha,coluna);
        elseif((mundo(linha,coluna)>100) && (mundo(linha,coluna)<240) && (linha>3*(tammundo(1)/4)))%->antartica
            new_mundo(linha,coluna,1) = 1.3*mundo(linha,coluna);
            new_mundo(linha,coluna,2) = 1.3*mundo(linha,coluna);
            new_mundo(linha,coluna,3) = 1.3*mundo(linha,coluna);
        end
    end
end
imshow(uint8(new_mundo));
imwrite(uint8(new_mundo),'mundo_color.png');
for linha = 1:tamvista(1)
    for coluna = 1: tamvista(2)
        if(vista(linha,coluna)<lim_vista)
            new_vista(linha,coluna,1) = 255;
            new_vista(linha,coluna,2) = 255;
            new_vista(linha,coluna,3) = 0;
        end
    end
end

imwrite(uint8(new_vista),'vista_amarelo.png');
%amarelo R255 G255 B0