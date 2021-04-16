----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2021 10:24:26 PM
-- Design Name: 
-- Module Name: Top_Design - Behavioral
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

entity Top_Design is
    Port ( I_Clk : in STD_LOGIC;
           I_Red : in STD_LOGIC_VECTOR (3 downto 0);
           I_Green : in STD_LOGIC_VECTOR (3 downto 0);
           I_Blue : in STD_LOGIC_VECTOR (3 downto 0);
           O_Red : out STD_LOGIC_VECTOR (3 downto 0);
           O_Green : out STD_LOGIC_VECTOR (3 downto 0);
           O_Blue : out STD_LOGIC_VECTOR (3 downto 0);
           O_Hsync : out STD_LOGIC;
           O_Vsync : out STD_LOGIC;
           O_Clk : out STD_LOGIC);
end Top_Design;

architecture Behavioral of Top_Design is

component Clock_Divider is
    Port ( I_Clk : in STD_LOGIC;
           O_Clk : out STD_LOGIC);
end component;
           
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

signal Clock_Signal : STD_LOGIC := '0';

begin

Inst_Clock_Divider: Clock_Divider
    Port Map( I_Clk => I_Clk,
              O_Clk => Clock_Signal);
              
Inst_VGA_Controller: VGA_Controller
    Port Map( I_Clk => Clock_Signal,
              I_Red => I_Red,
              I_Green => I_Green,
              I_Blue => I_Blue,
              O_Red => O_Red,
              O_Green => O_Green,
              O_Blue => O_Blue,
              O_Hsync => O_Hsync,
              O_Vsync => O_Vsync);
              
O_CLK <= Clock_Signal;
    
end Behavioral;
