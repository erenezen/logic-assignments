library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity POZ_COMPARE is
    Port (
        A, B : in STD_LOGIC_VECTOR (3 downto 0); 
        X, Y, Z : out STD_LOGIC                     
    );
end POZ_COMPARE;
architecture Structural of POZ_COMPARE is
    signal x_int, y_int, z_int : STD_LOGIC_VECTOR (3 downto 0);
    component CON_COMP_1_bit
        Port (
            a, b : in STD_LOGIC;
            x, y, z : out STD_LOGIC
        );
    end component;
    component CONNECT
        Port (
            x3, x2, x1, x0 : in STD_LOGIC;
            y3, y2, y1, y0 : in STD_LOGIC;
            X, Y, Z : out STD_LOGIC
        );
    end component;
begin
    U0: CON_COMP_1_bit port map(A(0), B(0), x_int(0), y_int(0), z_int(0));
    U1: CON_COMP_1_bit port map(A(1), B(1), x_int(1), y_int(1), z_int(1));
    U2: CON_COMP_1_bit port map(A(2), B(2), x_int(2), y_int(2), z_int(2));
    U3: CON_COMP_1_bit port map(A(3), B(3), x_int(3), y_int(3), z_int(3));
    U4: CONNECT port map(
        x_int(3), x_int(2), x_int(1), x_int(0), 
        y_int(3), y_int(2), y_int(1), y_int(0),  
        X, Y, Z                                  
    );
end Structural;
