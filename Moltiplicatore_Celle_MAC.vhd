----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:59:58 12/20/2012 
-- Design Name: 
-- Module Name:    Moltiplicatore_Celle_MAC - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Moltiplicatore_Celle_MAC is
	 GENERIC(N: Integer := 4);
    Port ( x_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           y_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           result : out  STD_LOGIC_VECTOR (2*N-1 downto 0));
end Moltiplicatore_Celle_MAC;

architecture Behavioral of Moltiplicatore_Celle_MAC is

    COMPONENT MAC_Chain
	 GENERIC(N: Integer := 4);
    PORT(
         prev_step : IN  std_logic_vector(N-1 downto 0);
         s_ij_in : IN  std_logic_vector(N-1 downto 0);
         y_in : IN  std_logic;
         c_in : IN  std_logic;
         s_next_step : OUT  std_logic_vector(N-1 downto 0);
         x_next_step : OUT  std_logic_vector(N-1 downto 0);
         p_out : OUT  std_logic
        );
    END COMPONENT;

type connector is array (N downto 0) of STD_LOGIC_VECTOR(N-1 downto 0);
signal connector1,connector2: connector ;
signal r :  STD_LOGIC_VECTOR(2*N-1 downto 0);
signal conv_sig : Integer;
signal out1: STD_LOGIC_VECTOR(N-1 downto 0);
begin

connector1(0) <= x_in;
connector2(0) <= "0000";

MAC_CX:for i in 0 to N-1 GENERATE
BEGIN
CHX: MAC_Chain port map(connector1(i),connector2(i),y_in(i),'0',connector2(i+1),connector1(i+1),out1(i));
END GENERATE;

result <= connector2(N) & out1 ;
r <= connector2(N) & out1;
conv_sig <= to_integer(unsigned(r));
end Behavioral;

