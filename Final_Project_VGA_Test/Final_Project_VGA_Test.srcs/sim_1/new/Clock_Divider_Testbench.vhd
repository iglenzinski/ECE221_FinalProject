----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2021 01:46:22 AM
-- Design Name: 
-- Module Name: Clock_Divider_Testbench - Behavioral
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

entity Clock_Divider_Testbench is
--  Port ( );
end Clock_Divider_Testbench;

architecture Behavioral of Clock_Divider_Testbench is

component Clock_Divider is
    Port ( I_Clk : in STD_LOGIC;
           O_Clk : out STD_LOGIC);
end component;

signal I_Clk : STD_LOGIC := '0';
signal O_Clk : STD_LOGIC := '0';

constant PERIOD : time := 10 ns;

begin

Inst_Clock_Divider: Clock_Divider
    Port Map( I_Clk => I_Clk,
              O_Clk => O_Clk);

process
begin
    I_Clk <= '0';
    wait for PERIOD/2;
    I_Clk <= '1';
    wait for PERIOD/2;
end process;

end Behavioral;
