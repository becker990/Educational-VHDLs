library ieee;
use ieee.std_logic_1164.all;
ENTITY ripple IS
PORT ( 

	--input pins
	ripple_ent_a :in std_logic_vector(3 downto 0);
	ripple_ent_b :in std_logic_vector(3 downto 0);
	
	--control for add or sub 0 for a+b
	ripple_ctrl :in std_logic;
	
		
	--output logic gate
	ripple_ovflow :out std_logic;
	ripple_out    :out std_logic_vector(3 downto 0)
	
	
);
END ripple;
architecture aula of ripple is

	-- dec sings here
	signal carry_0: std_logic;--signals for each full adder carry
	signal carry_1: std_logic;
	signal carry_2: std_logic;
	signal carry_3: std_logic;
	
component full_adder
	
	port(
		--input pins
		a :in std_logic;
		b :in std_logic;
		ci :in std_logic;
		
		--output logic gate
		s :out std_logic;
		co :out std_logic
	);
end component;

begin

	full_b0: full_adder
			port map(	a  => ripple_ent_a(0),
						b  => (ripple_ent_b(0) xor ripple_ctrl),
						ci => ripple_ctrl,
						s  => ripple_out(0),
						co => carry_0
					);
					
	full_b1: full_adder
			port map(	a  => ripple_ent_a(1),
						b  => (ripple_ent_b(1) xor ripple_ctrl),
						ci => carry_0,
						s  => ripple_out(1),
						co => carry_1
					);
					
	full_b2: full_adder
			port map(	a  => ripple_ent_a(2),
						b  => (ripple_ent_b(2) xor ripple_ctrl),
						ci => carry_1,
						s  => ripple_out(2),
						co => carry_2
					);
					
	full_b3: full_adder
			port map(	a  => ripple_ent_a(3),
						b  => (ripple_ent_b(3) xor ripple_ctrl),
						ci => carry_2,
						s  => ripple_out(3),
						co => carry_3
					);
	
	ripple_ovflow <= (carry_3 xor carry_2);
	
			  


end aula;