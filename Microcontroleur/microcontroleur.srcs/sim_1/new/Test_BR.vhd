----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.05.2022 10:52:25
-- Design Name: 
-- Module Name: Test_BR - Behavioral
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

entity Test_BR is
--  Port ( );
end Test_BR;

architecture Behavioral of Test_BR is

COMPONENT BR
PORT(
    A : in STD_LOGIC_VECTOR (3 downto 0);
    B : in STD_LOGIC_VECTOR (3 downto 0);
    W : in STD_LOGIC_VECTOR (3 downto 0);
    Wlogic : in STD_LOGIC;
    DATA : in STD_LOGIC_VECTOR (7 downto 0);
    RST : in STD_LOGIC;
    CLK : in STD_LOGIC;
    QA : out STD_LOGIC_VECTOR (7 downto 0);
    QB : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

-- Inputs
signal tA : std_logic_vector(3 downto 0) := (others=> '0');
signal tB :  std_logic_vector(3 downto 0) := (others=> '0');
signal tW :  std_logic_vector(3 downto 0) := (others=> '0');
signal tDATA :  std_logic_vector(7 downto 0) := (others=> '0');
signal tWlogic : std_logic := '0';
signal tRST : std_logic := '0';
signal tCLK : std_logic := '0';

-- Outputs
signal tQA : std_logic_vector(7 downto 0):= (others=> '0'); 
signal tQB : std_logic_vector(7 downto 0):= (others=> '0'); 

constant Clock_period : time := 10ns;

begin

Label_uut: BR PORT MAP (
    A => tA,
    B => tB,
    W => tW,
    DATA => tDATA,
    Wlogic => tWlogic,
    RST => tRST,
    CLK => tCLK,
    QA => tQA,
    QB => tQB
    );
    
    Clock_process : process
    begin 
        tCLK <= not(tCLK);
        wait for Clock_period/2;
    end process;
    
    tA <= "0001" after 0 ns;
    tB <= "0010" after 0 ns;
    tW <= "0001" after 0 ns;
    tDATA <= "00001110" after 0 ns;
    tWlogic <= '1' after 0 ns, '0' after 60 ns;

    tRST <= '1' after 0 ns;
    --tQA<= "00000000" after 0 ns;
    --tQB<= "00000000" after 0 ns;--probleme UU car pas initialisé

end Behavioral;
