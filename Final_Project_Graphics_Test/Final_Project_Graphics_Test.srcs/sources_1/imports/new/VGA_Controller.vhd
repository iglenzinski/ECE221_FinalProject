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
           O_Vsync : out STD_LOGIC;
           O_HCount : out INTEGER;
           O_VCount : out INTEGER);
end VGA_Controller;

architecture Behavioral of VGA_Controller is

-- *************  640 x 480  ************* --
Constant H_FrontPorch : INTEGER := 16;
Constant H_ViewWindow : INTEGER := 640;
Constant H_SyncCount : INTEGER := 96;
Constant H_BackPorch : INTEGER := 48;
Constant H_TotalCount : INTEGER := 800;

Constant V_FrontPorch : INTEGER := 10;
Constant V_ViewWindow : INTEGER := 480;
Constant V_SyncCount : INTEGER := 2;
Constant V_BackPorch : INTEGER := 33;
Constant V_TotalCount : INTEGER := 525;
-- *************************************** --

signal H_Count : INTEGER range 0 to 10000 := 0;
signal V_Count : INTEGER range 0 to 10000 := 0;

signal H_Color_Enable : STD_LOGIC := '0';
signal V_Color_Enable : STD_LOGIC := '0';

signal Color_Enable : STD_LOGIC := '0';

begin

process(I_Clk)
begin
    if rising_edge(I_Clk) then
    
    -- INCREMENT HORIZONTAL COUNTER
    H_Count <= H_Count + 1;
        
        if H_Count <= (H_ViewWindow - 1) then            
            O_Hsync <= '1';
            H_Color_Enable <= '1';
            if V_Count <= (V_ViewWindow - 1) then
                O_Vsync <= '1';
                V_Color_Enable <= '1';
            elsif V_Count <= (V_FrontPorch + V_ViewWindow - 1) then
                O_Vsync <= '1';
                V_Color_Enable <= '0';
            elsif V_Count <= (V_TotalCount - V_BackPorch - 1) then
                O_Vsync <= '0';
                V_Color_Enable <= '0';
            elsif V_Count <= (V_TotalCount - 1) then
                O_Vsync <= '1';
                V_Color_Enable <= '0';
            else
                V_Count <= 0;
            end if;
        elsif H_Count <= (H_FrontPorch + H_ViewWindow - 1) then
            O_Hsync <= '1';
            H_Color_Enable <= '0';
            if V_Count <= (V_ViewWindow - 1) then
                O_Vsync <= '1';
                V_Color_Enable <= '1';
            elsif V_Count <= (V_FrontPorch + V_ViewWindow - 1) then
                O_Vsync <= '1';
                V_Color_Enable <= '0';
            elsif V_Count <= (V_TotalCount - V_BackPorch - 1) then
                O_Vsync <= '0';
                V_Color_Enable <= '0';
            elsif V_Count <= (V_TotalCount - 1) then
                O_Vsync <= '1';
                V_Color_Enable <= '0';
            else
                V_Count <= 0;
            end if;
        elsif H_Count <= (H_TotalCount - H_BackPorch - 1) then
            O_Hsync <= '0';
            H_Color_Enable <= '0';
            if V_Count <= (V_ViewWindow - 1) then
                O_Vsync <= '1';
                V_Color_Enable <= '1';
            elsif V_Count <= (V_FrontPorch + V_ViewWindow - 1) then
                O_Vsync <= '1';
                V_Color_Enable <= '0';
            elsif V_Count <= (V_TotalCount - V_BackPorch - 1) then
                O_Vsync <= '0';
                V_Color_Enable <= '0';
            elsif V_Count <= (V_TotalCount - 1) then
                O_Vsync <= '1';
                V_Color_Enable <= '0';
            else
                V_Count <= 0;
            end if;
        elsif H_Count <= (H_TotalCount - 1) then
            O_Hsync <= '1';
            H_Color_Enable <= '0';
            if V_Count <= (V_ViewWindow - 1) then
                O_Vsync <= '1';
                V_Color_Enable <= '1';
            elsif V_Count <= (V_FrontPorch + V_ViewWindow - 1) then
                O_Vsync <= '1';
                V_Color_Enable <= '0';
            elsif V_Count <= (V_TotalCount - V_BackPorch - 1) then
                O_Vsync <= '0';
                V_Color_Enable <= '0';
            elsif V_Count <= (V_TotalCount - 1) then
                O_Vsync <= '1';
                V_Color_Enable <= '0';
            else
                V_Count <= 0;
            end if;
        else
            H_Count <= 0;
            V_Count <= V_Count + 1;
        end if;
    end if;
end process;


process(H_Color_Enable, V_Color_Enable)
begin

Color_Enable <= H_Color_Enable AND V_Color_Enable;

    if Color_Enable = '1' then
        O_Red <= I_Red;
        O_Green <= I_Green;
        O_Blue <= I_Blue;
    else
        O_Red <= (others => '0');
        O_Green <= (others => '0');
        O_Blue <= (others => '0');
    end if;
end process;

O_HCount <= H_Count;
O_VCount <= V_Count;

end Behavioral;
