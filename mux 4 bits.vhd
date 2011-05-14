library ieee;
use ieee.std_logic_1164.all;
ENTITY pr1 IS
PORT ( 

	--input pins
	ip00 :in std_logic;
	ip01 :in std_logic;
	ip10 :in std_logic;
	ip11 :in std_logic;
	
	--muxer controller
	s1 :in std_logic;
	s2 :in std_logic;
	
	
	--output logic gate
	y :out std_logic
	
	
);
END pr1;
architecture becker90 of pr1 is
	
	-- singnal for each minterms
	signal sig_ip00: std_logic;
	signal sig_ip01: std_logic;
	signal sig_ip10: std_logic;
	signal sig_ip11: std_logic;
	signal no_s1: std_logic;
	signal no_s2: std_logic;
	
begin 

	-- calculate each minterm
	no_s1 <= not s1;
	no_s2 <= not s2;
	sig_ip00 <= no_s1 and no_s2 and ip00;
	sig_ip01 <= no_s1 and s2 and ip01;
	sig_ip10 <= s1 and no_s2 and ip10;
	sig_ip11 <= s1 and s2 and ip11;
	
	--calculate second level of logic
	y <= sig_ip00 or sig_ip01 or sig_ip10 or sig_ip11;

	
end becker90;