library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 

ENTITY decodificador_binario_BCD IS 
PORT (A0,A1,A2,A3: in std_logic;
 B0,B1,B2,B3,B4: out std_logic);
END decodificador_binario_BCD; 


ARCHITECTURE dataflow OF decodificador_binario_BCD IS 
SIGNAL temp_AND1,temp_AND2,temp_OR1,temp_OR2: std_logic;

BEGIN 

temp_AND1 <= NOT A3 AND A1;
temp_AND2 <= A3 AND A2 AND NOT A1;
temp_OR1 <= (NOT A3) OR A1;
temp_OR2 <= A1 OR A2;

B0 <= A0;
B1 <= temp_AND1 AND temp_AND2;
B2 <= temp_OR1 AND A2;
B3 <= A3 AND (NOT A2) AND (NOT A1);
B4 <= temp_OR2 AND A3;


END dataflow;


