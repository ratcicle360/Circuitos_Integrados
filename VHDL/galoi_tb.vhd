library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity galoi_tb is

    constant SIZE : NATURAL := 12;

end galoi_tb;

architecture sim of galoi_tb is
    signal clk_s, reset_s: STD_LOGIC;
    signal q_s :  STD_LOGIC_vector(SIZE-1 downto 0);
    component galoi is

        generic(
        SIZE : NATURAL := 13;
        a : NATURAL := 3;
        b : NATURAL := 7
        );

        port(
        res, clk : in  STD_LOGIC;
        q        : out STD_LOGIC_vector(SIZE-1 downto 0)
        );
    end component;

    component galoi_stimuli is
        port(
            clk :out STD_LOGIC;
            rst :out STD_LOGIC 
        );
    end component;

    begin
        gal: galoi
        generic map(SIZE=>12, a=>3,b=>7)
        port map(
            res => reset_s,
            clk => clk_s,
            q => q_s
        );

        stimuli: galoi_stimuli port map(
            clk => clk_s,
            rst => reset_S
        );
end sim;
