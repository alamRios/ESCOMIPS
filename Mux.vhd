library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is
    Port ( m_funcion, m_operacion : in  STD_LOGIC_VECTOR (19 downto 0);
			  sm : in STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (19 downto 0));
end Mux;

architecture Behavioral of Mux is

begin
	process(sm, m_funcion, m_operacion)
	begin
		if(sm = '1')then
			s <= m_operacion;
		else
			s <= m_funcion;
		end if;
	end process;

end Behavioral;
