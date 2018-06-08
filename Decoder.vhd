library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder is
    Port ( ec : in std_logic;
				B : in  STD_LOGIC_VECTOR (3 downto 0);
           Deco : out  STD_LOGIC_VECTOR (6 downto 0));
end Decoder;

architecture Behavioral of Decoder is
begin
	process(B, ec) begin 
	if (ec = '1') then
		case(B) is
			when "0000" => Deco <= "0000001";
			when "0001" => Deco <= "1001111";
			when "0010" => Deco <= "0010010";
			when "0011" => Deco <= "0000110";
			when "0100" => Deco <= "1001100";
			when others => Deco <= "1111110";
		end case; 
	else 
		Deco <= "1111110";
		end if;
	end process; 
end Behavioral;

