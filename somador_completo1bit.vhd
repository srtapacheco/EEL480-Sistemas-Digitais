library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 

ENTITY somador_completo1bit IS 
PORT ( A: in std_logic; 
 B: in std_logic;
 cin: in std_logic; 
 cout: out std_logic;
 result: out std_logic); 
END somador_completo1bit; 

ARCHITECTURE dataflow OF somador_completo1bit IS 
BEGIN 
result <= A XOR B XOR cin; 
cout <= (A AND B) OR (A AND cin) OR (B AND cin);
END dataflow;


