clc;clear;
qualidade = 50;
img = imread('Parlamento_Britanico.png');
fun = @dct2;
imagem = (blkproc(img,[8 8],fun))/8;
imshow(imagem);
imwrite(imagem,'DCT-2D.png');
Q = [16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];
if qualidade<50
    escala_quant = 50/quantidade;
else
    escala_quant = 2 - (qualidade*2)/100;
end
QuantT = max(ones(size(Q)),round(escala_quant*Q));
fun2 =@(X) round(X./QuantT);
qualid50 = round(blkproc(imagem,[8 8],fun2));
entropia_imagem = entropy(img);
entropia_qualid = entropy(uint8(qualid50));
fun3 =@(X) round(X.*QuantT);
recuperada = 8*blkproc(qualid50,[8 8],fun3);
recuperada = blkproc(recuperada,[8 8],@idct2);
figure;
imshow(uint8(recuperada));
imwrite(uint8(recuperada),'fig3_100.png');

MSE = immse(uint8(img),uint8(recuperada));
SSIM = ssim(uint8(img),uint8(recuperada));

