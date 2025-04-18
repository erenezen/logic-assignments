library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Pattern_Detector_D_FF is
    Port (
        clk        : in  STD_LOGIC;
        rst        : in  STD_LOGIC;
        input_2bit : in  STD_LOGIC_VECTOR(1 downto 0);
        match      : out STD_LOGIC
    );
end Pattern_Detector_D_FF;

architecture Behavioral of Pattern_Detector_D_FF is
    type state_type is (S0, S1, S2, S3, S4, S5, S6);
    signal current_state, next_state : state_type;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            current_state <= S0;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    -- FSM transition logic
    process(current_state, input_2bit)
    begin
        next_state <= S0;
        match <= '0';

        case current_state is
            when S0 =>
                if input_2bit = "10" then
                    next_state <= S1;
                elsif input_2bit = "11" then
                    next_state <= S4;
                end if;

            when S1 =>
                if input_2bit = "10" then
                    next_state <= S2;
                else
                    next_state <= S0;
                end if;

            when S2 =>
                if input_2bit = "11" then
                    next_state <= S3;
                else
                    next_state <= S0;
                end if;

            when S3 =>  -- 10-10-11 matched
                match <= '1';
                if input_2bit = "11" then
                    next_state <= S4;
                elsif input_2bit = "10" then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;

            when S4 =>
                if input_2bit = "00" then
                    next_state <= S5;
                else
                    next_state <= S0;
                end if;

            when S5 =>
                if input_2bit = "01" then
                    next_state <= S6;
                else
                    next_state <= S0;
                end if;

            when S6 =>  -- 11-00-01 matched
                match <= '1';
                if input_2bit = "10" then
                    next_state <= S1;
                elsif input_2bit = "11" then
                    next_state <= S4;
                else
                    next_state <= S0;
                end if;

            when others =>
                next_state <= S0;
        end case;
    end process;

end Behavioral;
