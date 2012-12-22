--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:41:16 12/17/2012
-- Design Name:   
-- Module Name:   C:/Users/Raidenfox/ISE/Moltiplicatori/MAC_Cell_TB.vhd
-- Project Name:  Moltiplicatori
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MAC_Cell
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
 
ENTITY MAC_Cell_TB IS
END MAC_Cell_TB;
 
ARCHITECTURE behavior OF MAC_Cell_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MAC_Cell
    PORT(
         s_ij : IN  std_logic;
         xj : IN  std_logic;
         yi : IN  std_logic;
         cj_i : IN  std_logic;
         cj_next_i : OUT  std_logic;
         xj_out : OUT  std_logic;
         sum_inext_jprev : OUT  std_logic;
         yi_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal s_ij : std_logic := '0';
   signal xj : std_logic := '1';
   signal yi : std_logic := '0';
   signal cj_i : std_logic := '1';

 	--Outputs
   signal cj_next_i : std_logic;
   signal xj_out : std_logic;
   signal sum_inext_jprev : std_logic;
   signal yi_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MAC_Cell PORT MAP (
          s_ij => s_ij,
          xj => xj,
          yi => yi,
          cj_i => cj_i,
          cj_next_i => cj_next_i,
          xj_out => xj_out,
          sum_inext_jprev => sum_inext_jprev,
          yi_out => yi_out
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
