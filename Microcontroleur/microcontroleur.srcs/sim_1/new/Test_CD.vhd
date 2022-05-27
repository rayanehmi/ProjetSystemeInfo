----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2022 12:05:16
-- Design Name: 
-- Module Name: Test_CD - Behavioral
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

entity Test_CD is
--  Port ( );
end Test_CD;

architecture Behavioral of Test_CD is

COMPONENT CheminDeDonnees
Port (RST : in STD_LOGIC;
        CLK_CD : in STD_LOGIC;
        C : in STD_LOGIC_VECTOR (7 downto 0);
        OP : in STD_LOGIC_VECTOR (7 downto 0);
        B : in STD_LOGIC_VECTOR (7 downto 0);
        S_W : in STD_LOGIC;
        S_W2 : out STD_LOGIC;
        A : in STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

-- Inputs
signal tA :  std_logic_vector(7 downto 0) := (others=> '0');
signal tB :  std_logic_vector(7 downto 0) := (others=> '0');
signal tC :  std_logic_vector(7 downto 0) := (others=> '0');
signal tOP :  std_logic_vector(7 downto 0) := (others=> '0');
signal tS_W : std_logic := '0';
signal tCLK : std_logic := '0';
signal tRST : std_logic := '0';

-- Outputs
signal tS_W2 : std_logic := '0';

constant Clock_period : time := 10ns;

begin

Label_CD: CheminDeDonnees PORT MAP (
    A => tA,
    B => tB,
    C => tC,
    OP => tOP,
    S_W => tS_W,
    RST => tRST,
    CLK_CD => tCLK,
    S_W2 => tS_W2
    );
    
    Clock_process : process
    begin 
        tCLK <= not(tCLK);
        wait for Clock_period/2;
    end process;

    tRST <= '1' after 0 ns;


end Behavioral;
