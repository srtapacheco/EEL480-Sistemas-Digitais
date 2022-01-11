library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 

ENTITY ALU IS 
PORT(A1_ALU,A2_ALU,A3_ALU,A4_ALU, B1_ALU,B2_ALU,B3_ALU,B4_ALU, COUT0_ALU,F0_ALU,F1_ALU,F2_ALU: in std_logic; 
 S0_ALU,S1_ALU,S2_ALU,S3_ALU, COUT4_ALU, OVF_ALU,ZERO_ALU,SGN_ALU: out std_logic); 
END ALU; 

ARCHITECTURE dataflow OF ALU IS 

-- SINAL temporario para o carryout 3 do circuito somador com o objetivo de detectar overflow
SIGNAL COUT3_ALU,COUT4_TEMP: std_logic;

-- Sinais temporarios para saida da rede combinacional
SIGNAL C0_ALU, Kx_ALU, Ky_ALU,Kmx_ALU,S0_dmx1_controle_ALU,S1_dmx1_controle_ALU, S0_dmx2_controle_ALU,d_deslocador_controle_ALU: std_logic;

-- Sinais temporarios para saida do complementador x
SIGNAL S0x_ALU, S1x_ALU,S2x_ALU,S3x_ALU: std_logic;

-- Sinais temporarios para saida do complementador y
SIGNAL S0y_ALU, S1y_ALU,S2y_ALU,S3y_ALU: std_logic;

-- Sinais temporarios para saida do mux 8:4
SIGNAL S0_mux8_4,S1_mux8_4,S2_mux8_4,S3_mux8_4: std_logic;

-- sinais temporarios para a saida do mux 16:4
SIGNAL S0_temp_mux16_4,S1_temp_mux16_4,S2_temp_mux16_4,S3_temp_mux16_4: std_logic;

-- SINAIS temporarios para a saida do decodificador BCD
SIGNAL BCD_S0,BCD_S1,BCD_S2,BCD_S3,BCD_S4,BCD_S5,BCD_S6,BCD_S7,BCD_S8,BCD_S9,BCD_S10,BCD_S11,BCD_S12,BCD_S13,BCD_S14: std_logic;

-- Sinais temporarios para saida do DEMUX 1 4:16
SIGNAL Y0_1demux4_16_ALU,Y1_1demux4_16_ALU,Y2_1demux4_16_ALU,Y3_1demux4_16_ALU: std_logic;
SIGNAL Y4_1demux4_16_ALU,Y5_1demux4_16_ALU,Y6_1demux4_16_ALU,Y7_1demux4_16_ALU: std_logic;
SIGNAL Y8_1demux4_16_ALU,Y9_1demux4_16_ALU,Y10_1demux4_16_ALU,Y11_1demux4_16_ALU: std_logic;
SIGNAL Y12_1demux4_16_ALU,Y13_1demux4_16_ALU,Y14_1demux4_16_ALU,Y15_1demux4_16_ALU: std_logic;

-- Sinais temporarios para saida do DEMUX 2 4:16
SIGNAL Y0_2demux4_16_ALU,Y1_2demux4_16_ALU,Y2_2demux4_16_ALU,Y3_2demux4_16_ALU: std_logic;
SIGNAL Y4_2demux4_16_ALU,Y5_2demux4_16_ALU,Y6_2demux4_16_ALU,Y7_2demux4_16_ALU: std_logic;
SIGNAL Y8_2demux4_16_ALU,Y9_2demux4_16_ALU,Y10_2demux4_16_ALU,Y11_2demux4_16_ALU: std_logic;
SIGNAL Y12_2demux4_16_ALU,Y13_2demux4_16_ALU,Y14_2demux4_16_ALU,Y15_2demux4_16_ALU: std_logic;

-- SAIDAS temporarias de cada operacao
SIGNAL S0_SOMADOR,S1_SOMADOR,S2_SOMADOR,S3_SOMADOR: std_logic;

