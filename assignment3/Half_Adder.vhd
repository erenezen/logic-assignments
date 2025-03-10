-- Half Adder VHDL Code

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HalfAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end HalfAdder;

architecture Behavioral of HalfAdder is
begin
    -- Sum is the XOR of a and b
    sum <= a XOR b;
    
    -- Carry is the AND of a and b
    carry <= a AND b;
end Behavioral;
