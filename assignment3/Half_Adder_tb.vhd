library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_HalfAdder is
end tb_HalfAdder;
architecture behavior of tb_HalfAdder is
    signal a : STD_LOGIC := '0';
    signal b : STD_LOGIC := '0';
    signal sum : STD_LOGIC;
    signal carry : STD_LOGIC;
    component HalfAdder
        Port ( a : in  STD_LOGIC;
               b : in  STD_LOGIC;
               sum : out  STD_LOGIC;
               carry : out  STD_LOGIC);
    end component;

begin
    uut: HalfAdder port map (
        a => a,
        b => b,
        sum => sum,
        carry => carry
    );
    stim_proc: process
    begin
        a <= '0'; b <= '0';
        wait for 10 ns; 
        a <= '0'; b <= '1';
        wait for 10 ns;
        a <= '1'; b <= '0';
        wait for 10 ns;
        a <= '1'; b <= '1';
        wait for 10 ns;
        wait;
    end process;
end behavior;