SIGNAL S0_DESLOC,S1_DESLOC,S2_DESLOC,S3_DESLOC: std_logic;

SIGNAL S_GREATER_COMP,S_EQUAL_COMP,S_SMALLER_COMP,S3_COMP: std_logic;

--zG,zE,zS

component rede_combinacional
PORT (A_rede,B_rede, C_rede: in std_logic;
 Kx,Ky,Kmx,Cin0,S0_dmx1_controle,S1_dmx1_controle,d_deslocador_controle: out std_logic);
end component;

component complementador
PORT (X0,X1,X2,X3,Kx: in std_logic;
 S0x, S1x, S2x, S3x: out std_logic);
end component;
 
component mux8_4
PORT (A0_mux8_4,A1_mux8_4,A2_mux8_4,A3_mux8_4,B0_mux8_4,B1_mux8_4,B2_mux8_4, B3_mux8_4,Kmx_mux8_4: in std_logic;
 Y0_mux8_4,Y1_mux8_4,Y2_mux8_4,Y3_mux8_4: out std_logic);
end component;

component mux16_4
PORT (Y0_mux16_4,Y1_mux16_4,Y2_mux16_4,Y3_mux16_4,Y4_mux16_4,Y5_mux16_4,Y6_mux16_4,Y7_mux16_4,Y8_mux16_4,
 Y9_mux16_4,Y10_mux16_4,Y11_mux16_4,Y12_mux16_4,Y13_mux16_4,Y14_mux16_4,Y15_mux16_4,
 S0_controle_mux16_4,S1_controle_mux16_4: in std_logic;
 I0_mux16_4,I1_mux16_4,I2_mux16_4,I3_mux16_4: out std_logic);
end component;

component demux4_16
PORT (I0_demux4_16,I1_demux4_16,I2_demux4_16,I3_demux4_16, S0_controle_demux4_16,S1_controle_demux4_16: in std_logic;
 Y0_demux4_16,Y1_demux4_16,Y2_demux4_16,Y3_demux4_16,Y4_demux4_16,Y5_demux4_16,Y6_demux4_16,Y7_demux4_16,Y8_demux4_16,Y9_demux4_16,Y10_demux4_16,Y11_demux4_16,Y12_demux4_16,Y13_demux4_16,Y14_demux4_16,Y15_demux4_16: out std_logic);
end component;

component somador_completo_4bits
PORT (A1,A2,A3,A4,B1,B2,B3,B4,C0: in std_logic;
 S1,S2,S3,S4,COUT3,COUT4: out std_logic);
end component;

component comparador
PORT (X0,X1,X2,X3,Y0,Y1,Y2,Y3,cinG,cinE,cinS: in std_logic;
 zG,zE,zS: out std_logic);
end component;

component deslocador
PORT (X_extremo1,X0,X1,X2,X3,X_extremo4,d_controle,s_controle: in std_logic;
 Y0,Y1,Y2,Y3: out std_logic);
end component;

component detect_flags
PORT (COUT3_ALU,COUT4_ALU,S0_ALU,S1_ALU,S2_ALU,S3_ALU: in std_logic;
 S_OVF,S_ZERO,S_SGN,S_COUT4: out std_logic);
end component;

component decodificador_binario_BCD
PORT (A0,A1,A2,A3: in std_logic;
 B0,B1,B2,B3,B4: out std_logic);
end component;
 

BEGIN

--- entradas de controle e circuito combinacional da ALU -----------
cr: rede_combinacional PORT MAP(F0_ALU,F1_ALU,F2_ALU,
Kx_ALU,Ky_ALU,Kmx_ALU,C0_ALU,S0_dmx1_controle_ALU,S1_dmx1_controle_ALU,d_deslocador_controle_ALU);


