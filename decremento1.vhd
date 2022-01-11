library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 

-- este programa subtrai 1 a um numero binario qualquer
-- valor de entrada A sao os que representam o numero binario, e os signal de entrada B representa o 1 que será subtraido
ENTITY decremento1 IS 
PORT (A1_dec,A2_dec,A3_dec,A4_dec: in std_logic;
 result1_dec,result2_dec,result3_dec,result4_dec, COUT4_dec: out std_logic);
END decremento1; 


Architecture structural of decremento1 is
signal B1_dec,B2_dec,B3_dec,B4_dec,CO_dec: std_logic;

component subtracao
PORT (A1_sub,A2_sub,A3_sub,A4_sub,B1_sub,B2_sub,B3_sub,B4_sub,COUT0_sub: in std_logic; 
 S1_sub,S2_sub,S3_sub,S4_sub,COUT4_sub: out std_logic); 
end component;

BEGIN

--definindo entradas constantes para B (equivalente a 1) para fazer a subtracao com A
B1_dec <= '1';
B2_dec <= '0';
B3_dec <= '0';
B4_dec <= '0';
CO_dec <= '0';


-- chamada de um outro componente ja criado anteriormente para realizar a operacao
sc: subtracao PORT MAP(A1_dec,A2_dec,A3_dec, A4_dec,B1_dec,B2_dec,B3_dec,B4_dec,CO_dec,result1_dec,result2_dec,result3_dec,result4_dec,COUT4_dec);


End structural;
