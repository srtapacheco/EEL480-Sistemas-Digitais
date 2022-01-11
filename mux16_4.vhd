library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 

-- aqui foi criado um mux 2:1 com portas logicas para ser utilizado no sistema de dividisao
ENTITY mux16_4 IS 
PORT (Y0_mux16_4,Y1_mux16_4,Y2_mux16_4,Y3_mux16_4,Y4_mux16_4,Y5_mux16_4,Y6_mux16_4,Y7_mux16_4,Y8_mux16_4,
 Y9_mux16_4,Y10_mux16_4,Y11_mux16_4,Y12_mux16_4,Y13_mux16_4,Y14_mux16_4,Y15_mux16_4,
 S0_controle_mux16_4,S1_controle_mux16_4: in std_logic;
 I0_mux16_4,I1_mux16_4,I2_mux16_4,I3_mux16_4: out std_logic);
END mux16_4; 


ARCHITECTURE dataflow OF mux16_4 IS 


component mux4_1
PORT (A0_mux4_1,A1_mux4_1, A2_mux4_1, A3_mux4_1, S0_mux4_1,S1_mux4_1: in std_logic;
 Y_mux4_1: out std_logic);
end component;

BEGIN

sc0x_mux1: mux4_1 PORT MAP(Y0_mux16_4,Y1_mux16_4,Y2_mux16_4,Y3_mux16_4,S0_controle_mux16_4,S1_controle_mux16_4,I0_mux16_4);
sc1x_mux1: mux4_1 PORT MAP(Y4_mux16_4,Y5_mux16_4,Y6_mux16_4,Y7_mux16_4,S0_controle_mux16_4,S1_controle_mux16_4,I1_mux16_4);
sc2x_mux1: mux4_1 PORT MAP(Y8_mux16_4,Y9_mux16_4,Y10_mux16_4,Y11_mux16_4,S0_controle_mux16_4,S1_controle_mux16_4,I2_mux16_4);
sc3x_mux1: mux4_1 PORT MAP(Y12_mux16_4,Y13_mux16_4,Y14_mux16_4,Y15_mux16_4,S0_controle_mux16_4,S1_controle_mux16_4,I3_mux16_4);




END dataflow;


