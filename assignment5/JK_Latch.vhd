library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_Latch is
    Port (
        J : in STD_LOGIC;  -- J input
        K : in STD_LOGIC;  -- K input
        Clk : in STD_LOGIC;  -- Clock input
        Q : out STD_LOGIC;  -- Output Q
        Qn : out STD_LOGIC  -- Complementary output Qn
    );
end JK_Latch;

architecture Behavioral of JK_Latch is
    signal Q_temp : STD_LOGIC := '0';  -- Internal signal for Q
begin
    process (Clk, J, K)
    begin
        if Clk = '1' then  -- Level-sensitive
            if J = '0' and K = '0' then
                Q_temp <= Q_temp;  -- No change
            elsif J = '0' and K = '1' then
                Q_temp <= '0';  -- Reset
            elsif J = '1' and K = '0' then
                Q_temp <= '1';  -- Set
            elsif J = '1' and K = '1' then
                Q_temp <= not Q_temp;  -- Toggle
            end if;
        end if;
    end process;


    Q <= Q_temp;          -- Assign Q_temp to Q
    Qn <= not Q_temp;     -- Assign complement of Q_temp to Qn
end Behavioral;