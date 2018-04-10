clear;clc;
#Letra A daqui 

%imagem = "fig_2_22c.png"
%novaimagem = LetraA(imagem);
%imwrite(novaimagem,"LetraAfig3.png");

#Ate aqui

#letra B daqui

%imagem =LetraB();
%imwrite(imagem,"LetraBCrua.png"); %Cria a Imagem 256X256 e salva como letrabCrua

%imagem ="LetraBCrua.png";   %usa LetraBCrua na funçao LetraA 
%novaimagem = LetraA(imagem);
%imwrite(novaimagem,"LetraBAppLetraA.png");

#Ate aqui

