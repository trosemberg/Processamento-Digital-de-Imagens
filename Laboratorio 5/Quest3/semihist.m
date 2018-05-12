function [ hist ] = semihist( imagem )
    hist = zeros(1,256);
    oi = 0;
    tamimg = size(imagem);

    for linha = 1:1:tamimg(1)
        for coluna = 1:1:tamimg(2)
            oi =  imagem(linha,coluna);
            hist(oi+1) = hist (oi+1) + 1;
        end
    end
end

