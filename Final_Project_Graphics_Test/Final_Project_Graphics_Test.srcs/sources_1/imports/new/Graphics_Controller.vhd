----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2021 01:49:39 PM
-- Design Name: 
-- Module Name: Graphics_Controller - Behavioral
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

entity Graphics_Controller is
    Port ( I_Left : in STD_LOGIC;
           I_Right : in STD_LOGIC;
           I_Up : in STD_LOGIC;
           I_Down : in STD_LOGIC;
           I_Reset : in STD_LOGIC;
           I_HCount : in INTEGER;
           I_VCount : in INTEGER;
           O_Red : out STD_LOGIC_VECTOR (3 downto 0);
           O_Green : out STD_LOGIC_VECTOR (3 downto 0);
           O_Blue : out STD_LOGIC_VECTOR (3 downto 0));
end Graphics_Controller;

architecture Behavioral of Graphics_Controller is

Constant H_Window : INTEGER := 640;
Constant V_Window : INTEGER := 480;

Constant Box_Length : INTEGER := 50;
Constant Box_Height : INTEGER := 50;

Constant Step_Size : INTEGER := 10;

signal H_Location : INTEGER := 20;
signal V_Location : INTEGER := 20;

signal Last_Up_State : STD_Logic := '0';
signal Last_Down_State : STD_Logic := '0';
signal Last_Left_State : STD_Logic := '0';
signal Last_Right_State : STD_Logic := '0';

begin

process (I_Left, I_Right, I_Up, I_Down, I_Reset)
begin
    if I_Reset = '1' then
        H_Location <= 0;
        V_Location <= 0;
    else
        if (I_Left = '1' AND Last_Left_State = '0') then
            if H_Location >= (0 + Step_Size) then
                H_Location <= H_Location - Step_Size;            
            end if;
        end if;
        Last_Left_State <= I_Left;    
        
        if (I_Right = '1' AND Last_Right_State = '0') then
            if H_Location <= (H_Window - (Step_Size + Box_Length)) then     
                H_Location <= H_Location + Step_Size;          
            end if;  
        end if;  
        Last_Right_State <= I_Right;  
        
        if (I_Up = '1' AND Last_Up_State = '0') then
            if V_Location >= (0 + Step_Size) then    
                V_Location <= V_Location - Step_Size;           
            end if;
        end if;
        Last_Up_State <= I_Up;
        
        if (I_Down = '1' AND Last_Down_State = '0') then
            if V_Location <= (V_Window - (Step_Size + Box_Height)) then 
                V_Location <= V_Location + Step_Size;              
            end if;
        end if;
        Last_Down_State <= I_Down;
    end if;
end process;
    
process (I_HCount, I_VCount)
begin        
    if I_HCount >= H_Location then
        if I_HCount <= (H_Location + Box_Length) then
            if I_VCount >= V_Location then
                if I_VCount <= (V_Location + Box_Height) then
                    O_Red <= (others => '1');
                    O_Green <= (others => '1');
                    O_Blue <= (others => '1');
                else
                    O_Red <= (others => '0');
                    O_Green <= (others => '0');
                    O_Blue <= (others => '0');
                end if;                
            else
                O_Red <= (others => '0');
                O_Green <= (others => '0');
                O_Blue <= (others => '0');
            end if;            
        else
            O_Red <= (others => '0');
            O_Green <= (others => '0');
            O_Blue <= (others => '0');
        end if;
    else
        O_Red <= (others => '0');
        O_Green <= (others => '0');
        O_Blue <= (others => '0');
    end if;  
end process;

end Behavioral;
