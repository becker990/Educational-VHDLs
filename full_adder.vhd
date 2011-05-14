library ieee;
use ieee.std_logic_1164.all;
ENTITY full_adder IS
PORT ( 

	--input pins
	a :in std_logic;
	b :in std_logic;
	ci :in std_logic;
		
	--output logic gate
	s :out std_logic;
	co :out std_logic
	
	
);
END full_adder;
architecture aula of full_adder is

	-- half adders out
	signal ha1: std_logic;
	signal ha2: std_logic;
	signal ha3: std_logic;
	
component half_adder

	port(

		--input pins
		a :in std_logic;
		b :in std_logic;
	
		--carry out
		c :out std_logic; 
		
		--output logic gate
		s :out std_logic
		
		);
		
end component;
begin
	
	half1: half_adder
			port map(	a => a,
						b => b,
						c => ha1,
						s => ha3
					);
	
	half2: half_adder
			port map(	a => ci,
						b => ha3,
						c => ha2,
						s => s
					);
			
		

	co <= ha1 or ha2;

end aula;