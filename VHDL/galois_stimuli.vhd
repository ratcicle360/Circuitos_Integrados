library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity galoi_stimuli is
    
    port(
        clk :out STD_LOGIC;
        rst :out STD_LOGIC 
    );
end galoi_stimuli;


architecture arch of galoi_stimuli is

    signal clk_s : STD_LOGIC;

    component clock_generator
        generic(
            CLK_PERIOD : TIME :=10 ns
        );

        port(
            clk: out STD_LOGIC
        );
    end component;


    begin -- Iniciando a arquitetura

    --Instanciando o clock generator
    clock: clock_generator
        port map(
            clk =>clk_s
        );
   
    clk <=clk_s;
    sim: process

        procedure reset_atv is
            begin
                wait until falling_edge(clk_s);
                rst <= '1';
                wait for 50 ns;
                rst <= '0';
        end procedure;

        begin
        
            reset_atv;
            wait for 100 ms;
    end process;
end arch;
