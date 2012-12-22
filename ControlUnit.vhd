----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:58:12 12/20/2012 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ControlUnit is
    GENERIC(N: Integer := 4);
    Port ( mul1 : in  STD_LOGIC_VECTOR(N-1 downto 0);
           mul2 : in  STD_LOGIC_VECTOR(N-1 downto 0);
           clock : in  STD_LOGIC;
           en : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           load1 : in  STD_LOGIC;
           load2 : in  STD_LOGIC;
           reg1 : out  STD_LOGIC_VECTOR(N-1 downto 0);
           reg2 : out  STD_LOGIC_VECTOR(N-1 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is
signal en_n : STD_LOGIC := '0';
begin

en_n <= not en;

CUPROCESS:PROCESS(clock,mul1,mul2,en,load1,load2)
begin

	if en_n = '1' or reset = '1' then
	reg1 <= (others => '0');
	reg2 <= (others => '0');
	elsif rising_edge(clock) then
		if load1 = '1' then
		   reg1 <= mul1;
		elsif load2 = '1' then
			reg2 <= mul2;
		end if;
	end if;

END PROCESS;


end Behavioral;

