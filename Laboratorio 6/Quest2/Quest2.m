imagem = imread('strawberries_coffee.png');
img = (round(imagem*(5/255)))*(255/5);
imwrite(uint8(img),'morango_safe.png');

imagem = imread('ColourCube.bmp');
img_1 = (round(imagem*(5/255)))*(255/5);
imwrite(uint8(img_1),'Cubo_safe.png');
