library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Carta is
    Port ( ini, clk, clr, a0, z : in  STD_LOGIC;
           la, ea, lb, eb, ec : out  STD_LOGIC);
end Carta;

architecture Behavioral of Carta is
	type estado is (E0, E1, E2); 
	signal edo_act, edo_sig : estado; 
begin

	process(clk, clr) begin
		if(clr = '1') then 
			edo_act <= E0; 
		elsif rising_edge(clk) then
			edo_act <= edo_sig; 
		end if; 
	end process; 
	
	process(ini, z, a0, edo_act) begin 
		la <= '0'; 
		lb <= '0'; 
		eb <= '0'; 
		ec <= '0'; 
		ea <= '0'; 
		case(edo_act) is
			when E0 =>
				lb <= '1'; -- salida moore
				if(ini = '1') then -- begin transicion
					edo_sig <= E1; 
				else
					la <= '1'; 
					edo_sig <= E0; 
				end if; -- end transicion
			when E1 => 
				ea <= '1';
				if(z = '1') then 
					edo_sig <= E2; 
				else
					if(a0 = '1') then 
						eb <= '1';
					end if;
					edo_sig <= E1; 
				end if; 
			when others => 
				ec <= '1'; 
				if(ini = '1') then
					edo_sig <= E2; 
				else
					edo_sig <= E0; 
				end if; 
		end case; 
	end process; 
end Behavioral;

