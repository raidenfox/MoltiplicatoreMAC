----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:29:31 12/20/2012 
-- Design Name: 
-- Module Name:    Counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter is
    GENERIC(N: Integer := 4);
    Port ( token : in  STD_LOGIC_VECTOR (2*N-1 downto 0);
           clock : in  STD_LOGIC;
           digit0 : out  STD_LOGIC_VECTOR (N-1 downto 0);
           digit1 : out  STD_LOGIC_VECTOR (N-1 downto 0);
           digit2 : out  STD_LOGIC_VECTOR (N-1 downto 0);
           digit3 : out  STD_LOGIC_VECTOR (N-1 downto 0));
end Counter;

architecture Behavioral of Counter is

signal count9,dgt0,dgt1,dgt2,dgt3: STD_LOGIC_VECTOR(N-1 downto 0) := "0000";
signal countn: STD_LOGIC_VECTOR(2*N-1 downto 0) := (others => '0') ;

begin

digit0 <= dgt0;
digit1 <= dgt1;
digit2 <= dgt2;
digit3 <= dgt3;

PR:process(clock)
begin
	
	if(clock'event and clock='1') and countn /= token then
		count9<=count9+1;
		if count9 = "0001" then
		count9 <= "0000";
		dgt0 <= dgt0+1;
		countn <= countn+1;
			if dgt0 = "1001" then
			dgt1 <= dgt1+1;
			dgt0 <= "0000";
				if dgt1 = "1001" then
				dgt2 <= dgt2+1;
				dgt1 <= "0000";
					if dgt2 <= "1001" then
					   dgt3 <= dgt3 + 1;
						dgt3 <= "0000";
					end if;
				end if;
			end if;
		end if;
	end if;
end process;

end Behavioral;

