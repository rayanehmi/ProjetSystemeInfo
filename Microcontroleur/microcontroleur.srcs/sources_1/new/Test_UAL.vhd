----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2022 14:53:37
-- Design Name: 
-- Module Name: Test_UAL - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Test_UAL is
--  Port ( );
end Test_UAL;

architecture Behavioral of Test_UAL is

COMPONENT UAL
PORT(
   A : in STD_LOGIC_VECTOR (7 downto 0);
   B : in STD_LOGIC_VECTOR (7 downto 0);
   carry : out STD_LOGIC;
   neg : out STD_LOGIC;
   -- z : out STD_LOGIC; -- when result is zero
   overflow : out STD_LOGIC;
   Ctrl_Alu : in STD_LOGIC_VECTOR(7 downto 0);
   S : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

-- Inputs
signal tA : std_logic_vector(7 downto 0) := (others=> '0');
signal tB :  std_logic_vector(7 downto 0) := (others=> '0');
signal tCtrl_Alu : std_logic_vector(7 downto 0) := (others=> '0');

-- Outputs
signal tCarry : std_logic := '0';
signal tNeg: std_logic := '0';
signal tOverflow : std_logic := '0';
signal tS : std_logic_vector(7 downto 0):= (others=> '0'); -- UU dans le scope car mal initialisé


begin

-- Instantiate the Unit Under Test (UUT)
Label_uut: UAL PORT MAP (
    A => tA,
    B => tB,
    Ctrl_Alu => tCtrl_Alu,
    carry => tCarry,
    neg => tNeg,
    overflow => tOverflow,
    S => tS
    );



-- Stimulus process
tA <= "11111111" after 0 ns;
tB <= "11111111" after 0 ns;
tCtrl_Alu <= "00000001" after 50 ns , "00000010" after 200 ns, "00000101" after 450 ns, "00000100" after 600 ns;


end Behavioral;