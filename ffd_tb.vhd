library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ffd_tb is

end ffd_tb;

architecture test of ffd_tb is
    
    component ffd
        port
        (
        clock,d,reset: in STD_LOGIC;
        q:             out STD_LOGIC
        );
    end component;

    component ffd_stimuli
        port
        (
            clk,d,rst: out STD_LOGIC
        );
    end component;

    signal clk_s,d_s,rst_s : STD_LOGIC;

    begin

    dut: ffd
         port map(
            clock => clk_s,
            d => d_S,
            reset => rst_s
         );
    
    teste: ffd_stimuli
    port map(
        clk => clk_s,
        d => d_s,
        rst => rst_s
    );

end test;


