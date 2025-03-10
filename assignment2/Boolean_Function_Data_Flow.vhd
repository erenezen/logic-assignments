library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ENCODER_SOURCE is
    Port ( A,B,C,D : in  STD_LOGIC;
             Y0,Y1 : out  STD_LOGIC);
end ENCODER_SOURCE;

architecture dataflow of ENCODER_SOURCE is

begin

Y0 <= ((not C)and(not D))and(A xor B);
Y1 <= ((not B)and(not D))and(A xor C);

end dataflow;