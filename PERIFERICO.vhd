--                     cs_mult 
--                   _____|_
--            rw -->|       |
-- dir(direccion)-->|       |--> data_out
--       data_in -->|       |--> X_mult
--    Resultado1 -->|       |--> Y_mult
--    Resultado1 -->|_______|
--
--
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PERIFERICO is
    Port ( cs_mult,rw	   : in std_logic;
           dir 	   : in std_logic_vector(2 downto 0);
           data_in 	: in std_logic_vector(7 downto 0);
			  data_out 	: out std_logic_vector(7 downto 0);
			  X_mult		: out std_logic_vector(7 downto 0);
			  Y_mult		: out std_logic_vector(7 downto 0);
			  resultado1: in std_logic_vector(7 downto 0);
			  resultado2: in std_logic_vector(7 downto 0));
end PERIFERICO;

architecture Behavioral of PERIFERICO is

type memoria is array (7 downto 0) of std_logic_vector(7 downto 0);
signal mem: memoria;

begin
process(cs_mult,rw,dir,data_in,mem)
begin
if cs_mult = '1' then
   if rw = '0' then  -- Read
       case dir is
	    --when "000" => data_out <= mem(0);--X_mult
	    --when "001" => data_out <= mem(1);--y_mult
	    when "010" => data_out <= mem(2);--Resultado1
	    when "011" => data_out <= mem(3);--Resultado2
	    when "100" => data_out <= mem(4);
	    when "101" => data_out <= mem(5);
	    when "110" => data_out <= mem(6);
	    when "111" => data_out <= mem(7);
	    when others => data_out <= (others => 'X'); 
       end case;
   else 					-- Write
       case dir is
	    when "000" => mem(0) <= Data_in;--X_mult
	    when "001" => mem(1) <= Data_in;--Y_mult
	    --when "010" => mem(2) <= Data_in;--Resultado1
	    --when "011" => mem(3) <= Data_in;--Resultado2
	    when "100" => mem(4) <= Data_in;
	    when "101" => mem(5) <= Data_in;
	    when "110" => mem(6) <= Data_in;
	    when "111" => mem(7) <= Data_in;
	    when others => mem(7) <= Data_in; 
       end case;
    end if;
else data_out <= (others => 'Z');
end if;
mem(2)<=resultado1;
mem(3)<=resultado2;
X_mult<=mem(0);
Y_mult<=mem(1);  
end process;


end Behavioral;
