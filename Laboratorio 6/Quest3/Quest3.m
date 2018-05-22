mundo = imread('world_map.png');
vista = imread('view.png');
tammundo = size(mundo);
tamvista = size(vista);
new_mundo = zeros(tammundo(1),tammundo(2),3);
new_vista = zeros(tamvista(1),tamvista(2),3);
new_mundo(:,:,1) = mundo(:,:);
new_mundo(:,:,2) = mundo(:,:);
new_mundo(:,:,3) = mundo(:,:);
lim_mundo=50;
lim_mundo_m = 180;
lim_vista=20;
new_vista(:,:,1) = vista(:,:);
new_vista(:,:,2) = vista(:,:);
new_vista(:,:,3) = vista(:,:);
for(linha = 1:tammundo(1))
    for(coluna = 1: tammundo(2))
        if(mundo(linha,coluna)<lim_mundo)
            new_mundo(linha,coluna,1) = 0;
            new_mundo(linha,coluna,2) = 153;
            new_mundo(linha,coluna,3) = 153;
        end
            if(mundo(linha,coluna)>lim_mundo_m)
            new_mundo(linha,coluna,1) = 102;
            new_mundo(linha,coluna,2) = 255;
            new_mundo(linha,coluna,3) = 102;
        end
    end
end
imwrite(uint8(new_mundo),'mundo_amarelo.png');
for(linha = 1:tamvista(1))
    for(coluna = 1: tamvista(2))
        if(vista(linha,coluna)<lim_vista)
            new_vista(linha,coluna,1) = 255;
            new_vista(linha,coluna,2) = 255;
            new_vista(linha,coluna,3) = 0;
        end
    end
end

imwrite(uint8(new_vista),'vista_amarelo.png');
%amarelo R255 G255 B0