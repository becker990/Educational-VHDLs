library ieee;
use ieee.std_logic_1164.all;
ENTITY ula IS
PORT ( 

	--input pins
	ula_ent_a :in std_logic_vector(3 downto 0);
	
	ula_ent_b :in std_logic_vector(3 downto 0);
	
	--control pins	
	ula_ctrl  :in std_logic_vector(2 downto 0);
		
	--output logic gate
	ula_v     :out std_logic;
	ula_z     :out std_logic;
	ula_n     :out std_logic;
	ula_saida :out std_logic_vector(3 downto 0)
	
	
);
END ula;
architecture aula of ula is
--------------------------------------
---- declaration of component ports--
--------------------------------------
component ripple

	PORT (
		--input pins
		ripple_ent_a  :in std_logic_vector(3 downto 0);
		ripple_ent_b  :in std_logic_vector(3 downto 0);
	
		--control for add or sub 0 for a+b
		ripple_ctrl   :in std_logic;
	
		
		--output logic gate
		ripple_ovflow :out std_logic;
		ripple_out    :out std_logic_vector(3 downto 0)
	
	
	);
	
end component;

--------------
component sl
	PORT ( 
		--input pins
		b             :in std_logic_vector(3 downto 0);-- vetor de entrada do sr
		c             :in std_logic;-- controle
		ser           :in std_logic;-- entrada serial do descolador hehe no bit perdido do deslocador
		
		--output logic gate
		s             :out std_logic_vector(3 downto 0)
	
	
	);
end component;
--------------
component sr
	port ( 
		--input pins
		b             :in std_logic_vector(3 downto 0);-- vetor de entrada do sr
		c             :in std_logic;-- controle
		ser           :in std_logic;-- entrada serial do descolador hehe no bit perdido do deslocador
		
		--output logic gate
		s             :out std_logic_vector(3 downto 0)
	);
end component;
-------------------------------------------
------------------------------------------
component ctrl_ula
	PORT ( 
		--this ctrl_ula is actually a 8 - 1, 4bit mux with a 3bit control 
		--input pins
		--each signal will be selected for each value for ctrl_ctrl
		ent_sr        :in std_logic_vector(3 downto 0);--7
		ent_sl        :in std_logic_vector(3 downto 0);--6
		ent_add_subt  :in std_logic_vector(3 downto 0);--5
		ent_keep_a    :in std_logic_vector(3 downto 0);--4
		ent_not_a     :in std_logic_vector(3 downto 0);--3
		ent_a_or_b    :in std_logic_vector(3 downto 0);--2
		ent_a_and_b   :in std_logic_vector(3 downto 0);--1
		ent_add       :in std_logic_vector(3 downto 0);--0

		--control signal
		--vector for selecting the ula activated unit must have the input value 
		--for the slecting input pins to the output

		ctrl_ctrl    :in std_logic_vector(2 downto 0); 
							
	
		--output logic gate
		s_ctrl :out std_logic_vector(3 downto 0)-- vetor de saida da ula
	
	
	);
end component;


--------------------------------------
----END OF declaration of component ports--
--------------------------------------
-- signals---------

	signal sig_sr        :std_logic_vector(3 downto 0);--7
	signal sig_sl        :std_logic_vector(3 downto 0);--6		
	
	
	--outs
	signal sig_ctrl_out  :std_logic_vector(3 downto 0);
	signal sig_ripple_out:std_logic_vector(3 downto 0);
	
		

begin

		mapa_sr: sr
			port map(	
						b =>    ula_ent_b,
						c =>    '1',
						ser =>  '0',
						s =>    sig_sr
					);
			
		mapa_sl: sl
			port map(	
						b =>    ula_ent_b,
						c =>    '1',
						ser =>  '0',
						s =>    sig_sl
					);
			
		mapa_ripple: ripple
			port map(
					ripple_ent_a  => ula_ent_a,
					ripple_ent_b  => ula_ent_b,		
					ripple_ctrl   => ula_ctrl(0),--pois quando temos soma ou subt esse bit diz qual fazer
					--output logic gate
					ripple_ovflow => ula_v,
					ripple_out    => sig_ripple_out
					);
		
		ctrl_da_ula: ctrl_ula
			port map(	ent_sr        =>  sig_sr,
						ent_sl        =>  sig_sl,
						ent_add_subt  =>  sig_ripple_out,
						ent_keep_a    =>  ula_ent_a,
						ent_not_a     =>  (not ula_ent_a),
						ent_a_or_b    =>  (ula_ent_a or  ula_ent_b),
						ent_a_and_b   =>  (ula_ent_a and ula_ent_b),
						ent_add       =>  sig_ripple_out,
						-- control and out						
						ctrl_ctrl     =>  ula_ctrl,
						s_ctrl        =>  sig_ctrl_out
					);
						

		with sig_ctrl_out select
				ula_z <= 
					'1' when "0000",				
					'0' when others;
				
		ula_n     <= sig_ctrl_out(3);
		ula_saida <= sig_ctrl_out;

end aula;
