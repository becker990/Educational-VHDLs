library ieee;
use ieee.std_logic_1164.all;
ENTITY half_adder IS
PORT ( 

	--input pins
	a :in std_logic;
	b :in std_logic;
	
	--carry out
	c :out std_logic; 
		
	--output logic gate
	s :out std_logic
	
);
END half_adder;
architecture aula of half_adder is
begin


	s <= a xor b;
	c <= a and b; 


end aula;














