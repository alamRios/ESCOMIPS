library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.UControl.ALL;

entity Main is
    Port ( dato_in : in  STD_LOGIC_VECTOR (3 downto 0);
           clk,clr,ini : in  STD_LOGIC;
           display : out  STD_LOGIC_VECTOR (6 downto 0));
end Main;

architecture Behavioral of Main is
	signal cuenta : std_logic_vector(3 downto 0);
	signal registro_out : std_logic_vector(3 downto 0); 
	signal z,la,ea,eb,ec,lb : std_logic; 
begin
	contador_a : Contador port map(eb,lb,clk,clr,cuenta);
	decoder_a : Decoder port map(ec,cuenta,display);
	z <= '1' when (registro_out = "1111") else '0';
	carta_a : Carta port map( ini, clk, clr, registro_out(0), z, --entradas
           la, ea, lb, eb, ec); --salidas
	registro_a : Registro port map( clk,clr,la,ea,dato_in, --entradas
           registro_out); --salidas
end Behavioral;

