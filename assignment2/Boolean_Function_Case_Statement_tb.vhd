library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Boolean_Function_Case_Statement_tb is
end Boolean_Function_Case_Statement_tb;

architecture testbench of Boolean_Function_Case_Statement_tb is
    component Boolean_Function_Case_Statement
        Port (
            a1, a0, b1, b0 : in STD_LOGIC;
            c2, c1, c0 : out STD_LOGIC
        );
    end component;
    signal a1, a0, b1, b0 : STD_LOGIC := '0';
    signal c2, c1, c0 : STD_LOGIC;

begin
    UUT: Boolean_Function_Case_Statement port map (
        a1 => a1,
        a0 => a0,
        b1 => b1,
        b0 => b0,
        c2 => c2,
        c1 => c1,
        c0 => c0
    );
    process
    begin
        for i in 0 to 15 loop
            (a1, a0, b1, b0) <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, 4));
            wait for 10 ns;
        end loop;

        wait;
    end process;

end testbench;
