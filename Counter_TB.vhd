--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:41:58 12/20/2012
-- Design Name:   
-- Module Name:   C:/Users/Tony Stark/Desktop/Moltiplicatore/Counter_TB.vhd
-- Project Name:  Moltiplicatori
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Counter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Counter_TB IS
END Counter_TB;
 
ARCHITECTURE behavior OF Counter_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Counter
    PORT(
         token : IN  std_logic_vector(7 downto 0);
         clock : IN  std_logic;
         digit0 : OUT  std_logic_vector(3 downto 0);
         digit1 : OUT  std_logic_vector(3 downto 0);
         digit2 : OUT  std_logic_vector(3 downto 0);
         digit3 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal token : std_logic_vector(7 downto 0) := "11111110";
   signal clock : std_logic := '0';

 	--Outputs
   signal digit0 : std_logic_vector(3 downto 0);
   signal digit1 : std_logic_vector(3 downto 0);
   signal digit2 : std_logic_vector(3 downto 0);
   signal digit3 : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Counter PORT MAP (
          token => token,
          clock => clock,
          digit0 => digit0,
          digit1 => digit1,
          digit2 => digit2,
          digit3 => digit3
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 


END;
