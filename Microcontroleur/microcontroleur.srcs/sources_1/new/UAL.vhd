----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2022 13:33:44
-- Design Name: 
-- Module Name: UAL - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
use IEEE.math_real."log2";


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UAL is
    Port ( 
           A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           carry : out STD_LOGIC;
           neg : out STD_LOGIC;
           -- z : out STD_LOGIC; -- when result is zero
           overflow : out STD_LOGIC;
           Ctrl_Alu : in STD_LOGIC_VECTOR(7 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0));
end UAL;

architecture Behavioral of UAL is

signal S_add : STD_LOGIC_VECTOR (8 downto 0) := (others => '0');
signal S_mul : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal S_sub : STD_LOGIC_VECTOR (8 downto 0) := (others => '0');
signal S_div : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal MSB : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');

begin
    -- Addition de A + B dans le signal S_add
    S_add<= ('0'&A)+('0'&B);    --On rajoute 0 devant que l'on concatene pour prendre en compte la retenue
    carry<=S_add(8);
    
    --Multiplication
    S_mul<=A*B;
    overflow<='1'when S_mul(15 downto 8)/="00" else '0';
    
    -- Soustraction
    S_sub<= ('0'&A)-('0'&B);
    neg<=S_sub(8);
    
    -- Division
    -- B<= A(7)&A(7 downto 1);-
    S_div<=shr(A, "1"); --Division remplacée par un shift right
    --S_div<=shr(A, integer(log2(real(B) + real(1) ))); --Division remplacée par un shift right
    
    
    --Affectation du resultat
    S<=S_mul(7 downto 0) when (Ctrl_Alu="00000010")
    else S_add(7 downto 0) when (Ctrl_Alu="00000001")
    else S_sub(7 downto 0) when (Ctrl_Alu="00000100")
    else S_div(7 downto 0) when (Ctrl_Alu="00000101");
    

end Behavioral;
