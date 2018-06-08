library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UDC is
    Port ( clk, clr : in  STD_LOGIC;
           tipoR, BEQ, BNE, BLT, BLE, BGT, BGE, NA, EQ, NEQ, LT, LE, GET, GT : in  STD_LOGIC;
           SM, SDOPC : out  STD_LOGIC);
end UDC;

architecture Behavioral of UDC is

TYPE estados is (A);
signal edo_actual, edo_siguiente : estados;

begin
	process(clk,clr)
		begin
			if(clr = '1') then
				edo_actual <= A;
			elsif( rising_edge(clk)) then
				edo_actual <= edo_siguiente;
			end if;
	end process;

	process(tipoR, BEQ, BNE, BLT, BLE, BGT, BGE, NA, EQ, NEQ, LT, LE, GET, GT, edo_actual)
		begin
			SM <= '0';
			SDOPC <= '0';
			case (edo_actual) is 
				when A => 
					edo_siguiente <= A;
					if(tipoR = '0') then
						if(BEQ = '1') then
							if(NA = '1') then
								SM <= '1';
							else
								if(EQ = '1') then
									SM <= '1';
									SDOPC <= '1';
								else 
									SM <= '1';
								end if;
							end if;
						
						elsif(BNE = '1')then
							if(NA = '1')then
								SM <= '1';
							else
								if(NEQ = '1') then
									SM <= '1';
									SDOPC <= '1';
								else
									SM <= '1';
								end if;
							end if;
					
					elsif(BLT = '1') then
						if(NA = '1') then
							SM <= '1';
						else
							if(LT = '1') then
								SM <= '1';
								SDOPC <= '1';
							else 
								SM <= '1';
							end if;
						end if;
					
					elsif(BLE = '1') then
						if(NA = '1') then
							SM <= '1';
						else
							if(LE = '1') then
								SM <= '1';
								SDOPC <= '1';
							else
								SM <= '1';
							end if;
						end if;
					
					elsif(BGT = '1') then
						if (NA = '1') then
							SM <= '1';
						else
							if(GT = '1')then
								SM <= '1';
								SDOPC <= '1';
							else
								SM <= '1';
							end if;
						end if;
					
					elsif(BGE = '1') then
						if(NA = '1') THEN
							SM <= '1';
						else
							if(GET = '1') then
								SM <= '1';
								SDOPC <= '1';
							else
								SM <= '1';
							end if;
						end if;
						
					else
						SM <= '1';
						SDOPC <= '1';
				end if;
			end if;
		end case;
	end process;
end Behavioral;
