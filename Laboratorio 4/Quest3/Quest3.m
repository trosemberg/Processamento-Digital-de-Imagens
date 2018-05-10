clc;clear;
%tirando a transformada das imagens (letra a)
orig = imread('footBallOrig.png');
nois = imread('noiseball.png');
tamimg = size(nois);
imorig = fft2(orig);
imorig = abs(imorig);
imorig = log(imorig)/12;
imorig = fftshift(imorig);
figure;
imshow(imorig);
imwrite(imorig,'moduloorig.png');
imnoise = fft2(nois);
imnoise = abs(imnoise);
imnoise = log(imnoise)/12;
imnoise = fftshift(imnoise);
figure;
imshow(imnoise);
imwrite(imnoise,'modulonoise.png');
%termino da letra a

%resolução da letra b
notch1 = notch('ideal',tamimg(1),tamimg(2),10,50,100);
notch2 = notch('ideal',tamimg(1),tamimg(2),10,1,400);
notch3 = notch('ideal',tamimg(1),tamimg(2),10,620,100);
notch4 = notch('ideal',tamimg(1),tamimg(2),10,22,414);
notch5 = notch('ideal',tamimg(1),tamimg(2),10,592,414);
notch6 = notch('ideal',tamimg(1),tamimg(2),10,1,114);
total = notch1 .* notch2 .* notch3 .* notch4 .* notch5 .* notch6;
total = fftshift(total);
figure;
imshow(total);
imwrite(total,'nothc_tabela.png');

notch1 = notch('ideal',tamimg(1),tamimg(2),10,25,50);
notch2 = notch('ideal',tamimg(1),tamimg(2),10,1,200);
notch3 = notch('ideal',tamimg(1),tamimg(2),10,310,50);
notch4 = notch('ideal',tamimg(1),tamimg(2),10,11,207);
notch5 = notch('ideal',tamimg(1),tamimg(2),10,296,207);
notch6 = notch('ideal',tamimg(1),tamimg(2),10,1,57);
totalcerto = notch1 .* notch2 .* notch3 .* notch4 .* notch5 .* notch6;
printtotalcerto = ifftshift(totalcerto);
figure;
imshow(printtotalcerto);
imwrite(printtotalcerto,'nothc_correto.png');
%Termino da letra B

%começo da letra c
imnoise = imnoise.*ifftshift(totalcerto);
imnoise_sem_norm = fft2(nois);
imnoise_sem_norm = imnoise_sem_norm.*totalcerto;

figure; 
imshow(imnoise);
imwrite(imnoise,'Freq_noise_filtrada.png');

imnoise_sem_norm = ifft2(imnoise_sem_norm);
figure; 
imnoise_sem_norm = uint8(real(imnoise_sem_norm));
imshow(imnoise_sem_norm);
imwrite(imnoise_sem_norm,'imagem_filtrada.png');
%termino da letra c