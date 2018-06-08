library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pila is
    port ( d : in  std_logic_vector (15 downto 0);
           q : out  std_logic_vector (15 downto 0);
           clk : in  std_logic;
           clr : in  std_logic;
           up : in  std_logic;
           dw : in  std_logic;
           wpc : in  std_logic);
end pila;

architecture programa of pila is
type contadores is array(0 to 7) of std_logic_vector(15 downto 0);
begin

	pila : process( clk, clr )
	variable stackpointer : integer range 0 to 7;
	variable pcs : contadores;
	begin
		if( clr = '1' )then
			stackpointer := 0;
			pcs := (others => (others => '0'));
		elsif( rising_edge(clk) )then
			if( wpc = '1' and up = '0' and dw = '0' )then		-- saltos 
				pcs(stackpointer) := d;
			elsif( wpc = '1' and up = '1' and dw = '0' )then	-- call
				stackpointer := stackpointer + 1;
				pcs(stackpointer) := d;
			elsif( wpc = '0' and up = '0' and dw = '1' )then 	-- decremento
				stackpointer := stackpointer - 1;
				pcs(stackpointer) := pcs(stackpointer) + 1;
			elsif( wpc = '0' and up = '0' and dw = '0' )then 	-- incremento
				pcs(stackpointer) := pcs(stackpointer) + 1;
			end if;			
		end if;
		q <= pcs(stackpointer);
	end process pila;

end programa;

