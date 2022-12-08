--ghdl -a (Comando para analisar o arquivo)
--ghdl -r "nome do arquivo sem .vhld" --stop-time=20ns --wave="nome do arquivo".ghw

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_mux2x6 is
end entity;

architecture comuta of tb_mux2x6 is
    component mux2x6 is
        port(
            c0  : std_logic_vector(4 downto 0);
            c1  : std_logic_vector(4 downto 0);
            sel : std_logic;
            z   : std_logic_vector(4 downto 0)
        );
    end component;

    signal sc0, sc1, sz : std_logic_vector(4 downto 0);
   
    signal ssel : std_logic;
begin

    u_mux2x6 : mux2x6 port map
    (   sc0,
        sc1,
        ssel,
        sz
    );

    u_tb : process
    begin
        sc0 <= "00000";
        sc1 <= "01111";

        ssel <= '0';
        wait for 10 ns;

        wait;
    end process;

end architecture;