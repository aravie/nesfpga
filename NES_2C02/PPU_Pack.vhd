library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


package PPU_Pack is
  
component TileFetcher is
port (
		CLK : in std_logic;
		CE : in std_logic;
		RSTN : in std_logic;

		HPOS : in integer;
		VPOS : in integer;

		VRAM_Address : out unsigned(13 downto 0);
		VRAM_Data : in std_logic_vector(7 downto 0);

		HorizontalScrollOffset : in unsigned(7 downto 0);
		VerticalScrollOffset : in unsigned(7 downto 0);
		PatternTableAddressOffset : in std_logic;
		NameTableAddressOffset : in std_logic_vector(1 downto 0);

		TileColor : out unsigned(3 downto 0)
);
end component;

component SpriteSelector is
  port (
    CLK : in std_logic;
    CE : in std_logic;
    RSTN : in std_logic;
        
    HPOS : in integer range -42 to 298;
    VPOS : in integer range 0 to 261;
    
		PatternTableAddressOffset : in std_logic;
    
    SpriteColor : out unsigned(3 downto 0);
    SpriteForegroundPriority : out std_logic;
    SpriteIsPrimary : out std_logic;
        
    SpriteOverflowFlag : out std_logic;
        
    VRAM_Address : out unsigned(13 downto 0);
    VRAM_Data : in std_logic_vector(7 downto 0);
        
    SpriteRAM_Address : in unsigned(7 downto 0);
    SpriteRAM_Data_in : in std_logic_vector(7 downto 0);
    SpriteRAM_Data_out : out std_logic_vector(7 downto 0);
    SpriteRAM_WriteEnable : in std_logic  
  );
end component;
end package;