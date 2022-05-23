----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2022 11:17:11
-- Design Name: 
-- Module Name: CheminDeDonnees - Behavioral
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

entity CheminDeDonnees is
    Port (RST : in STD_LOGIC;
        CLK : in STD_LOGIC;
        C : in STD_LOGIC_VECTOR (7 downto 0);
        OP : in STD_LOGIC_VECTOR (7 downto 0);
        B : in STD_LOGIC_VECTOR (7 downto 0);
        S_W : in STD_LOGIC;
        S_W2 : out STD_LOGIC;
        A : in STD_LOGIC_VECTOR (7 downto 0)
           );
end CheminDeDonnees;

architecture Behavioral of CheminDeDonnees is

signal IP : STD_LOGIC_VECTOR (7 downto 0):="00000000";

--BMI
COMPONENT BMI
Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           S_OUT : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

--BR
COMPONENT BR
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC_VECTOR (3 downto 0);
           Wlogic : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

--BMD
COMPONENT BMD
PORT ( 
    Addr : in STD_LOGIC_VECTOR (7 downto 0);
    S_IN : in STD_LOGIC_VECTOR (7 downto 0);
    RW : in STD_LOGIC;
    RST : in STD_LOGIC;
    CLK : in STD_LOGIC;
    S_OUT : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

-- UAL
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

signal b_lidi : STD_LOGIC_VECTOR(7 downto 0);
signal b_diex : STD_LOGIC_VECTOR(7 downto 0);
signal b_exmem : STD_LOGIC_VECTOR(7 downto 0);
signal b_memre : STD_LOGIC_VECTOR(7 downto 0);

signal a_lidi : STD_LOGIC_VECTOR(3 downto 0);
signal a_diex : STD_LOGIC_VECTOR(3 downto 0);
signal a_exmem : STD_LOGIC_VECTOR(3 downto 0);
signal a_memre : STD_LOGIC_VECTOR(3 downto 0);

signal c_lidi : STD_LOGIC_VECTOR(3 downto 0);
signal c_diex : STD_LOGIC_VECTOR(3 downto 0);
signal c_exmem : STD_LOGIC_VECTOR(3 downto 0);
signal c_memre : STD_LOGIC_VECTOR(3 downto 0);

signal op_lidi : STD_LOGIC_VECTOR(3 downto 0);
signal op_diex : STD_LOGIC_VECTOR(3 downto 0);
signal op_exmem : STD_LOGIC_VECTOR(3 downto 0);
signal op_memre : STD_LOGIC_VECTOR(3 downto 0);

signal LC_converter : STD_LOGIC;
signal reset : STD_LOGIC;
signal clock : STD_LOGIC;
signal MUX_converter : STD_LOGIC_VECTOR(7 downto 0);

signal LC_Ctrl_Alu : STD_LOGIC_VECTOR(7 downto 0);
signal MUX_S : STD_LOGIC_VECTOR(7 downto 0);
signal Carry : STD_LOGIC;
signal Neg : STD_LOGIC;
signal Overflow : STD_LOGIC;

-- BMI
signal lecture_bmi : STD_LOGIC_VECTOR(4 downto 0);

begin

LC_converter <= '1' when op_memre = "0110";

Label_br: BR PORT MAP (
    A => b_lidi,
    B => c_lidi,
    W => a_memre,
    DATA => b_memre,
    Wlogic => LC_converter, --verif
    RST => reset,
    CLK => clock,
    QA => MUX_converter, --verif
    QB => c_diex
    );

Label_ual: UAL PORT MAP (
    A =>b_diex,
    B =>c_diex,
    Ctrl_Alu => LC_Ctrl_Alu, --verif
    carry => Carry,  --verif
    neg => Neg, --verif
    overflow => Overflow,
    S => MUX_S --verif
    );
    
Label_bmd: BMD PORT MAP (
    Addr => MUX_converter, --verif
    S_IN => b_exmem,
    RW => LC_converter, --verif
    RST => reset, --verif
    CLK => clock, --verif
    S_OUT => b_memre
    );    
    
Label_bmi: BMI PORT MAP (
    Addr => IP,
    CLK => clock,
    S_OUT => lecture_bmi
    );

process(CLK)

begin
if rising_edge(CLK) then
   
-- lire le tableau d'instruction
    op_lidi <= lecture_bmi (27 downto 24);
    a_lidi <= lecture_bmi (19 downto 16);
    b_lidi <= lecture_bmi (11 downto 8);
    c_lidi <= lecture_bmi (3 downto 0);
   
    

    
-- recuperer les valeurs dans le banc de registre 
    a_diex <= a_lidi;
    op_diex <= op_lidi;
    b_diex <= b_lidi;
    
-- On fait le calcul
    -- pour l'instant pas d'op
    
-- On envoie la valeur dans le tableau de données
    a_exmem <= a_diex;
    op_exmem <= op_diex;
    b_exmem <= b_diex;

-- je sais pas
    a_memre <= a_exmem;
    op_memre <= op_exmem;
    b_memre <= b_exmem;
    
-- Logique combinatoire ppour savoir si on écrit    
    if op_exmem="0110" then --or ... 
        LC_converter <= '1'; --ecriture
    else
        LC_converter <= '0';
    end if;
    
-- Deuxieme passage par le banc de registre pour ecriture
    --rien a faire car deja fait
    
end if; --clock

end process;


end Behavioral;
