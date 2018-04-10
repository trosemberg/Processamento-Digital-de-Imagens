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
## @deftypefn {} {@var{retval} =} LetraB (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Tomás <tomas@tomas-Inspiron-3437>
## Created: 2018-04-10

function [imagem] = LetraB ()
  imagem = zeros(256,256);
  temp = zeros(16,16);
  i = 0;
  for (linha = 1:1:16)
    for(coluna = 1:1:16)
      temp(linha,coluna) = i;
      i++;
    end
  end

  imagem = uint8(imagem);
  for(x = 1:16)
    for(y=1:16)
      imagem((x-1)*16+1:x*16,(y-1)*16+1:y*16) = temp(x,y);
    end
  end
  imagem = uint8(imagem);
  
endfunction
