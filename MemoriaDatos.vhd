library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MemoriaDatos is
	generic(
		TAM_DATOS : integer := 16;
		TAM_BUS : integer := 8); --bus de direcciones 
    Port ( dir : in  STD_LOGIC_VECTOR ((TAM_BUS-1) downto 0);
			  dato_in : in STD_LOGIC_VECTOR ((TAM_DATOS-1) downto 0); 
           clk,wd : in  STD_LOGIC;
           dato_out : out  STD_LOGIC_VECTOR ((TAM_DATOS-1) downto 0));
end MemoriaDatos;

architecture Behavioral of MemoriaDatos is
	type coleccion is array(0 to ((2**TAM_BUS)-1)) of std_logic_vector((TAM_DATOS-1) downto 0);
	signal memoria : coleccion;
begin
	process(clk) begin
		if(clk'event and clk='1') then
			if(wd='1') then
				memoria(conv_integer(dir)) <= dato_in;
			end if; 
		end if; 
	end process; 
	
	dato_out <= memoria(conv_integer(dir)); 
end Behavioral;

