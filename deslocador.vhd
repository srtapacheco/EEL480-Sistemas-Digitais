library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 

-- Sistema de deslocamento de 1 bit esquerda/direita (dependendo das entradas de controle d e s), feito através um MUX 4:1

ENTITY deslocador IS 

--sendo X_extremo1, X_extremo4 novos valores nos casos das entremidades
PORT (X_extremo1,X0,X1,X2,X3,X_extremo4,d_controle,s_controle: in std_logic;
 Y0,Y1,Y2,Y3: out std_logic);	
END deslocador; 


Architecture structural of deslocador is


component mux4_1
PORT (A0_mux4_1,A1_mux4_1, A2_mux4_1, A3_mux4_1, S0_mux4_1,S1_mux4_1: in std_logic;
 Y_mux4_1: out std_logic);
end component;


--inicializar arquitetura
BEGIN

sc1: mux4_1 PORT MAP(X0,X0,X1, X_extremo1,d_controle,s_controle,Y0);
sc2: mux4_1 PORT MAP(X1,X1,X2,X0,d_controle,s_controle,Y1);
sc3: mux4_1 PORT MAP(X2,X2,X3,X1,d_controle,s_controle,Y2);
sc4: mux4_1 PORT MAP(X3,X3,X_extremo4,X2,d_controle,s_controle,Y3);






End structural;
