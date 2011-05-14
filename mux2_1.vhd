library ieee;
use ieee.std_logic_1164.all;
ENTITY mux2_1 IS
PORT ( 

	--input pins
	
	c1 :in std_logic;
	c0 :in std_logic;
	c :in std_logic;	
		
	--output logic gate
	s :out std_logic
	
	
);
END mux2_1;
architecture aula of mux2_1 is

	-- dec sings here

begin

	with c select
	
		s <= 
			c0 when '0',
			c1 when '1',
			'X' when others;
	

end aula;














