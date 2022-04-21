----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.04.2022 10:04:35
-- Design Name: 
-- Module Name: Clock - Behavioral
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

entity Clock is
    Port ( Clk : in STD_LOGIC;
           op_out : out STD_LOGIC_VECTOR (7 downto 0);
           op_in : in STD_LOGIC_VECTOR (7 downto 0);
           a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           c : in STD_LOGIC_VECTOR (7 downto 0);
           a_out : out STD_LOGIC_VECTOR (7 downto 0);
           b_out : out STD_LOGIC_VECTOR (7 downto 0);
           c_out : out STD_LOGIC_VECTOR (7 downto 0));
end Clock;

architecture Behavioral of Clock is

begin

process(Clk)
    begin
    if (rising_edge(Clk)) then 
            op_out<= op_in;
            a_out<= a;
            b_out<= b;
            c_out<= c;
    end if;
    
    end process;
    
end Behavioral;
