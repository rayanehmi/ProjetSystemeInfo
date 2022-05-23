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

entity Test_BMD is
--  Port ( );
end Test_BMD;

architecture Behavioral of Test_BMD is

COMPONENT BMD
PORT(
    Addr : in STD_LOGIC_VECTOR (7 downto 0);
    S_IN : in STD_LOGIC_VECTOR (7 downto 0);
    RW : in STD_LOGIC;
    RST : in STD_LOGIC;
    CLK : in STD_LOGIC;
    S_OUT : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

-- Inputs
signal tAddr : std_logic_vector(7 downto 0) := (others=> '0');
signal tS_IN :  std_logic_vector(7 downto 0) := (others=> '0');
signal tRW :  std_logic := '0';
signal tRST : std_logic := '0';
signal tCLK : std_logic := '0';

-- Outputs
signal tS_OUT : std_logic_vector(7 downto 0):= (others=> '0'); 

constant Clock_period : time := 10ns;

begin

Label_uut: BMD PORT MAP (
    Addr => tAddr,
    S_IN => tS_IN,
    RW => tRW,
    RST => tRST,
    CLK => tCLK,
    S_OUT => tS_OUT
    );
    
    Clock_process : process
    begin 
        tCLK <= not(tCLK);
        wait for Clock_period/2;
    end process;
    
    tAddr <= "00000001" after 0 ns;
    tS_IN <= "00000010" after 0 ns;
    tRW <= '0' after 0 ns, '1' after 60ns;

    tRST <= '1' after 0 ns;
    --tQA<= "00000000" after 0 ns;
    --tQB<= "00000000" after 0 ns;--probleme UU car pas initialisé

end Behavioral;
