library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 

-- aqui foi criado um mux 2:1 com portas logicas para ser utilizado no sistema de dividisao
ENTITY mux2_1 IS 
PORT (A_mux2_1,B_mux2_1, S_mux2_1: in std_logic;
 Y_mux2_1: out std_logic);
END mux2_1; 


ARCHITECTURE dataflow OF mux2_1 IS 
SIGNAL temp1, temp2: std_logic;
BEGIN 

temp1 <= A_mux2_1 AND (NOT S_mux2_1);
temp2 <= B_mux2_1 AND S_mux2_1;
Y_mux2_1 <= temp1 OR temp2;

END dataflow;


