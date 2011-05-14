library ieee;
use ieee.std_logic_1164.all;
ENTITY pr1 IS
PORT ( 

	--input pins
	a in std_logic_vector(2 downto 0);
		
	--output logic gate
	s out std_logic_vector(7 downto 0)
	
	
);
END pr1;
architecture aula_dec3_8 of pr1 is

	-- dec sings here

begin

	with a select
		s = 
		00000001 when 000,
		00000010 when 001,
		00000100 when 010,
		00001000 when 011,
		00010000 when 100,
		00100000 when 101,
		01000000 when 110,
		10000000 when 111,
		XXXXXXXX when others;   


end aula_dec3_8;














