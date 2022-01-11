library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 

-- aqui foi criado um mux 2:1 com portas logicas para ser utilizado no sistema de dividisao
ENTITY demux1_4 IS 
PORT (I_demux1_4, S0_demux1_4,S1_demux1_4: in std_logic;
 Y0_demux1_4,Y1_demux1_4,Y2_demux1_4,Y3_demux1_4: out std_logic);
END demux1_4; 


ARCHITECTURE dataflow OF demux1_4 IS 

BEGIN

Y0_demux1_4 <= I_demux1_4 AND (NOT S0_demux1_4) AND (NOT S1_demux1_4);
Y1_demux1_4 <= I_demux1_4 AND S0_demux1_4 AND (NOT S1_demux1_4);
Y2_demux1_4 <= I_demux1_4 AND (NOT S0_demux1_4) AND S1_demux1_4;
Y3_demux1_4 <= I_demux1_4 AND S0_demux1_4 AND S1_demux1_4;


END dataflow;


