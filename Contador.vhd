library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Contador is
    Port ( EB,LB,clk,clr : in  STD_LOGIC;
           B : out  STD_LOGIC_VECTOR (3 downto 0));
end Contador;

architecture Behavioral of Contador is
	signal Bp : std_logic_vector(3 downto 0); 
begin
	process(clr,clk,EB,LB) begin
		if(clr = '1') then 
			Bp <= (others => '0');
		elsif(clk'event and clk = '1') then
			if(LB = '1') then 
				Bp <= "0000"; 
			elsif(EB = '1') then
				Bp <= Bp + 1;
			end if; 
		end if; 
	end process; 
	B <= Bp; 
end Behavioral;

