library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture test of full_adder_tb is
    -- Signal declarations
    signal A, B, Cin : STD_LOGIC := '0';
    signal Sum, Cout : STD_LOGIC;
    
    -- Component declaration for the full adder
    component full_adder
        Port ( A    : in  STD_LOGIC;
               B    : in  STD_LOGIC;
               Cin  : in  STD_LOGIC;
               Sum  : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;
    
begin
    -- Instantiate the full adder
    UUT: full_adder port map (A => A, B => B, Cin => Cin, Sum => Sum, Cout => Cout);

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: A=0, B=0, Cin=0
        A <= '0'; B <= '0'; Cin <= '0';
        wait for 10 ns;
        
        -- Test case 2: A=0, B=0, Cin=1
        A <= '0'; B <= '0'; Cin <= '1';
        wait for 10 ns;
        
        -- Test case 3: A=0, B=1, Cin=0
        A <= '0'; B <= '1'; Cin <= '0';
        wait for 10 ns;
        
        -- Test case 4: A=0, B=1, Cin=1
        A <= '0'; B <= '1'; Cin <= '1';
        wait for 10 ns;
        
        -- Test case 5: A=1, B=0, Cin=0
        A <= '1'; B <= '0'; Cin <= '0';
        wait for 10 ns;
        
        -- Test case 6: A=1, B=0, Cin=1
        A <= '1'; B <= '0'; Cin <= '1';
        wait for 10 ns;
        
        -- Test case 7: A=1, B=1, Cin=0
        A <= '1'; B <= '1'; Cin <= '0';
        wait for 10 ns;
        
        -- Test case 8: A=1, B=1, Cin=1
        A <= '1'; B <= '1'; Cin <= '1';
        wait for 10 ns;

        -- End of simulation
        wait;
    end process;
end test;
