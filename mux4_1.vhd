library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 

-- aqui foi criado um mux 4:1 com portas logicas para ser utilizado no sistema de dividisao
ENTITY mux4_1 IS 
PORT (A0_mux4_1,A1_mux4_1, A2_mux4_1, A3_mux4_1, S0_mux4_1,S1_mux4_1: in std_logic;
 Y_mux4_1: out std_logic);
END mux4_1; 


ARCHITECTURE dataflow OF mux4_1 IS 
SIGNAL temp1_and, temp2_and, temp3_and, temp4_and: std_logic;
BEGIN 

temp1_and <= S0_mux4_1 AND A3_mux4_1 AND S1_mux4_1;
temp2_and <= S1_mux4_1 AND A2_mux4_1 AND (NOT S0_mux4_1);
temp3_and <= S0_mux4_1 AND A1_mux4_1 AND (NOT S1_mux4_1);
temp4_and <= (NOT S0_mux4_1) AND A0_mux4_1 AND (NOT S1_mux4_1);

Y_mux4_1 <= temp1_and OR temp2_and OR temp3_and OR temp4_and;

END dataflow;


