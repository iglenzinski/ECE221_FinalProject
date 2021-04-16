----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2021 10:24:26 PM
-- Design Name: 
-- Module Name: VGA_Controller - Behavioral
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

entity VGA_Controller is
    Port ( I_Clk : in STD_LOGIC;
           I_Red : in STD_LOGIC_VECTOR (3 downto 0);
           I_Green : in STD_LOGIC_VECTOR (3 downto 0);
           I_Blue : in STD_LOGIC_VECTOR (3 downto 0);
           O_Red : out STD_LOGIC_VECTOR (3 downto 0);
           O_Green : out STD_LOGIC_VECTOR (3 downto 0);
           O_Blue : out STD_LOGIC_VECTOR (3 downto 0);
           O_Hsync : out STD_LOGIC;
           O_Vsync : out STD_LOGIC);
end VGA_Controller;

architecture Behavioral of VGA_Controller is

begin


end Behavioral;
