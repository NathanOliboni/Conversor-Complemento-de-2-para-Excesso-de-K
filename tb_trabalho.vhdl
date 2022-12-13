library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_trabalho is
end entity;

architecture converte of tb_trabalho is
  component mux2x6 is
    port (
        c0  : in std_logic_vector(4 downto 0);
        c1  : in std_logic_vector(4 downto 0);
        sel : in std_logic;
        z   : out std_logic_vector(4 downto 0)
    );
end component;

  component demux2x6 is
    port(
        s0: out std_logic_vector(4 downto 0);
        s1: out std_logic_vector(4 downto 0);
        sel: in std_logic;
        z: in std_logic_vector(4 downto 0)
    );
end component;

  component conversor is
    port (
        conv_in : std_logic_vector(4 downto 0);
        conv_out: std_logic_vector(4 downto 0);
        error_out:std_logic;
    );
end component;

signal sc0, sc1, ss0, ss1, sz: std_logic_vector(4 downto 0);
signal ssel, serror_out : std_logic;

begin
  u_mux2x6    : mux2x6 port map (sc0, sc1, ssel, sz);
  u_demux2x6  : demux2x6 port map (ss0, ss1, ssel, sz);
  u_conversor : conversor port map (sc0, sc1, serror_out);
  
  u_teste : process
    begin
    ssel<= '0';
    sc0 <= "00000";
    wait for 10 ns;
    sc0 <= "00001";
    wait for 10 ns;
    sc0 <= "00010";
    wait for 10 ns;
    
    ssel<= '1';
    wait for 10 ns;
    
