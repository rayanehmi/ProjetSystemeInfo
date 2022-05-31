----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2022 11:24:32
-- Design Name: 
-- Module Name: BMI - Behavioral
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
Use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BMI is
    Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           S_OUT : out STD_LOGIC_VECTOR (31 downto 0));
end BMI;

architecture Behavioral of BMI is


type memory is array (0 to 511) of std_logic_vector(31 downto 0);

signal s_Mem : memory:= (others => (others => '0'));

begin

--s_mem <= (x"06000300", x"06010200", , others=>x"00000000");
-- Test AFC COP : AFC R0 3; AFC R1 2; COP R0 R1
--s_mem <= (x"06000300", x"06010200", x"00000000", x"00000000", x"00000000", x"00000000", x"05000100", others=>x"00000000");

-- TEST UAL :
-- AFC R0 3
-- AFC R1 2
-- ADD R2 R0 R1
-- MUL R3 R0 R1
-- SUB R4 R0 R1
-- DIV R5 R0 R1
s_mem <= (x"06000300", x"06010200", x"00000000", x"00000000", x"00000000", x"00000000", x"01020001", x"01020001", x"02030001", x"03040001", x"04050001", x"05000100", others=>x"00000000");

-- Test Store Load
--s_mem <= (x"06000300", x"06010200", x"00000000", x"00000000", x"00000000", x"00000000", x"08010000",x"00000000", x"00000000", x"00000000", x"00000000", x"07020100", others=>x"00000000");

process(CLK)

    begin
    if rising_edge(CLK) then
        
        -- Partie mémoire instructions
        S_OUT<=s_Mem(to_integer(unsigned(Addr))); -- a verif
    end if;
end process;


end Behavioral;
