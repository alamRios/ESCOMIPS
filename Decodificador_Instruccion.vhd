library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decodificador_Instruccion is
    Port ( op_code : in  STD_LOGIC_VECTOR (4 downto 0);
           tipoR, BEQ, BNE, BLT, BLE, BGT, BGET : out  STD_LOGIC);
end Decodificador_Instruccion;

architecture Behavioral of Decodificador_Instruccion is

begin
	tipoR	<= '1' when (op_code = "00000") else '0';
	BEQ 	<= '1' when (op_code = "01101") else '0';
	BNE 	<= '1' when (op_code = "01110") else '0';
	BLT 	<= '1' when (op_code = "01111") else '0';
	BLE 	<= '1' when (op_code = "10000") else '0';
	BGT 	<= '1' when (op_code = "10001") else '0';
	BGET 	<= '1' when (op_code = "10010") else '0';
end Behavioral;
