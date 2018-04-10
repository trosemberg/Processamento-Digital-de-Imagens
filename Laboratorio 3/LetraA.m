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
## @deftypefn {} {@var{retval} =} LetraA (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Tomás <tomas@tomas-Inspiron-3437>
## Created: 2018-04-10

function [newimg] = LetraA (imagem)
  img = imread(imagem);
  tamimg = size(img);
  newimg = zeros(tamimg(1)*3,tamimg(2)*3);
  tamnewimg = size(newimg);
  x0 = [0,0,0;0,0,0;0,0,0];
  x1 = [0,255,0;0,0,0;0,0,0];
  x2 = [0,255,0;0,0,0;0,0,255];
  x3 = [255,255,0;0,0,0;0,0,255];
  x4 = [255,255,0;0,0,0;255,0,255];
  x5 = [255,255,255;0,0,0;255,0,255];
  x6 = [255,255,255;0,0,255;255,0,255];
  x7 = [255,255,255;0,0,255;255,255,255];
  x8 = [255,255,255;255,0,255;255,255,255];
  x9 = [255,255,255;255,255,255;255,255,255];
  newimg = double(newimg);
  for(linha = 1:1:tamimg(1))
    for(coluna = 1:1: tamimg(2))
      if(floor(img(linha,coluna)/25.5) == 0)
        newimg((linha-1)*3+1:1:(linha-1)*3+3,(coluna-1)*3+1:1:(coluna-1)*3+3) = x0(1:3,1:3); 
      elseif(floor(img(linha,coluna)/25.5) == 1)
        newimg((linha-1)*3+1:1:(linha-1)*3+3,(coluna-1)*3+1:1:(coluna-1)*3+3) = x1(1:1:3,1:1:3);
      elseif(floor(img(linha,coluna)/25.5) == 2)
        newimg((linha-1)*3+1:1:(linha-1)*3+3,(coluna-1)*3+1:1:(coluna-1)*3+3) = x2(1:1:3,1:1:3);
      elseif(floor(img(linha,coluna)/25.5) == 3)
        newimg((linha-1)*3+1:1:(linha-1)*3+3,(coluna-1)*3+1:1:(coluna-1)*3+3) = x3(1:1:3,1:1:3);
      elseif(floor(img(linha,coluna)/25.5) == 4)
        newimg((linha-1)*3+1:1:(linha-1)*3+3,(coluna-1)*3+1:1:(coluna-1)*3+3) = x4(1:1:3,1:1:3);
      elseif(floor(img(linha,coluna)/25.5) == 5)
        newimg((linha-1)*3+1:1:(linha-1)*3+3,(coluna-1)*3+1:1:(coluna-1)*3+3) = x5(1:1:3,1:1:3);
      elseif(floor(img(linha,coluna)/25.5) == 6)
        newimg((linha-1)*3+1:1:(linha-1)*3+3,(coluna-1)*3+1:1:(coluna-1)*3+3) = x6(1:1:3,1:1:3);
      elseif(floor(img(linha,coluna)/25.5) == 7)
        newimg((linha-1)*3+1:1:(linha-1)*3+3,(coluna-1)*3+1:1:(coluna-1)*3+3) = x7(1:1:3,1:1:3);
      elseif(floor(img(linha,coluna)/25.5) == 8)
        newimg((linha-1)*3+1:1:(linha-1)*3+3,(coluna-1)*3+1:1:(coluna-1)*3+3) = x8(1:1:3,1:1:3);
      else
        newimg((linha-1)*3+1:1:(linha-1)*3+3,(coluna-1)*3+1:1:(coluna-1)*3+3) = x9(1:1:3,1:1:3);
      end
    end
  end
  newimg = uint8(newimg);
endfunction
