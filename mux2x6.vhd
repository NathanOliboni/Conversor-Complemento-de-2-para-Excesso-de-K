library ieee;
use ieee.std_logic_1164.all;
  
        --multiplexador de 2 canais com 6 bits por canal 
entity mux2x6 is
    port (
        c0  : in std_logic_vector(4 downto 0);
        c1  : in std_logic_vector(4 downto 0);
        sel : in std_logic;
        z   : out std_logic_vector(4 downto 0)
    );
end mux2x6;

architecture comuta of mux2x6 is
begin
        --atribuição condicional
    z <= c0 when sel = '0' else
    c1 when sel = '1' else (others => 'Z'); --Z = Alta impedância onde se assume qualquer valor

end architecture;
