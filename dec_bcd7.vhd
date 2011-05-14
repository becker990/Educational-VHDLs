library ieee;
use ieee.std_logic_1164.all;
ENTITY dec_bcd7 IS
PORT ( 

	--input pins
	n :in std_logic_vector(3 downto 0);
			
	--output logic gate
	s :out std_logic_vector(6 downto 0);
	
	
	
);
END dec_bcd7;
architecture aula of dec_bcd7 is
begin
	
	with n select

	s <=
	
		"1111110" when "0000",-- 126 -> 0
		"0110000" when "0001",-- 048 -> 1
		"1101101" when "0010",-- 109 -> 2
		"1111001" when "0011",-- 121 -> 3
		"0110011" when "0100",-- 051 -> 4
		"1011011" when "0101",-- 091 -> 5 
		"1011111" when "0110",-- 095 -> 6
		"1110000" when "0111",-- 112 -> 7
		"1111111" when "1000",-- 127 -> 8
		"1111011" when "1001",-- 123 -> 9
		"0000001" when others;-- 001 -> x






end aula;