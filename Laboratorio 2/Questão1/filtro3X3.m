## Copyright (C) 2018 Tomás
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} filtro3X3 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Tomás <tomas@tomas-Inspiron-3437>
## Created: 2018-03-27

function [novaimg] = filtro3X3 (imagem, filter)
  img = imread(imagem);            %le imagem
  tamimg = size(img);               %vetor com o tamanho da imagem
  tamfil = size(filter);            %vetor com tamanho do filtro

  sumfilter = sum(sum(filter));     %multiplicando o vetor pelo inverso da soma da matriz
  if sumfilter ~= 0
    filter = filter/sumfilter;    
  end
  filter = flip(filter,1);          %duas linhas para espelhar a matriz, primeira
  filter = flip(filter,2);          %espelha em relacao as linhas e seguna as colunas

  imgtemp = zeros(tamimg(1) + 2*tamfil(1) , tamimg(2) + 2*tamfil(2), tamimg(3));%cria uma imagem temporaria com o tamanho da imagem mais duas vezes o tamanho do filtro de altura e largura

  imgtemp (tamfil(1)+1:tamimg(1) + tamfil(1),tamfil(2)+1:tamimg(2) + tamfil(2), 1:tamimg(3))...
  =img(1:tamimg(1),1:tamimg(2),1:tamimg(3)); %preenche a imagem temporaria para que tenha uma borda ao redor da imagem original, sendo tal borda do tamanho do filtro

  novaimg = zeros(tamimg(1),tamimg(2),tamimg(3));%cria a nova imagem que sera a filtrada
  novaimg = double(novaimg);
  img = double(img);
  imgtemp = double(imgtemp);
  for(prof = 1:1:tamimg(3)) %for variando o canal da imagem de 1 a 3
    for(linha = tamfil(1)+1:1:tamimg(1) + tamfil(1)) %for para varrer as linhas 
      for(coluna = tamfil(2)+1:1:tamimg(2) + tamfil(2)) %for para varrer as colunas
        novaimg(linha-tamfil(1),coluna-tamfil(2),prof) = imgtemp(linha-1,coluna-1,prof)* filter(1,1)+imgtemp(linha-1,coluna,prof)* filter(1,2)+imgtemp(linha-1,coluna+1,prof)* filter(1,3)...
        +imgtemp(linha,coluna-1,prof)* filter(2,1)+imgtemp(linha,coluna,prof)* filter(2,2)+imgtemp(linha,coluna+1,prof)* filter(2,3)...
        +imgtemp(linha+1,coluna-1,prof)* filter(3,1)+imgtemp(linha+1,coluna,prof)* filter(3,2)+imgtemp(linha+1,coluna+1,prof)* filter(3,3);
      end
    end
  end
  novaimg = uint8(novaimg);
  img = uint8(img);
  imgtemp = uint8(imgtemp);
  imshow(img);
  figure;
  imshow(novaimg);
  imwrite(novaimg,"passaalta.png");
endfunction
