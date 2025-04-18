library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FF_tb is
end JK_FF_tb;

architecture Behavioral of JK_FF_tb is
    signal J, K, Clk, Reset : STD_LOGIC := '0';
    signal Q, Qn : STD_LOGIC;

begin
    uut: entity work.JK_FF
        port map (
            J => J,
            K => K,
            Clk => Clk,
            Reset => Reset,
            Q => Q,
            Qn => Qn
        );
    process
    begin
        Clk <= '0';
        wait for 10 ns;
        Clk <= '1';
        wait for 10 ns;
    end process;
    process
    begin
        Reset <= '1';
        wait for 20 ns;
        Reset <= '0';
        J <= '0'; K <= '0';
        wait for 20 ns;
        J <= '0'; K <= '1';
        wait for 20 ns;
        J <= '1'; K <= '0';
        wait for 20 ns;
        J <= '1'; K <= '1';
        wait for 20 ns;
        J <= '0'; K <= '1';
        wait for 20 ns;
        J <= '1'; K <= '1';
        wait for 20 ns;
        wait;
    end process;
end Behavioral;