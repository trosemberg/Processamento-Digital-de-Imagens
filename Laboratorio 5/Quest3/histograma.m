function [ hist ] = histograma( imagem,name )
    hist = zeros(1,256);
    oi = 0;
    tamimg = size(imagem);

    for linha = 1:1:tamimg(1)
        for coluna = 1:1:tamimg(2)
            oi =  imagem(linha,coluna);
            hist(oi+1) = hist (oi+1) + 1;
        end
    end
    bar(0:255,hist);
    xlim([0 255]);
    nome = strcat(name,'_histograma.png');
    saveas(gcf,nome);
end

