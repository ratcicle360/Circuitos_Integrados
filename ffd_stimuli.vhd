library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ffd_stimuli is
    
    generic(
    CLK_PERIOD		: TIME	:= 10 ns
    );

    port(
        clk :out STD_LOGIC;
        rst :out STD_LOGIC;
        d   :out STD_LOGIC
    );
end ffd_stimuli;
architecture arch of ffd_stimuli is

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
    procedure toggle_d( d_s :in STD_LOGIC) is
        begin
     -- atribui o d_s do procedure para a saida
            wait until rising_edge(clk_s);
            d <= d_s;
    end procedure;

    procedure reset_atv is
        begin
            wait until falling_edge(clk_s);
            rst <= '1';
            wait for CLK_PERIOD;
            rst <= '0';
    end procedure;

    begin --inicia o process

    toggle_d('1');
    wait for 5*CLK_PERIOD;
    toggle_d('0');
    wait for 5*CLK_PERIOD;
    toggle_d('1');
    wait for 5*CLK_PERIOD;
    reset_atv;

    end process;

end arch ; -- arch