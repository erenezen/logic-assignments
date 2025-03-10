library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity COMP_1_bit is
    Port (
        a : in STD_LOGIC;
        b : in STD_LOGIC;
        x : out STD_LOGIC;  -- a > b
        y : out STD_LOGIC;  -- a = b
        z : out STD_LOGIC   -- a < b
    );
end COMP_1_bit;

architecture Behavioral of COMP_1_bit is
begin
    process (a, b)
    begin
        if (a = '1' and b = '0') then
            x <= '1'; y <= '0'; z <= '0';  -- a > b
        elsif (a = b) then
            x <= '0'; y <= '1'; z <= '0';  -- a = b
        else
            x <= '0'; y <= '0'; z <= '1';  -- a < b
        end if;
    end process;
end Behavioral;
