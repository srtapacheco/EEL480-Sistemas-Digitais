library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 

-- aqui foi criado um mux 2:1 com portas logicas para ser utilizado no sistema de dividisao
ENTITY detect_flags IS 
PORT (COUT3_ALU,COUT4_ALU,S0_ALU,S1_ALU,S2_ALU,S3_ALU: in std_logic;
 S_OVF,S_ZERO,S_SGN,S_COUT4: out std_logic);
END detect_flags; 


ARCHITECTURE dataflow OF detect_flags IS 

BEGIN 

S_OVF <= COUT4_ALU XOR COUT3_ALU;
S_ZERO <= NOT(S0_ALU OR S1_ALU OR S2_ALU OR S3_ALU);
S_SGN <= S3_ALU;
S_COUT4 <= COUT4_ALU;


END dataflow;


