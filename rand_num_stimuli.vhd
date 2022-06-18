library ieee;
use ieee.std_logic_1164.all;

entity stimuli_rand_num is
    generic(
    CLK_PERIOD		: TIME	:= 10 ns
    );

    port(
        clk :out STD_LOGIC;
        rst :out STD_LOGIC
    );
end entity;

architecture arch of stimuli_rand_num is

    signal clk_s : STD_LOGIC;

    component clock_generator
        generic(
            CLK_PERIOD : TIME :=10 ns
        );

        port(
            clk: out STD_LOGIC
        );
    end component;

begin --inicio a arquitetura

    --Instanciando o clock generator
    clock: clock_generator
        port map(
            clk =>clk_s
        );
   
    clk <=clk_s;
    
    sim: process -- Esse process representa a simulação
    -- Estou definindo alguns procedimentos antes do processo
    --começar

    procedure reset_atv is
        begin
            wait until falling_edge(clk_s);
            rst <= '1';
            wait for CLK_PERIOD;
            rst <= '0';
    end procedure;

    begin --inicia o process

    reset_atv;
    wait for 50*CLK_PERIOD;
    

    end process;

end arch ; -- arch