cr_x: complementador PORT MAP(A1_ALU,A2_ALU,A3_ALU,A4_ALU,Kx_ALU,S0x_ALU,S1x_ALU,S2x_ALU,S3x_ALU);
cr_mux: mux8_4 PORT MAP(F0_ALU and F1_ALU and not F2_ALU,'0','0','0',B1_ALU,B2_ALU,B3_ALU,B4_ALU,Kmx_ALU,S0_mux8_4,S1_mux8_4,S2_mux8_4,S3_mux8_4);
cr_y: complementador PORT MAP(S0_mux8_4,S1_mux8_4,S2_mux8_4,S3_mux8_4,Ky_ALU,S0y_ALU,S1y_ALU,S2y_ALU,S3y_ALU);


scx_demux1: demux4_16 PORT MAP(S0x_ALU,S1x_ALU,S2x_ALU,S3x_ALU,
S0_dmx1_controle_ALU,S1_dmx1_controle_ALU,
Y0_1demux4_16_ALU,Y1_1demux4_16_ALU,Y2_1demux4_16_ALU,Y3_1demux4_16_ALU,
Y4_1demux4_16_ALU,Y5_1demux4_16_ALU,Y6_1demux4_16_ALU,Y7_1demux4_16_ALU,
Y8_1demux4_16_ALU,Y9_1demux4_16_ALU,Y10_1demux4_16_ALU,Y11_1demux4_16_ALU,
Y12_1demux4_16_ALU,Y13_1demux4_16_ALU,Y14_1demux4_16_ALU,Y15_1demux4_16_ALU);

scy_demux2: demux4_16 PORT MAP(S0y_ALU,S1y_ALU,S2y_ALU,S3y_ALU, 
S0_dmx1_controle_ALU,S1_dmx1_controle_ALU,
Y0_2demux4_16_ALU,Y1_2demux4_16_ALU,Y2_2demux4_16_ALU,Y3_2demux4_16_ALU,
Y4_2demux4_16_ALU,Y5_2demux4_16_ALU,Y6_2demux4_16_ALU,Y7_2demux4_16_ALU,
Y8_2demux4_16_ALU,Y9_2demux4_16_ALU,Y10_2demux4_16_ALU,Y11_2demux4_16_ALU,
Y12_2demux4_16_ALU,Y13_2demux4_16_ALU,Y14_2demux4_16_ALU,Y15_2demux4_16_ALU);

sc_mod1: somador_completo_4bits PORT MAP(Y0_1demux4_16_ALU,Y4_1demux4_16_ALU,Y8_1demux4_16_ALU,Y12_1demux4_16_ALU,
Y0_2demux4_16_ALU,Y4_2demux4_16_ALU,Y8_2demux4_16_ALU,Y12_2demux4_16_ALU,
C0_ALU,S0_SOMADOR,S1_SOMADOR,S2_SOMADOR,S3_SOMADOR, COUT3_ALU,COUT4_TEMP);

sc_mod2: deslocador PORT MAP('0',
Y1_1demux4_16_ALU,Y5_1demux4_16_ALU,Y9_1demux4_16_ALU,Y13_1demux4_16_ALU,Y13_1demux4_16_ALU,
d_deslocador_controle_ALU,'1',S0_DESLOC,S1_DESLOC,S2_DESLOC,S3_DESLOC);


sc_mod3: comparador PORT MAP(Y2_1demux4_16_ALU,Y6_1demux4_16_ALU,Y10_1demux4_16_ALU,Y14_1demux4_16_ALU,
Y2_2demux4_16_ALU,Y6_2demux4_16_ALU,Y10_2demux4_16_ALU,Y14_2demux4_16_ALU,'0','1','0',S_GREATER_COMP,S_EQUAL_COMP,S_SMALLER_COMP);


