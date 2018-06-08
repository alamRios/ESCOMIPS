library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu1bit is
Port(
	a,b,cin : in std_logic; 
	op, selectores : in std_logic_vector(1 downto 0); 
	cout,res : out std_logic 
);
end alu1bit;

architecture Behavioral of alu1bit is
	component sumadorrestador is
	port(
		a : in STD_LOGIC;
		b : in STD_LOGIC;
		Cin : in  STD_LOGIC;
		s : out STD_LOGIC;
		cout : out  STD_LOGIC
	);
	end component; 
begin
	process(a,b,cin,op,selectores) 
		variable aaux, baux : std_logic; 
	begin
		aaux := a xor selectores(1); 
		baux := b xor selectores(0);
		cout<= '0';
		case op is 
			when "00" => 
				res <= aaux and baux; 
			when "01" => 
				res <= aaux or baux; 
			when "10" =>
				res <= aaux xor baux; 
			when others =>
				res <= aaux xor baux xor cin;
				cout<= (aaux and baux) or (aaux and cin) or (baux and cin);
		end case; 
	end process; 
end Behavioral;

