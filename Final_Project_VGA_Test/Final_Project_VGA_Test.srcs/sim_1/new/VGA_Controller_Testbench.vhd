----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2021 01:07:51 AM
-- Design Name: 
-- Module Name: VGA_Controller_Testbench - Behavioral
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

entity VGA_Controller_Testbench is
--  Port ( );
end VGA_Controller_Testbench;

architecture Behavioral of VGA_Controller_Testbench is

component VGA_Controller is
    Port ( I_Clk : in STD_LOGIC;
           I_Red : in STD_LOGIC_VECTOR (3 downto 0);
           I_Green : in STD_LOGIC_VECTOR (3 downto 0);
           I_Blue : in STD_LOGIC_VECTOR (3 downto 0);
           O_Red : out STD_LOGIC_VECTOR (3 downto 0);
           O_Green : out STD_LOGIC_VECTOR (3 downto 0);
           O_Blue : out STD_LOGIC_VECTOR (3 downto 0);
           O_Hsync : out STD_LOGIC;
           O_Vsync : out STD_LOGIC);
end component;

signal I_Clk : STD_LOGIC := '0';
signal I_Red : STD_LOGIC_VECTOR (3 downto 0) := (others => '1');
signal I_Green : STD_LOGIC_VECTOR (3 downto 0) := (others => '1');
signal I_Blue : STD_LOGIC_VECTOR (3 downto 0) := (others => '1');
signal O_Red : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal O_Green : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal O_Blue : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal O_Hsync : STD_LOGIC := '0';
signal O_Vsync : STD_LOGIC := '0';

constant PERIOD : time := 40 ns;

begin

Inst_VGA_Controller: VGA_Controller
    Port Map( I_Clk => I_Clk,
              I_Red => I_Red,
              I_Green => I_Green,
              I_Blue => I_Blue,
              O_Red => O_Red,
              O_Green => O_Green,
              O_Blue => O_Blue,
              O_Hsync => O_Hsync,
              O_Vsync => O_Vsync);

process
begin
    I_Clk <= '0';
    wait for PERIOD/2;
    I_Clk <= '1';
    wait for PERIOD/2;
end process;

--process
--begin
--I_Red(0) <= '1';
--I_Green(1) <= '1';
--I_Blue(2) <= '1';

--end process;

end Behavioral;