sc_mux2: mux16_4 PORT MAP(S0_SOMADOR,S0_DESLOC,S_GREATER_COMP,'0',
S1_SOMADOR,S1_DESLOC,S_EQUAL_COMP,'0',
S2_SOMADOR,S2_DESLOC,S_SMALLER_COMP,'0',
S3_SOMADOR,S3_DESLOC,'0','0',
S0_dmx1_controle_ALU,S1_dmx1_controle_ALU,
S0_temp_mux16_4,S1_temp_mux16_4,S2_temp_mux16_4,S3_temp_mux16_4);


sc_flags: detect_flags PORT MAP(COUT3_ALU,COUT4_TEMP,S0_SOMADOR,S1_SOMADOR,S2_SOMADOR,S3_SOMADOR,OVF_ALU,ZERO_ALU,SGN_ALU,COUT4_ALU);

sc_display1: decodificador_binario_BCD PORT MAP(A1_ALU,A2_ALU,A3_ALU,A4_ALU,BCD_S0,BCD_S1,BCD_S2,BCD_S3,BCD_S4);
sc_display2: decodificador_binario_BCD PORT MAP(B1_ALU,B2_ALU,B3_ALU,B4_ALU,BCD_S5,BCD_S6,BCD_S7,BCD_S8,BCD_S9);
sc_display3: decodificador_binario_BCD PORT MAP(S0_temp_mux16_4,S1_temp_mux16_4,S2_temp_mux16_4,S3_temp_mux16_4,BCD_S10,BCD_S11,BCD_S12,BCD_S13,BCD_S14);

S0_ALU <= S0_temp_mux16_4;
S1_ALU <= S1_temp_mux16_4;
S2_ALU <= S2_temp_mux16_4;
S3_ALU <= S3_temp_mux16_4;

-------------------------------------- chamadas de funcao para TESTE na ALU --------------------------------------


--sc1: somador_completo_4bits PORT MAP(A1_ALU,A2_ALU,A3_ALU,A4_ALU, B1_ALU,B2_ALU,B3_ALU,B4_ALU, COUT0_ALU,S0_ALU,S1_ALU,S2_ALU,S3_ALU, COUT4_ALU);
--sc2: subtracao PORT MAP(A1_ALU,A2_ALU,A3_ALU,A4_ALU, B1_ALU,B2_ALU,B3_ALU,B4_ALU, COUT0_ALU,S0_ALU,S1_ALU,S2_ALU,S3_ALU, COUT4_ALU);

--no multiplicador de 2 eh possivel inserir numeros positivos e negativos pois os valores sao enviados para o fulladder
--sc3: multiplicador2 PORT MAP(A1_ALU,A2_ALU,A3_ALU,A4_ALU,S0_ALU,S1_ALU,S2_ALU,S3_ALU);

-- apenas entradas positivas para o divisor (ENTRADAS BINARIAS SERVEM PRA CONFIGURACAO DO SHIFT RIGH usando no circuito de divisao)
--sc4: divisor2 PORT MAP(A1_ALU,A2_ALU,A3_ALU,A4_ALU,S0_ALU,S1_ALU,S2_ALU,S3_ALU);

--sc5: troca_de_sinal PORT MAP(A1_ALU,A2_ALU,A3_ALU,A4_ALU,S0_ALU,S1_ALU,S2_ALU,S3_ALU,COUT4_ALU);
--sc6: incremento1 PORT MAP(A1_ALU,A2_ALU,A3_ALU,A4_ALU,S0_ALU,S1_ALU,S2_ALU,S3_ALU, COUT4_ALU);
--sc7: decremento1 PORT MAP(A1_ALU,A2_ALU,A3_ALU,A4_ALU,S0_ALU,S1_ALU,S2_ALU,S3_ALU, COUT4_ALU);
--sc8: comparador PORT MAP(A1_ALU,A2_ALU,A3_ALU,A4_ALU,B1_ALU,B2_ALU,B3_ALU,B4_ALU,'0','1','0',S0_ALU,S1_ALU,S2_ALU);

END dataflow;


