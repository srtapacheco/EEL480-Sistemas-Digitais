library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 
use std.textio.all;



Entity ALU_test is
End ALU_test;


Architecture test of ALU_test is

--esta ULA recebe numeros negativos pra soma ja em complemento de 2

signal A1_ALU_test, A2_ALU_test, A3_ALU_test,A4_ALU_test,COUT0_ALU_test,B1_ALU_test,B2_ALU_test,B3_ALU_test,B4_ALU_test,F0_ALU_test,F1_ALU_test,F2_ALU_test: std_logic;  -- inputs 
signal S0_ALU_test,S1_ALU_test,S2_ALU_test,S3_ALU_test, COUT4_ALU_test,OVF_ALU_test,ZERO_ALU_teste,SGN_ALU_teste : std_logic;  -- outputs

-- Geração de estímulos
Begin

 -- Instância do componente ALU para interconexão do componente com o processo de estímulo
	 	 
sc_ALU: entity work.ALU port map (A1_ALU => A1_ALU_test, A2_ALU => A2_ALU_test, A3_ALU => A3_ALU_test, A4_ALU => A4_ALU_test,
 B1_ALU => B1_ALU_test,B2_ALU => B2_ALU_test,B3_ALU=>B3_ALU_test,B4_ALU=>B4_ALU_test,
 COUT0_ALU => COUT0_ALU_test, 
 S0_ALU=>S0_ALU_test,S1_ALU => S1_ALU_test,S2_ALU=>S2_ALU_test,S3_ALU => S3_ALU_test, COUT4_ALU => COUT4_ALU_test, OVF_ALU => OVF_ALU_test,ZERO_ALU =>ZERO_ALU_teste, SGN_ALU => SGN_ALU_teste,
 F0_ALU => F0_ALU_test, F1_ALU => F1_ALU_test,F2_ALU => F2_ALU_test);

-- inputs
    -- 00 at 0 ns
    -- 01 at 20 ns, as b is 0 at 20 ns and a is changed to 1 at 20 ns
    -- 10 at 40 ns
    -- 11 at 60 ns
A1_ALU_test <=  '0', '1' after 10 ns, '0' after 20 ns, '0' after 90 ns;
A2_ALU_test  <= '0', '1' after 10 ns, '1' after 20 ns, '0' after 90 ns;
A3_ALU_test  <= '0', '1' after 10 ns, '0' after 20 ns, '0' after 90 ns;
A4_ALU_test  <= '1', '1' after 10 ns, '0' after 20 ns, '0' after 90 ns;
COUT0_ALU_test  <= '0', '0' after 10 ns, '1' after 20 ns, '0' after 30 ns;
B1_ALU_test  <= '0', '1' after 10 ns, '0' after 20 ns, '0' after 90 ns;
B2_ALU_test  <= '0', '0' after 10 ns, '0' after 20 ns, '0' after 90 ns;
B3_ALU_test  <= '0', '0' after 10 ns, '1' after 20 ns, '0' after 90 ns;
B4_ALU_test  <= '1', '0' after 10 ns, '0' after 20 ns, '0' after 90 ns;

F0_ALU_test  <= '0', '0' after 10 ns, '0' after 20 ns, '0' after 30 ns, '1' after 40 ns, '1' after 50 ns, '1' after 60 ns, '1' after 70 ns, '0' after 90 ns;
F1_ALU_test  <= '0', '0' after 10 ns, '1' after 20 ns, '1' after 30 ns, '0' after 40 ns, '0' after 50 ns, '1' after 60 ns, '1' after 70 ns, '0' after 90 ns;
F2_ALU_test  <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns, '0' after 60 ns, '1' after 70 ns, '0' after 90 ns;


End test;