library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity arreglo is
    Port ( read_reg1, read_reg2,write_reg : in  STD_LOGIC_VECTOR (3 downto 0);
           write_data : in  STD_LOGIC_VECTOR (15 downto 0);
			  shamt : in STD_LOGIC_VECTOR(3 downto 0); 
           read_data1, read_data2 : out  STD_LOGIC_VECTOR (15 downto 0);
			  dir : in std_logic;
			  wr, she, clk, clr : in  STD_LOGIC);
end arreglo;

architecture Behavioral of arreglo is
type banco is array (0 to 15) of std_logic_vector(15 downto 0);
signal registros : banco;
signal read_data1aux : std_logic_vector(15 downto 0); 
begin
	process(clk, clr)
	begin
		if (clr='1') then
			for i in 0 to 15 loop
				registros(i) <= (others=>'0');
			end loop;
		elsif (clk'event and clk='1') then
			if(dir = '1' and she = '1' and wr = '1') then 
				registros(conv_integer(write_reg)) <= to_stdlogicvector(to_bitvector(read_data1aux) SLL conv_integer(shamt));
			elsif(she = '1' and wr = '1') then
				registros(conv_integer(write_reg)) <= to_stdlogicvector(to_bitvector(read_data1aux) SRL conv_integer(shamt));
			elsif(she = '1' and dir = '1') then
				read_data2 <= registros(conv_integer(read_reg2));
			else
				registros(conv_integer(write_reg)) <= write_data;
			end if;
		end if;
	end process;
	
	read_data1aux <= registros(conv_integer(read_reg1));
	read_data1 <= read_data1aux;
end Behavioral;

