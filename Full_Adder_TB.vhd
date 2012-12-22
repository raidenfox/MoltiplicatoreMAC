--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:50:31 12/17/2012
-- Design Name:   
-- Module Name:   C:/Users/Raidenfox/ISE/Moltiplicatori/Full_Adder_TB.vhd
-- Project Name:  Moltiplicatori
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: full_adder
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
 
ENTITY Full_Adder_TB IS
END Full_Adder_TB;
 
ARCHITECTURE behavior OF Full_Adder_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder
    PORT(
         s1 : IN  std_logic;
         s2 : IN  std_logic;
         carry_in : IN  std_logic;
         result : OUT  std_logic;
         carry_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal s1 : std_logic := '1';
   signal s2 : std_logic := '1';
   signal carry_in : std_logic := '1';

 	--Outputs
   signal result : std_logic;
   signal carry_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder PORT MAP (
          s1 => s1,
          s2 => s2,
          carry_in => carry_in,
          result => result,
          carry_out => carry_out
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
