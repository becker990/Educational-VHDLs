library ieee;
use ieee.std_logic_1164.all;
ENTITY ctrl_ula IS
PORT ( 


	--this ctrl_ula is actually a 8 - 1, 4bit mux with a 3bit control 
	--input pins
	--each signal will be selected for each value for ctrl_ctrl
	ent_sr       :in std_logic_vector(3 downto 0);--7
	ent_sl       :in std_logic_vector(3 downto 0);--6
	ent_add_subt :in std_logic_vector(3 downto 0);--5
	ent_keep_a   :in std_logic_vector(3 downto 0);--4
	ent_not_a    :in std_logic_vector(3 downto 0);--3
	ent_a_or_b   :in std_logic_vector(3 downto 0);--2
	ent_a_and_b  :in std_logic_vector(3 downto 0);--1
	ent_add      :in std_logic_vector(3 downto 0);--0

	--control signal
	--vector for selecting the ula activated unit must have the input value 
	--for the slecting input pins to the output

	ctrl_ctrl    :in std_logic_vector(2 downto 0); 
							
	
	--output logic gate
	s_ctrl :out std_logic_vector(3 downto 0)-- vetor de saida da ula
	
	
);
END ctrl_ula ;
architecture aula of ctrl_ula is

	-- dec sings here

begin

	with ctrl_ctrl select
	
		s_ctrl <= 
			ent_sr 			when "111",--7
			ent_sl			when "110",--6
			ent_add_subt 	when "101",--5
			ent_keep_a   	when "100",--4
			ent_not_a    	when "011",--3
			ent_a_or_b   	when "010",--2
			ent_a_and_b  	when "001",--1
			ent_add      	when "000",--0
			
			"XXXX" when others;
	

end aula;
