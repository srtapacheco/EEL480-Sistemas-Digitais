library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 

-- aqui foi criado um mux 2:1 com portas logicas para ser utilizado no sistema de dividisao
ENTITY rede_combinacional IS 
PORT (A_rede,B_rede, C_rede: in std_logic;
 Kx,Ky,Kmx,Cin0,S0_dmx1_controle,S1_dmx1_controle,d_deslocador_controle: out std_logic);
END rede_combinacional; 


ARCHITECTURE dataflow OF rede_combinacional IS 

BEGIN 

Kx <= (NOT A_rede) AND (B_rede AND C_rede);
Ky <= ((NOT A_rede) AND (NOT B_rede) AND C_rede) OR (A_rede AND B_rede AND (NOT C_rede));
--Ky <= ((NOT B_rede) AND (C_rede)) OR (A_rede AND (NOT C_rede)); c
Kmx <= ((NOT A_rede) AND (NOT B_rede)) OR (A_rede AND B_rede AND C_rede);
Cin0 <= ((NOT A_rede) AND C_rede) OR ((NOT C_rede) AND B_rede);

--para 1,0
--S1_dmx1_controle <= (A_rede AND (NOT B_rede)) OR (A_rede AND C_rede);
--S0_dmx1_controle <= '0'; 


--- para 0,1
S1_dmx1_controle <= (A_rede AND B_rede AND C_rede);
S0_dmx1_controle <= (A_rede AND (NOT B_rede)); 
d_deslocador_controle <= C_rede;






END dataflow;


