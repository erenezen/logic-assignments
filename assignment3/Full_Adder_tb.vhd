library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture test of full_adder_tb is
    signal A, B, Cin : STD_LOGIC := '0';
    signal Sum, Cout : STD_LOGIC;
    component full_adder
        Port ( A    : in  STD_LOGIC;
               B    : in  STD_LOGIC;
               Cin  : in  STD_LOGIC;
               Sum  : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;
    
begin
    UUT: full_adder port map (A => A, B => B, Cin => Cin, Sum => Sum, Cout => Cout);
    stim_proc: process
    begin
        A <= '0'; B <= '0'; Cin <= '0';
        wait for 10 ns;
        A <= '0'; B <= '0'; Cin <= '1';
        wait for 10 ns;
        A <= '0'; B <= '1'; Cin <= '0';
        wait for 10 ns;
        A <= '0'; B <= '1'; Cin <= '1';
        wait for 10 ns;
        A <= '1'; B <= '0'; Cin <= '0';
        wait for 10 ns;
        A <= '1'; B <= '0'; Cin <= '1';
        wait for 10 ns;
        A <= '1'; B <= '1'; Cin <= '0';
        wait for 10 ns;
        A <= '1'; B <= '1'; Cin <= '1';
        wait for 10 ns;
        wait;
    end process;
end test;
