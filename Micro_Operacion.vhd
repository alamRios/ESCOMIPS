library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity Micro_Operacion is
    Port ( operacion : in  STD_LOGIC_VECTOR (4 downto 0);
           micro_operacion : out  STD_LOGIC_VECTOR (19 downto 0));
end Micro_Operacion;

architecture Behavioral of Micro_Operacion is

type TABLA is array (0 to 31) of std_logic_vector(19 downto 0);
constant memoria: TABLA := ( 
			 "00001000010000111000",--Condicion
			 "00000000100000000000",--LI
			 "00000100100000000100",--LWI									 
			 "00001000000000000110",--SWI
			 "00001000001010011010",--SW
			 "00000100110010011001",--ADDI
			 "00000100110010111001",--SUBI
			 "00000100111010000001",--ANDI
			 "00000100111010001001",--ORI
			 "00000100111010010001",--XORI
			 "00000100111011101001",--NANDI
			 "00000100111011100001",--NORI
			 "00000100111011010001",--XNORI
			 "00110000010110011001",--BEQI									
			 "00110000010110011001",-- BNEI
			 "00110000010110011001",-- BLTI
			 "00110000010110011001",-- BLETI
			 "00110000010110011001",-- BGTI
			 "00110000010110011001",-- BGETI
			 "00100000000000000000",-- B
			 "10100000000000000000",-- CALL
			 "01000000000000000000",-- RET
			 "00000000000000000000",-- NOP
			 "00000100101010011000",--LW
			 others =>(others => ('0')) );
begin
	micro_operacion <= memoria(conv_integer(operacion));
end Behavioral;
