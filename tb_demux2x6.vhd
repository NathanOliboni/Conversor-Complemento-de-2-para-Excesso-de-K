--ghdl -a (Comando para analisar o arquivo)
--ghdl -r "nome do arquivo sem .vhld" --stop-time=20ns --wave="nome do arquivo".ghw

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_demux2x6 is
end entity;

architecture comuta of tb_demux2x6 is
    component demux2x6 is
        port(
            c0  : std_logic_vector(4 downto 0)
            c1  : std_logic_vector(4 downto 0)
            sel : std_logic;
            z   : std_logic_vector(4 downto 0)
        );
    end component;
    
    signal sc0, sc1, sz : std_logic_vector(4 downto 0);
    signal ssel : std_logic;

begin

    u_demux2x6 : demux2x6