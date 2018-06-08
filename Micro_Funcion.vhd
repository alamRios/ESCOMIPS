library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity Micro_Funcion is
    Port ( funcion : in  STD_LOGIC_VECTOR (3 downto 0);
           micro_funcion : out  STD_LOGIC_VECTOR (19 downto 0));
end Micro_Funcion;

architecture Behavioral of Micro_Funcion is

type TABLA is array (0 to 15) of std_logic_vector(19 downto 0);
constant memoria: TABLA := (
		"00000100110000011001",--ADD										
		"00000100110000111001",--SUB
		"00000100110000000001",--AND
		"00000100110000001001",--OR
		"00000100110000010001",--XOR
		"00000100110001101001",--NAND
		"00000100110001100001",--NOR
		"00000100110001010001",--XNOR
		"00000100110001101001",--NOT
		"00000011000000000000",--SLL
		"00000010000000000000",--SRL										
		others =>(others => ('0')) );
begin
	micro_funcion <= memoria(conv_integer(funcion));
end Behavioral;
