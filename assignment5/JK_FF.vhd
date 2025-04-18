library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FF is
    Port (
        J : in STD_LOGIC;  
        K : in STD_LOGIC;  
        Clk : in STD_LOGIC;  
        Reset : in STD_LOGIC;  
        Q : out STD_LOGIC;  
        Qn : out STD_LOGIC  
    );
end JK_FF;

architecture Behavioral of JK_FF is
    signal Q_temp : STD_LOGIC := '0'; 
begin
    process (Clk, Reset)
    begin
        if Reset = '1' then
            Q_temp <= '0';  -- asenkron reset
        elsif rising_edge(Clk) then
            if J = '0' and K = '0' then
                Q_temp <= Q_temp;  
            elsif J = '0' and K = '1' then
                Q_temp <= '0';  
            elsif J = '1' and K = '0' then
                Q_temp <= '1';  
            elsif J = '1' and K = '1' then
                Q_temp <= not Q_temp;  
            end if;
        end if;
    end process;
    Q <= Q_temp;          
    Qn <= not Q_temp;     
end Behavioral;