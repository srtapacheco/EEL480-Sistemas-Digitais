library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 

-- construcao de mux 8:4, utilizando 4 muxs 2:1

ENTITY mux8_4 IS 
PORT (A0_mux8_4,A1_mux8_4,A2_mux8_4,A3_mux8_4,B0_mux8_4,B1_mux8_4,B2_mux8_4, B3_mux8_4,Kmx_mux8_4: in std_logic;
 Y0_mux8_4,Y1_mux8_4,Y2_mux8_4,Y3_mux8_4: out std_logic);
END mux8_4; 


ARCHITECTURE dataflow OF mux8_4 IS 

component mux2_1
PORT (A_mux2_1,B_mux2_1, S_mux2_1: in std_logic;
 Y_mux2_1: out std_logic);
end component;




BEGIN

sc0_mux: mux2_1 PORT MAP(A0_mux8_4,B0_mux8_4,Kmx_mux8_4,Y0_mux8_4);
sc1_mux: mux2_1 PORT MAP(A1_mux8_4,B1_mux8_4,Kmx_mux8_4,Y1_mux8_4);
sc2_mux: mux2_1 PORT MAP(A2_mux8_4,B2_mux8_4,Kmx_mux8_4,Y2_mux8_4);
sc3_mux: mux2_1 PORT MAP(A3_mux8_4,B3_mux8_4,Kmx_mux8_4,Y3_mux8_4);


END dataflow;


