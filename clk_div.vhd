library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk_div is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           Q35 : out  STD_LOGIC_vector(11 downto 0)
			  
			  );
end clk_div;

architecture Behavioral of clk_div is
signal Qaux : STD_LOGIC_VECTOR(35 downto 0); 
begin
	process(clk,clr)
	begin 
		if(clr = '1') then 
			Qaux <= (others =>'0'); 
		elsif(clk'event and clk = '1') then
			if (Qaux(35 downto 26) = 1000) then
				Qaux <= (others => '0');
			else
				Qaux <= Qaux + 1; 
			end if;
		end if; 
	end process;
	Q35(11 downto 2) <= Qaux(35 downto 26); 
	Q35(1 downto 0) <= Qaux( 19 downto 18);
end Behavioral;

