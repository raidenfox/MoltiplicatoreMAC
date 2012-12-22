----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:49:35 12/15/2012 
-- Design Name: 
-- Module Name:    MAC_Cell - Behavioral 
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

entity MAC_Cell is
    Port ( s_ij : in  STD_LOGIC;
           xj : in  STD_LOGIC;
           yi : in  STD_LOGIC;
           cj_i : in  STD_LOGIC;
           cj_next_i : out  STD_LOGIC;
           xj_out : out  STD_LOGIC;
           sum_inext_jprev : out  STD_LOGIC;
           yi_out : out  STD_LOGIC);
end MAC_Cell;

architecture Behavioral of MAC_Cell is

COMPONENT full_adder is
    Port ( s1 : in  STD_LOGIC;
           s2 : in  STD_LOGIC;
           carry_in : in  STD_LOGIC;
           result : out  STD_LOGIC;
           carry_out : out  STD_LOGIC);
END COMPONENT;

signal second_operand : STD_LOGIC := '0';

begin

yi_out <= yi;
xj_out <= xj;

second_operand <= yi and xj;

FA1: full_adder port map(s_ij,second_operand,cj_i,sum_inext_jprev,cj_next_i);

end Behavioral;

