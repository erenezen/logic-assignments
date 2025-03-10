-- Testbench for Half Adder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_HalfAdder is
    -- No ports in testbench entity
end tb_HalfAdder;

architecture behavior of tb_HalfAdder is

    -- Declare signals to connect to the Half Adder entity
    signal a : STD_LOGIC := '0';
    signal b : STD_LOGIC := '0';
    signal sum : STD_LOGIC;
    signal carry : STD_LOGIC;

    -- Component Declaration for the Unit Under Test (UUT)
    component HalfAdder
        Port ( a : in  STD_LOGIC;
               b : in  STD_LOGIC;
               sum : out  STD_LOGIC;
               carry : out  STD_LOGIC);
    end component;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: HalfAdder port map (
        a => a,
        b => b,
        sum => sum,
        carry => carry
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test Case 1: a = 0, b = 0
        a <= '0'; b <= '0';
        wait for 10 ns;  -- Wait for 10 ns

        -- Test Case 2: a = 0, b = 1
        a <= '0'; b <= '1';
        wait for 10 ns;

        -- Test Case 3: a = 1, b = 0
        a <= '1'; b <= '0';
        wait for 10 ns;

        -- Test Case 4: a = 1, b = 1
        a <= '1'; b <= '1';
        wait for 10 ns;

        -- End the simulation
        wait;
    end process;

end behavior;
