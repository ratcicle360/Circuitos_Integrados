library ieee;
use ieee.std_logic_1164.all;

entity rand_num is
    generic(
    SIZE: NATURAL := 8
    );
    port(
        clk, res: in STD_LOGIC;
        q       : out STD_LOGIC_VECTOR(SIZE -1 downto 0)
    );
end rand_num;

architecture arq of rand_num is
    component galois is
        generic(
            SIZE : NATURAL := 12;
            a: NATURAL:=3; -- Coeficientes do polinomio
            b: NATURAL:=7
            );
        port(
             res, clk : in  STD_LOGIC;
             q        : out STD_LOGIC_vector(SIZE-1 downto 0)
            );
    end component;

    signal q_s : STD_LOGIC_VECTOR(11 downto 0);
    signal b1b0: STD_LOGIC_VECTOR(1 downto 0);

    begin

        gal: galois port map(
            res => res,
            clk => clk,
            q => q_s
        );

    b1b0 <= q_s(1 downto 0);
    q <= "000000"&b1b0;
end arq;
