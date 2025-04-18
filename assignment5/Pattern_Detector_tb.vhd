library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Pattern_Detector_D_FF_tb is
end Pattern_Detector_D_FF_tb;

architecture sim of Pattern_Detector_D_FF_tb is

    component Pattern_Detector_D_FF
        Port (
            clk        : in  STD_LOGIC;
            rst        : in  STD_LOGIC;
            input_2bit : in  STD_LOGIC_VECTOR(1 downto 0);
            match      : out STD_LOGIC
        );
    end component;

    signal clk_tb        : STD_LOGIC := '0';
    signal rst_tb        : STD_LOGIC := '0';
    signal input_2bit_tb : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal match_tb      : STD_LOGIC;

begin
    uut: Pattern_Detector_D_FF
        port map (
            clk        => clk_tb,
            rst        => rst_tb,
            input_2bit => input_2bit_tb,
            match      => match_tb
        );
    clk_process : process
    begin
        while now < 300 ns loop
            clk_tb <= '0'; wait for 10 ns;
            clk_tb <= '1'; wait for 10 ns;
        end loop;
        wait;
    end process;

    stim_proc : process
    begin
        rst_tb <= '1'; wait for 20 ns;
        rst_tb <= '0'; wait for 20 ns;

        input_2bit_tb <= "10"; wait for 20 ns;
        input_2bit_tb <= "10"; wait for 20 ns;
        input_2bit_tb <= "11"; wait for 20 ns;

        input_2bit_tb <= "11"; wait for 20 ns;
        input_2bit_tb <= "00"; wait for 20 ns;
        input_2bit_tb <= "01"; wait for 20 ns;

        -- Overlap test
        input_2bit_tb <= "10"; wait for 20 ns;
        input_2bit_tb <= "10"; wait for 20 ns;
        input_2bit_tb <= "11"; wait for 20 ns;
        input_2bit_tb <= "00"; wait for 20 ns;
        input_2bit_tb <= "01"; wait for 20 ns;

        wait;
    end process;

end sim;
