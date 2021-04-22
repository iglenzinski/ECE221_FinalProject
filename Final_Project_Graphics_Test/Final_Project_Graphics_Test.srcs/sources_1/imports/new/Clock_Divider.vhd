----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2021 10:24:26 PM
-- Design Name: 
-- Module Name: Clock_Divider - Behavioral
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

entity Clock_Divider is
    Port ( I_Clk : in STD_LOGIC;
           O_Clk : out STD_LOGIC);
end Clock_Divider;

architecture Behavioral of Clock_Divider is

signal Clock_Counter : integer range 0 to 1000 := 0;

constant Count_Target : integer := 4;

begin

process(I_Clk)
begin
if rising_edge(I_Clk) then
    if (Clock_Counter = (Count_Target - 1)) then
        Clock_Counter <= 0;
    else
        Clock_Counter <= Clock_Counter + 1;    
    end if;
    
    if (Clock_Counter < (Count_Target / 2)) then
        O_Clk <= '1';    
    else
        O_Clk <= '0';    
    end if;
end if;
end process;

end Behavioral;
