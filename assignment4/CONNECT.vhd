library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CONNECT is
    Port (
        x3, x2, x1, x0 : in STD_LOGIC;  -- 4 adet giriş (x çıkışları)
        y3, y2, y1, y0 : in STD_LOGIC;  -- 4 adet giriş (y çıkışları)
        X, Y, Z : out STD_LOGIC         -- 3 adet çıkış (sonuçlar)
    );
end CONNECT;

architecture Behavioral of CONNECT is
begin
    X <= x3 or (y3 and x2) or (y3 and y2 and x1) or (y3 and y2 and y1 and x0);
    Y <= y3 and y2 and y1 and y0;
    Z <= y3 or (y2 and y1) or (y3 and y0);
end Behavioral;
