----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.04.2022 10:58:43
-- Design Name: 
-- Module Name: BR - Behavioral
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
--use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BR is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           W : in STD_LOGIC_VECTOR (7 downto 0);
           Wlogic : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0));

end BR;

architecture Behavioral of BR is

type memory is array (0 to 15) of std_logic_vector(7 downto 0);
signal s_Mem : memory:= (others => (others => '0'));  

begin

--mode lecture
QA<=s_Mem(to_integer(unsigned(A))) when A/=W or Wlogic ='0';
QB<=s_Mem(to_integer(unsigned(B))) when B/=W or Wlogic ='0';

-- Asynchrone car 1 front montant donc hors du process

process(CLK)
-- lecture synchrone
-- ecriture asynchrone

begin
    if rising_edge(CLK) then
        if (RST='0') then --Mode reset (on reset tout le tableau)
            s_Mem<= (others => (others => '0')); 
        else
            if (Wlogic='1') then --Mode writing
                s_Mem(to_integer(unsigned(W)))<=DATA;     
            end if;
        end if;
    end if;
end process;

end Behavioral;
