library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.paquetes.all;

entity UnidadDeControl is
    Port (funcion,banderas: in std_logic_vector (3 downto 0);
		op_code: in std_logic_vector (4 downto 0);
		lf,clr,clk: in std_logic;
		na : inout STD_LOGIC;
		microins	: out std_logic_vector (19 downto 0 ));
end UnidadDeControl;

architecture Behavioral of UnidadDeControl is

signal aux_tipoR,aux_beq,aux_bne,aux_blt,aux_ble,aux_bgt,aux_bget: std_logic;
signal reg_aux_op : std_logic_vector(4 downto 0);
signal m_func,m_op : std_logic_vector(19 downto 0);

signal aux_na,aux_eq,aux_neq,aux_l,aux_le,aux_g,aux_ge,aux_sm,aux_sdopc : std_logic;

begin
	na <= aux_na;
		deco : Decodificador_Instruccion Port map ( 
			op_code =>  op_code,
			tipoR	=>	aux_tipoR, 
			BEQ	=>	aux_beq, 
			BNE	=>	aux_bne, 
			BLT	=>	aux_blt, 
			BLE	=>	aux_ble, 
			BGT	=>	aux_bgt, 
			BGET	=>	aux_bget);
			
		MF	:	Micro_Funcion Port map ( 
			funcion	=>	funcion,
			micro_funcion	=>	m_func );
		
		MO : Micro_Operacion Port map( 
			operacion => reg_aux_op,
			micro_operacion	=>	m_op);
		
		condi: Condicion Port map (
			banderas => banderas, 
			clk => clk, 
			clr => clr, 
			LF => lf,
			EQ => aux_eq, 
			NEQ => aux_neq, 
			LT	=> aux_l, 
			LE	=> aux_le, 
			GT	=>	aux_g, 
			GET => aux_ge);
		
		niv :	Nivel Port map ( 
			clk	=> clk, 
			clr	=>	clr, 
			nivel_alto	=>	aux_na );
		
		UC	:	UDC Port map( 
			clk	=>	clk, 
			clr	=>	clr, 
			tipoR	=>	aux_tipoR, 
			BEQ	=>	aux_beq, 
			BNE	=>	aux_bne, 
			BLT	=>	aux_blt, 
			BLE	=>	aux_ble, 
			BGT	=>	aux_bgt, 
			BGE	=>	aux_bget, 
			NA		=>	aux_na, 
			EQ		=>	aux_eq, 
			NEQ	=>	aux_neq, 
			LT		=>	aux_l, 
			LE		=>	aux_le, 
			GET	=>	aux_ge, 
			GT		=>	aux_g, 
			SM		=>	aux_sm, 
			SDOPC =>	aux_sdopc);
		
		mux_arriba :	Mux Port map ( 
			m_funcion => m_func,
			m_operacion => m_op,
			sm => aux_sm,
			s => microins);
		
		mux_abajo : Mux2 Port map(
			OP_CODE => op_code,
			SDOPC => aux_sdopc,
			s => reg_aux_op);
		
end Behavioral;
