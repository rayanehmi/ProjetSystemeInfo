----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2022 10:51:29
-- Design Name: 
-- Module Name: MB - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BMD is
    Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
           S_IN : in STD_LOGIC_VECTOR (7 downto 0);
           RW : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           S_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end BMD;

architecture Behavioral of BMD is

type memory is array (0 to 31) of std_logic_vector(7 downto 0);
signal s_Mem : memory:= (others => (others => '0'));

begin

-- Partie mémoire données

-- Lecture
S_OUT<=s_Mem(to_integer(unsigned(Addr)))when RW='0';

process(CLK)

begin
    if rising_edge(CLK) then
        if (RST='0') then --Mode reset (on reset tout le tableau)
            s_Mem<= (others => (others => '0')); 
        else
            if (RW='1') then
                -- Mode ecriture
                s_Mem(to_integer(unsigned(Addr)))<=S_IN;
            end if;
        end if;
    end if;
end process;


end Behavioral;
