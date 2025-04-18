library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_Latch_tb is
end JK_Latch_tb;

architecture Behavioral of JK_Latch_tb is
    signal J, K, Clk : STD_LOGIC := '0';
    signal Q, Qn : STD_LOGIC;

begin
    -- Instantiate the JK Latch
    uut: entity work.JK_Latch
        port map (
            J => J,
            K => K,
            Clk => Clk,
            Q => Q,
            Qn => Qn
        );

    -- Clock process
    process
    begin
        Clk <= '0';
        wait for 10 ns;
        Clk <= '1';
        wait for 10 ns;
    end process;

    -- Stimulus process
    process
    begin
        -- Test case 1: No change (J=0, K=0)
        J <= '0'; K <= '0';
        wait for 20 ns;

        -- Test case 2: Reset (J=0, K=1)
        J <= '0'; K <= '1';
        wait for 20 ns;

        -- Test case 3: Set (J=1, K=0)
        J <= '1'; K <= '0';
        wait for 20 ns;

        -- Test case 4: Toggle (J=1, K=1)
        J <= '1'; K <= '1';
        wait for 20 ns;

        -- Test case 5: Reset again (J=0, K=1)
        J <= '0'; K <= '1';
        wait for 20 ns;

        -- Test case 6: Toggle again (J=1, K=1)
        J <= '1'; K <= '1';
        wait for 20 ns;

        -- End simulation
        wait;
    end process;
end Behavioral;