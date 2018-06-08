library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nivel is
    Port ( clk, clr : in  STD_LOGIC;
           nivel_alto : out  STD_LOGIC);
end Nivel;

architecture Behavioral of Nivel is
	signal pclk : STD_LOGIC :='0' ;
	signal nclk : STD_LOGIC :='0' ;  
begin
	process(clk,clr)
	begin
		if( clr='1' ) then
			pclk <= '0' ;
			nclk <= '0' ;
		elsif( rising_edge (clk) )then
			pclk <= not pclk ;
		elsif( falling_edge(clk) )then
			nclk <= not nclk ;
		end if;
	end process;
	
	nivel_alto <= (nclk) XOR (pclk);
end Behavioral;


