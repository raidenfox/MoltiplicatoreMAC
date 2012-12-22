----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:05 12/17/2012 
-- Design Name: 
-- Module Name:    Moltiplicatore_MAC - Behavioral 
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

entity Moltiplicatore_MAC is
    GENERIC( N : Integer := 4);
    Port ( in1 : in  STD_LOGIC_VECTOR (N-1 downto 0);
           in2 : in  STD_LOGIC_VECTOR (N-1 downto 0);
           risultato : out  STD_LOGIC_VECTOR (2*N - 1 downto 0));
end Moltiplicatore_MAC;

architecture Behavioral of Moltiplicatore_MAC is

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

type matrix is array(N downto 0, N downto 0) of STD_LOGIC_VECTOR(1 downto 0);
signal connections : matrix;
begin

GEN1: for i in N-1 downto 1 generate
begin
connections(N,i+1) <= '0' & in1(i);
connections(i+1,0) <= in2(i) & '0';
end generate;

GEN2:for j in N-1 downto 0 generate
begin
	GX:for k in N-1 downto 0 generate
	begin
	MCX:MAC_Cell port map(connections(j+1,k+1)(1),connections(j+1,k+1)(0),connections(j+1,N-1-k)(1),connections(j+1,N-1-k)(0),connections(j+1,N-k)(0),connections(j,k+1)(1),connections(j,k+1)(0),connections(j+1,N-k)(1));
	end generate;
end generate;

end Behavioral;

