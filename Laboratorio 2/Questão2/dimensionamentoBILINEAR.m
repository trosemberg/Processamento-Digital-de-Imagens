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
## @deftypefn {} {@var{retval} =} dimensionamento (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Tomás <tomas@tomas-Inspiron-3437>
## Created: 2018-04-02

function [novaimg] = dimensionamentoBILINEAR (imagem, dime)
  img = imread(imagem);
  tamimg = size(img);
  imgtemp = zeros(tamimg(1)+dime,tamimg(2)+dime,tamimg(3));
  imgtemp(1:tamimg(1),1:tamimg(2),1:tamimg(3)) = img(1:tamimg(1),1:tamimg(2),1:tamimg(3));
  novaimg = zeros(tamimg(1)*dime,tamimg(2)*dime,tamimg(3));
  tamnimg = size(novaimg);
  img = double(img);
  novaimg = double(novaimg);
  if(dime>1)
    for(y=1:dime)
      novaimg((y:dime:tamnimg(1)),1:dime:tamnimg(2),1:1:tamnimg(3)) = ((dime+1-y)/dime)*img(1:tamimg(1),1:tamimg(2),1:1:tamnimg(3)) + ((y-1)/dime)*imgtemp(2:tamimg(1)+1,1:tamimg(2),1:1:tamnimg(3));
    end
    for(prof = 1 : 1 : tamnimg(3))
      for(coluna = 1: dime: tamnimg(2)-dime)
        for(linha = 1 : 1 : tamnimg(1))
          for(x=1:dime)
            novaimg(linha,coluna+x-1,prof) = ((dime+1-x)/dime)*novaimg(linha,coluna,prof) + ((x-1)/dime)*novaimg(linha,coluna+dime,prof);
          end
        end
      end
    end    
    %novaimg(1:dime:tamnimg(1),1:dime:tamnimg(2),1:tamnimg(3)) = img(1:tamimg(1),1:tamimg(2),1:tamimg(3));    
  elseif(dime == 1)
    novaimg = img;
  else
    novaimg(1:1:tamnimg(1),1:1:tamnimg(2),1:tamnimg(3))=img(1:(1/dime):tamimg(1),1:(1/dime):tamimg(2),1:tamimg(3));
  end
  img = uint8(img);
  novaimg = uint8(novaimg);
endfunction