library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 

ENTITY comparador IS 
PORT (X0,X1,X2,X3,Y0,Y1,Y2,Y3,cinG,cinE,cinS: in std_logic;
 zG,zE,zS: out std_logic);
END comparador; 


ARCHITECTURE dataflow OF comparador IS 

SIGNAL E0,E1,E2,E3: std_logic;
SIGNAL temp1_and, temp2_and, temp3_and, temp4_and,temp5_and,temp6_and,temp7_and,temp8_and,temp9_and,temp10_and,temp11_and: std_logic;

BEGIN

E0 <= X0 XNOR Y0;
E1 <= X1 XNOR Y1;
E2 <= X2 XNOR Y2;
E3 <= X3 XNOR Y3;


temp1_and <= cinS AND E0 AND E1 AND E2 AND E3;
zE <= cinE AND E0 AND E1 AND E2 AND E3;
temp3_and <= cinG AND E0 AND E1 AND E2 AND E3;
temp4_and <= X0 AND E1 AND E2 AND (NOT Y0) AND E3;
temp5_and <= E1 AND (NOT X0) AND E2 AND E3 AND Y0;
temp6_and <= X1 AND E2 AND (NOT Y1) AND E3;
temp7_and <= E2 AND (NOT X1) AND E3 AND Y1;
temp8_and <= X2 AND E3 AND (NOT Y2);
temp9_and <= (NOT X2) AND E3 AND Y2;
temp10_and <= X3 AND (NOT Y3);
temp11_and <= (NOT X3) AND Y3;

zS <=  temp11_and OR temp9_and OR temp7_and OR temp5_and OR temp1_and ;
zG <=  temp10_and OR temp8_and OR temp6_and OR temp4_and OR temp3_and;




END dataflow;


