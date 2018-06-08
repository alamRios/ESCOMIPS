library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Condicion is
    Port ( banderas : in STD_LOGIC_VECTOR(3 downto 0); -- 0V(3) N(2) Z(1) C(0)
			 clk, clr, LF : in  STD_LOGIC;
           EQ, NEQ, LT, LE, GT, GET : out  STD_LOGIC);
end Condicion;

architecture Behavioral of Condicion is

signal reg_banderas : std_logic_vector (3 downto 0);

begin
	CargarBanderas : process(clk, clr)
	begin
		if(clr = '1')then
			reg_banderas <= "0000";
		elsif(falling_edge(clk))then
			if(LF = '1')then
				reg_banderas <= banderas;
			end if;
		end if;
	end process;
	
	EQ <= reg_banderas(1);
	NEQ<= not reg_banderas(1);
	LT <= (reg_banderas(2) xor reg_banderas(3)) and (not reg_banderas(1));
	LE <= (reg_banderas(2) xor reg_banderas(3)) or reg_banderas(1);
	GT <= (not(reg_banderas(2) xor reg_banderas(3))) and (not reg_banderas(1));
	GET<= (not(reg_banderas(2) xor reg_banderas(3))) or (reg_banderas(1));
end Behavioral;
