-- ***********************************************
-- **  PROYECTO PDUA                            **
-- **  Modulo: 	ROM                           **
-- **  Creacion:	Julio 07								**
-- **  Revisi�:	Marzo 08								**
-- **  Por:		   MGH-CMUA-UNIANDES 				**
-- ***********************************************
-- Descripcion:
-- ROM (Solo lectura)
--                      cs  
--                  _____|_
--           rd -->|       |
--          dir -->|       |--> data
--                 |_______|   
--        
-- ***********************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM is
    Port ( cs,rd	: in std_logic;
           dir 	: in std_logic_vector(6 downto 0);
           data 	: out std_logic_vector(7 downto 0));
end ROM;

architecture Behavioral of ROM is

begin
process(cs,rd,dir)
begin
if cs = '1' and rd = '0' then
       case dir is
	    when "00000" => data <= "01010000";  -- JMP MAIN
	    when "00001" => data <= "00000011";  -- MAIN 
	    --Multiplicador y multiplicando
		 when "00010" => data <= "00011000";  -- MOV ACC,CTE
	    when "00011" => data <= "00000000";  -- CTE (0x00)
		 when "00100" => data <= "00101000";  -- MOV DPTR, ACC
	    when "00101" => data <= "00011000";  -- MOV ACC,CTE
	    when "00110" => data <= "01010000";  -- CTE (0x50)
	    when "00111" => data <= "10001000";  -- MOVP [DPTR], ACC
	    when "01000" => data <= "00011000";  -- MOV ACC,CTE
	    when "01001" => data <= "00000001";  -- CTE (0x01)
		 when "01010" => data <= "00101000";  -- MOV DPTR, ACC
	    when "01011" => data <= "00011000";  -- MOV ACC,CTE
	    when "01100" => data <= "00000001";  -- CTE (0x64)
	    when "01101" => data <= "10001000";  -- MOVP [DPTR], ACC
	    --Resultado
		 when "01110" => data <= "00011000";  -- MOV ACC,CTE
	    when "01111" => data <= "00000010";  -- CTE (0x02) 		 
	    when "10000" => data <= "00101000";  -- MOV DPTR, ACC 
	    when "10001" => data <= "10000000";  -- MOVP ACC, [DPTR]	 
	    when "10010" => data <= "00011000";  -- MOV ACC,CTE
	    when "00011" => data <= "00000011";  -- CTE (0x03) 		 
	    when "10100" => data <= "00101000";  -- MOV DPTR, ACC 
	    when "10101" => data <= "10000000";  -- MOVP ACC, [DPTR]
	    when "10011" => data <= "00000000";  -- 
		 when "10100" => data <= "00000000";  -- 
	    when "10101" => data <= "00000000";  -- 
	    when "10110" => data <= "00000000";  -- 
	    when "10111" => data <= "00000000";  -- 
	    when "11000" => data <= "00000000";  -- 
		 when "11001" => data <= "00000000";  -- 	 
		 when "11010" => data <= "00000000";  -- 
		 when "11011" => data <= "00000000";  -- 
		 when "11100" => data <= "00000000";  -- 
		 when "11101" => data <= "00000000";  -- 
	    when "11110" => data <= "00000000";  -- 
		 when "11111" => data <= "00000000";  --	 
		 
		 when others => data <= (others => 'X'); 
       end case;
else data <= (others => 'Z');
end if;  
end process;
end;