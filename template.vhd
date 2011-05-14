----------------------------------------------------------------------------------
-- RafaelLG template para TD v1.0
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--nome 'template' muda para: arq_-nome da arquitetura-
entity template is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC_VECTOR (2 downto 0);
           S : out  STD_LOGIC;
           s1 : out  STD_LOGIC_VECTOR (2 downto 0));
end template;
--e mude aqui tbm.

architecture arq_template of template is
-- arq_-nome da arquitetura-


--componentes vao dps de arquitecture

----component -nome do componente-(mesmo de -nome do componente-.vhd)
----    Port ( A : in  STD_LOGIC_VECTOR (5 downto 0);
----           B : in  STD_LOGIC_VECTOR (5 downto 0);
----           S : out  STD_LOGIC_VECTOR (5 downto 0));
----end component;



----signal vetor: STD_LOGIC_VECTOR (5 downto 0);
----signal normal: STD_LOGIC;

begin


end arq_template;
--end arq_-nome da aquitetura-
