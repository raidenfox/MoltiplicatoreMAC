----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:48:54 12/19/2012 
-- Design Name: 
-- Module Name:    MAC_Chain - Behavioral 
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

entity MAC_Chain is
    GENERIC(N: Integer := 4);
    Port ( prev_step : in  STD_LOGIC_VECTOR (N-1 downto 0);
			  s_ij_in : in STD_LOGIC_VECTOR (N-1 downto 0);
			  y_in : in STD_LOGIC;
			  c_in : in STD_LOGIC;
           s_next_step : out  STD_LOGIC_VECTOR (N-1 downto 0);
           x_next_step : out  STD_LOGIC_VECTOR (N-1 downto 0);
			  p_out : out STD_LOGIC);
end MAC_Chain;

architecture Behavioral of MAC_Chain is

COMPONENT MAC_Cell is
    Port ( s_ij : in  STD_LOGIC;
           xj : in  STD_LOGIC;
           yi : in  STD_LOGIC;
           cj_i : in  STD_LOGIC;
           cj_next_i : out  STD_LOGIC;
           xj_out : out  STD_LOGIC;
           sum_inext_jprev : out  STD_LOGIC;
           yi_out : out  STD_LOGIC);
END COMPONENT;

signal conn1,conn2 : STD_LOGIC_VECTOR (N downto 0) := (others => '0');
signal sums: STD_LOGIC_VECTOR (N-1 downto 0) := (others => '0');
begin

conn1(0) <= y_in;
conn2(0) <= c_in;
s_next_step <= conn2(N) & sums(N-1 downto 1);
p_out <= sums(0);
G1: for i in 0 to N-1 generate
begin
	MC:MAC_Cell port map(s_ij_in(i),prev_step(i),conn1(i),conn2(i),conn2(i+1),x_next_step(i),sums(i),conn1(i+1));
end generate;

end Behavioral;

