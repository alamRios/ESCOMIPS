
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
Port (
	a,b,operacion : in std_logic_vector(3 downto 0); 
	bandera : out std_logic_vector(3 downto 0);
	resultado : out std_logic_vector(3 downto 0)
);
end ALU;

architecture Behavioral of ALU is

	component alu1bit is
	Port(
		a,b,cin : in std_logic; 
		op, selectores : in std_logic_vector(1 downto 0); 
		cout,res : out std_logic 
	);
	end component; 
	
	signal c : std_logic_vector(4 downto 0);
	signal resultado_ax : std_logic_vector(3 downto 0); 
begin
	c(0) <= operacion(2); 
	alu_conect:
	for i in 0 to 3 generate
		alu_i : alu1bit port map(a(i),b(i),c(i),
			operacion(1 downto 0),operacion(3 downto 2),
			c(i+1),resultado_ax(i)); 
	end generate alu_conect; 
	
	resultado <= resultado_ax; 
	bandera(0) <= c(4); 
	bandera(1) <= not(resultado_ax(3) or resultado_ax(2) or resultado_ax(1) or resultado_ax(0));
	bandera(2) <= resultado_ax(3); 
	bandera(3) <= c(4) xor c(3);
end Behavioral;

