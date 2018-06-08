library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2 is
    Port ( OP_CODE : in  STD_LOGIC_VECTOR (4 downto 0);
				SDOPC : in STD_LOGIC;
				s: out STD_LOGIC_VECTOR(4 DOWNTO 0));
end Mux2;

architecture Behavioral of Mux2 is

begin
	process(OP_CODE, SDOPC)
	begin
		if(SDOPC = '1') then
			s <= OP_CODE;
		else 
			s <= "00000";
		end if;
	end process;

end Behavioral;