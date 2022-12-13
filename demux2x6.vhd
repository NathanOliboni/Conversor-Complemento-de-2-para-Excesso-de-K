library ieee;
use ieee.std_logic_1164.all;

        --  Demultiplexador de 2 canais com 6 bits por canal

entity demux2x6 is
    port(
        z0: out std_logic_vector(4 downto 0);
        z1: out std_logic_vector(4 downto 0);
        sel: in std_logic;
        c: in std_logic_vector(4 downto 0)
        
    
    );
end entity;

architecture descomutar of demux2x6 is
begin
    -- atribuição condicional
    z0 <= c when sel = '0';
    z1 <= c when sel = '1';

end architecture;
