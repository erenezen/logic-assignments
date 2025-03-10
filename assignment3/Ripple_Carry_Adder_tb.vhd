library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ripple_carry_adder_tb is
end ripple_carry_adder_tb;

architecture test of ripple_carry_adder_tb is
    constant N : integer := 4;
    signal A, B : STD_LOGIC_VECTOR(N-1 downto 0);
    signal Cin, Cout : STD_LOGIC;
    signal Sum : STD_LOGIC_VECTOR(N-1 downto 0);
begin
    uut: entity work.ripple_carry_adder
        generic map (N => N)
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            Sum  => Sum,
            Cout => Cout
        );
    process
    begin
        A <= "0000"; B <= "0000"; Cin <= '0'; wait for 10 ns;
        A <= "0001"; B <= "0001"; Cin <= '0'; wait for 10 ns;
        A <= "0010"; B <= "0001"; Cin <= '1'; wait for 10 ns;
        A <= "0101"; B <= "0011"; Cin <= '0'; wait for 10 ns;
        A <= "1111"; B <= "0001"; Cin <= '1'; wait for 10 ns;
        A <= "1010"; B <= "0101"; Cin <= '0'; wait for 10 ns;
        A <= "1111"; B <= "1111"; Cin <= '1'; wait for 10 ns;
        wait;
    end process;
end test;
