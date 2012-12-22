--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:06:54 12/20/2012
-- Design Name:   
-- Module Name:   C:/Users/Tony Stark/Desktop/Moltiplicatore/MAC_CHAIN_TB.vhd
-- Project Name:  Moltiplicatori
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MAC_Chain
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
 
ENTITY MAC_CHAIN_TB IS
END MAC_CHAIN_TB;
 
ARCHITECTURE behavior OF MAC_CHAIN_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MAC_Chain
    PORT(
         prev_step : IN  std_logic_vector(3 downto 0);
         s_ij_in : IN  std_logic_vector(3 downto 0);
         y_in : IN  std_logic;
         c_in : IN  std_logic;
         s_next_step : OUT  std_logic_vector(3 downto 0);
         x_next_step : OUT  std_logic_vector(3 downto 0);
         p_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal prev_step : std_logic_vector(3 downto 0) := "0111";
   signal s_ij_in : std_logic_vector(3 downto 0) := (others => '0');
   signal y_in : std_logic := '0';
   signal c_in : std_logic := '0';

 	--Outputs
   signal s_next_step : std_logic_vector(3 downto 0);
   signal x_next_step : std_logic_vector(3 downto 0);
   signal p_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MAC_Chain PORT MAP (
          prev_step => prev_step,
          s_ij_in => s_ij_in,
          y_in => y_in,
          c_in => c_in,
          s_next_step => s_next_step,
          x_next_step => x_next_step,
          p_out => p_out
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
