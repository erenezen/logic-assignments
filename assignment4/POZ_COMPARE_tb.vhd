library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use std.textio.all;

entity POZ_COMPARE_tb is
end POZ_COMPARE_tb;
architecture test of POZ_COMPARE_tb is
    component POZ_COMPARE
        Port (
            A, B : in STD_LOGIC_VECTOR (3 downto 0);
            X, Y, Z : out STD_LOGIC
        );
    end component;
    signal A, B : STD_LOGIC_VECTOR (3 downto 0);
    signal X, Y, Z : STD_LOGIC;
begin
    UUT: POZ_COMPARE port map(A, B, X, Y, Z);
    process
    begin
        A <= "0101"; B <= "0011"; 
        wait for 10 ns;
        A <= "0011"; B <= "0101"; 
        wait for 10 ns;
        A <= "0110"; B <= "0110"; 
        wait for 10 ns;
        wait;
    end process;
end test;
