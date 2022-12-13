library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity conversor is
    port (
        conv_in : std_logic_vector(4 downto 0); --entrando em bit de Complemento de 2 
        conv_out: std_logic_vector(4 downto 0); --saindo em bit de Excesso de K
        error_out:std_logic;
    );
end conversor;

architecture converte of conversor is
    signal z:std_logic_vector(4 downto 0);
    signal err:std_logic;

begin
    conv_out(4) => (not conv_in(4) and conv_in(1)) or (not conv_in(4) and conv_in(2)) or(not conv_in(4) and conv_in(3)) or (not conv_in(4) and conv_in(0));
    conv_out(3) => (conv_in(2) and conv_in(3)) or (conv_in(3) and conv_in(1)) or (conv_in(0) and conv_in(3));
    conv_out(2) => (conv_in(1) and conv_in(2)) or (conv_in(0) and conv_in(2)) or (not conv_in(2) and not conv_in(1) and not conv_in(0));
    conv_out(1) => (conv_in(1) and conv_in(0)) or (not conv_in(1) and not conv_in(0));
    conv_out(0) => not conv_in(0);
    error_out   => '1' when conv_in(4 downto 0) = "10000" else '0';

end architecture;
