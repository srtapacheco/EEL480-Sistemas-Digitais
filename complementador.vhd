library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 

ENTITY complementador IS 
PORT (X0, X1,X2,X3,Kx: in std_logic;
 S0x, S1x, S2x, S3x: out std_logic);
END complementador; 


ARCHITECTURE dataflow OF complementador IS 

BEGIN 

S0x <= X0 XOR Kx;
S1x <= X1 XOR Kx;
S2x <= X2 XOR Kx;
S3x <= X3 XOR Kx;


END dataflow;


