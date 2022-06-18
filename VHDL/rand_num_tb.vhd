LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.numeric_std.all;


ENTITY tb_rand_num IS
	GENERIC(
			WIDTH	   	: NATURAL := 8
	);
	
END tb_rand_num ;

ARCHITECTURE arch OF tb_rand_num IS
	 
	
	COMPONENT rand_num IS
		GENERIC(
				SIZE	   		: NATURAL  := 8
		);
		
		port(
				clk, res     : IN  STD_LOGIC; 
				q 	   : OUT STD_LOGIC_VECTOR(SIZE-1 downto 0)  
			 );			 
	END  COMPONENT;
	
	
	COMPONENT stimuli_rand_num IS
		
		port(
				clk, rst     : OUT  STD_LOGIC 
			 );			 
	END  COMPONENT;
	

	SIGNAL clk_s, reset_s 		   	: STD_LOGIC;
	SIGNAL rand_number_s  	   		: STD_LOGIC_VECTOR(WIDTH-1 downto 0) ; 
	
	
	BEGIN

		
		dut : rand_num 
						GENERIC MAP(  WIDTH )
						PORT MAP(
								clk      => clk_s,
								res    => reset_s,
								q => rand_number_s 	  
							);

		stimuli : stimuli_rand_num 

						PORT MAP(
								clk      => clk_s,
								rst    => reset_s  
							);										
		
end arch;