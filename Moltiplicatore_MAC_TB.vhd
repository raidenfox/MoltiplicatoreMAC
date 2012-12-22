--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:20:08 12/20/2012
-- Design Name:   
-- Module Name:   C:/Users/Tony Stark/Desktop/Moltiplicatore/Moltiplicatore_MAC_TB.vhd
-- Project Name:  Moltiplicatori
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Moltiplicatore_Celle_MAC
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
 
ENTITY Moltiplicatore_MAC_TB IS
END Moltiplicatore_MAC_TB;
 
ARCHITECTURE behavior OF Moltiplicatore_MAC_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Moltiplicatore_Celle_MAC
    PORT(
         x_in : IN  std_logic_vector(3 downto 0);
         y_in : IN  std_logic_vector(3 downto 0);
         result : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x_in : std_logic_vector(3 downto 0) := "1111";
   signal y_in : std_logic_vector(3 downto 0) := "1111";

 	--Outputs
   signal result : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Moltiplicatore_Celle_MAC PORT MAP (
          x_in => x_in,
          y_in => y_in,
          result => result
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 

      wait;
   end process;

END;
