library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CON_COMP_1_bit is
    Port (
        a, b : in STD_LOGIC;
        x, y, z : out STD_LOGIC
    );
end CON_COMP_1_bit;

architecture Behavioral of CON_COMP_1_bit is
begin
    x <= '1' when (a = '1' and b = '0') else '0';
    y <= '1' when (a = b) else '0';  -- Buradaki koşul düzeltildi
    z <= '1' when (a = '0' and b = '1') else '0';
end Behavioral;
