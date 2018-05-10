%% Copyright (C) 2018 Tomás
%% 
%% This program is free software; you can redistribute it and/or modify it
%% under the terms of the GNU General Public License as published by
%% the Free Software Foundation; either version 3 of the License, or
%% (at your option) any later version.
%% 
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%% 
%% You should have received a copy of the GNU General Public License
%% along with this program.  If not, see <http://www.gnu.org/licenses/>.

%% -*- texinfo -*- 
%% @deftypefn {} {@var{retval} =} filtrogeral (@var{input1}, @var{input2})
%%
%% @seealso{}
%% @end deftypefn

%% Author: Tomás <tomas@tomas-Inspiron-3437>
%% Created: 2018-03-27

function [novaimg] = filtrogeral (img, filter)            %le imagem
  tamimg = size(img);               %vetor com o tamanho da imagem
  tamfil = size(filter);            %vetor com tamanho do filtrogeral

  sumfilter = sum(sum(filter));     %multiplicando o vetor pelo inverso da soma da matriz
  if sumfilter ~= 0
    filter = filter/sumfilter;    
  end
  filter = flip(filter,1);          %duas linhas para espelhar a matriz, primeira
  filter = flip(filter,2);          %espelha em relacao as linhas e seguna as colunas

  imgtemp = zeros(tamimg(1) + 2*tamfil(1) , tamimg(2) + 2*tamfil(2));%cria uma imagem temporaria com o tamanho da imagem mais duas vezes o tamanho do filtrogeral de altura e largura

  imgtemp (tamfil(1)+1:tamimg(1) + tamfil(1),tamfil(2)+1:tamimg(2) + tamfil(2))...
  =img(1:tamimg(1),1:tamimg(2)); %preenche a imagem temporaria para que tenha uma borda ao redor da imagem original, sendo tal borda do tamanho do filtrogeral

  novaimg = zeros(tamimg(1),tamimg(2));%cria a nova imagem que sera a filtrada
  for linha = tamfil(1)+1:1:tamimg(1) + tamfil(1) %for para varrer as linhas 
    for coluna = tamfil(2)+1:1:tamimg(2) + tamfil(2) %for para varrer as colunas
      for x=1:1:tamfil(1)%for para varrer o tamanho do filtrogeral em linha
        for y=1:1:tamfil(2) %for para varrer o tamanho do filtrogeral em coluna
          novaimg(linha-tamfil(1),coluna-tamfil(2)) = novaimg(linha-tamfil(1),coluna-tamfil(2))+imgtemp(linha-ceil(tamfil(1)/2)+x,coluna-ceil(tamfil(2)/2)+y)* filter(x,y);
        end
      end
    end
  end
end
