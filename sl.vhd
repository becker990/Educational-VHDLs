library ieee;
use ieee.std_logic_1164.all;
ENTITY sl IS
PORT ( 

	--input pins
	b :in std_logic_vector(3 downto 0);-- vetor de entrada do sr
	c :in std_logic;-- controle
	ser :in std_logic;-- entrada serial do descolador hehe no bit perdido do deslocador
		
	--output logic gate
	s :out std_logic_vector(3 downto 0)
	
	
);
END sl;
architecture aula of sl is
component mux2_1

	port(

	--input pins
	
	c1 :in std_logic;
	c0 :in std_logic;
	c :in std_logic;	
		
	--output logic gate
	s :out std_logic



	);

end component;

begin

	bit3: mux2_1
		port map(	c1 => b(2),
					c0 => b(3),
					s  => s(3),
					c  => c
				);
	
	bit2: mux2_1
		port map(	c1 => b(1),
					c0 => b(2),
					s  => s(2),
					c  => c
				);
		
	bit1: mux2_1
		port map(	c1 => b(0),
					c0 => b(1),
					s  => s(1),
					c  => c
				);
	
	bit0: mux2_1
		port map(	c1 => ser,
					c0 => b(0),
					s  => s(0),
					c  => c
				);


end aula;














