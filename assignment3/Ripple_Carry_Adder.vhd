library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ripple_carry_adder is
    Generic (N : integer := 4);
    Port ( A    : in  STD_LOGIC_VECTOR(N-1 downto 0);
           B    : in  STD_LOGIC_VECTOR(N-1 downto 0);
           Cin  : in  STD_LOGIC;
           Sum  : out STD_LOGIC_VECTOR(N-1 downto 0);
           Cout : out STD_LOGIC);
end ripple_carry_adder;

architecture Behavioral of ripple_carry_adder is
    signal carry : STD_LOGIC_VECTOR(N downto 0);
begin
    carry(0) <= Cin;
    gen_adder: for i in 0 to N-1 generate
        U1: entity work.full_adder port map (
            A    => A(i),
            B    => B(i),
            Cin  => carry(i),
            Sum  => Sum(i),
            Cout => carry(i+1)
        );
    end generate;
    Cout <= carry(N);
end Behavioral;
