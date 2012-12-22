----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:05:12 12/21/2012 
-- Design Name: 
-- Module Name:    Moltiplicatore_Finale - Behavioral 
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

entity Moltiplicatore_Finale is
    GENERIC(N: Integer := 4);
    Port ( operand1 : in  STD_LOGIC_VECTOR (N-1 downto 0);
           operand2 : in  STD_LOGIC_VECTOR (N-1 downto 0);
			  clk : in STD_LOGIC;
			  en : in STD_LOGIC;
			  reset : in STD_LOGIC;
			  btn1 : in STD_LOGIC;
			  btn2 : in STD_LOGIC;
           anodes : out  STD_LOGIC_VECTOR (N-1 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (2*N - 1 downto 0);
			  op1: out  STD_LOGIC_VECTOR (N-1 downto 0);
			  op2: out  STD_LOGIC_VECTOR (N-1 downto 0));
end Moltiplicatore_Finale;

architecture Behavioral of Moltiplicatore_Finale is

    COMPONENT ControlUnit
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
    END COMPONENT;

	 COMPONENT Display7
    GENERIC(freq_in : Integer := 50000000;
				freq_out : Integer := 400);
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           valuetodisplay : in  STD_LOGIC_VECTOR (15 downto 0);
           anodi : out  STD_LOGIC_VECTOR (3 downto 0);
           catodi : out  STD_LOGIC_VECTOR (7 downto 0));
	 END COMPONENT;

    COMPONENT Moltiplicatore_Celle_MAC
    GENERIC(N: Integer := 4);
    PORT(
         x_in : IN  std_logic_vector(N-1 downto 0);
         y_in : IN  std_logic_vector(N-1 downto 0);
         result : OUT  std_logic_vector(2*N-1 downto 0)
        );
    END COMPONENT;

    COMPONENT Counter
    GENERIC(N: Integer := 4);
    PORT(
         token : IN  std_logic_vector(2*N-1 downto 0);
         clock : IN  std_logic;
         digit0 : OUT  std_logic_vector(N-1 downto 0);
         digit1 : OUT  std_logic_vector(N-1 downto 0);
         digit2 : OUT  std_logic_vector(N-1 downto 0);
         digit3 : OUT  std_logic_vector(N-1 downto 0)
        );
    END COMPONENT;

signal register1,register2,dgt0,dgt1,dgt2,dgt3 : STD_LOGIC_VECTOR (N-1 downto 0) := (others => '0');
signal result_temp : STD_LOGIC_VECTOR (2*N-1 downto 0) := (others => '0');
signal value_to : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');

begin

value_to <= dgt3 & dgt2 & dgt1 & dgt0;
op1 <= operand1;
op2 <= operand2;

CU:ControlUnit port map(operand1,operand2,clk,'1',reset,btn1,btn2,register1,register2);
MACMUL:Moltiplicatore_Celle_MAC port map(register1,register2,result_temp);
CNT:Counter port map(result_temp,clk,dgt0,dgt1,dgt2,dgt3);
DISP:Display7 port map(clk,'1',value_to,anodes,cathodes);

end Behavioral;

