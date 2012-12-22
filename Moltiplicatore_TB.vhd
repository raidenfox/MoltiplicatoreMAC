--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:37:26 12/21/2012
-- Design Name:   
-- Module Name:   C:/Users/Tony Stark/Desktop/Moltiplicatore/Moltiplicatore_TB.vhd
-- Project Name:  Moltiplicatori
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Moltiplicatore_Finale
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
 
ENTITY Moltiplicatore_TB IS
END Moltiplicatore_TB;
 
ARCHITECTURE behavior OF Moltiplicatore_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Moltiplicatore_Finale
    PORT(
         operand1 : IN  std_logic_vector(3 downto 0);
         operand2 : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         en : IN  std_logic;
         btn1 : IN  std_logic;
         btn2 : IN  std_logic;
         anodes : OUT  std_logic_vector(3 downto 0);
         cathodes : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal operand1 : std_logic_vector(3 downto 0) := (others => '0');
   signal operand2 : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal en : std_logic := '0';
   signal btn1 : std_logic := '0';
   signal btn2 : std_logic := '0';

 	--Outputs
   signal anodes : std_logic_vector(3 downto 0);
   signal cathodes : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Moltiplicatore_Finale PORT MAP (
          operand1 => operand1,
          operand2 => operand2,
          clk => clk,
          en => en,
          btn1 => btn1,
          btn2 => btn2,
          anodes => anodes,
          cathodes => cathodes
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		
		operand1 <= "1001";
		btn1 <= '1';
		
		wait for 100 ns;
		
		operand2 <= "1100";
		btn1 <= '0';
		btn2 <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
