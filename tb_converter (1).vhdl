entity tb_converter is

end entity;

architecture inferno of tb_converter is
	component mux2x5 is
		port(
			c0 : in bit_vector(4 downto 0);
			c1 : in bit_vector(4 downto 0);
			sel: in bit;
			z  : out bit_vector(4 downto 0)
		);
	end component;

	component demux2x5 is
		port(
			z  : in bit_vector(4 downto 0);
			sel: in bit;
			d0 : out bit_vector(4 downto 0);
			d1 : out bit_vector(4 downto 0)
		);
	end component;

	component converter is
		port(
			b  : in bit_vector(3 downto 0);
			ek : out bit_vector(3 downto 0);
			err: out bit
		);
	end component;
	
	signal sc0, sc1, sz, sd0, sd1 : bit_vector(4 downto 0);
	signal sb, sek : bit_vector(3 downto 0);
	signal ssel, serr : bit;
	signal ssaidac2, ssaidaek : bit_vector(3 downto 0);
	signal ssaidaerr, ssaidasinal : bit;
	
begin
	
	u_mux2x5 : mux2x5 port map(sc0, sc1, ssel, sz);
	u_demux2x5 : demux2x5 port map(sz, ssel, sd0, sd1);
	u_converter : converter port map(sb, sek, serr);
	
	sc0(3 downto 0) <= sb;
	sc0(4) <= '0';
	sc1(3 downto 0) <= sek;
	sc1(4) <= serr;
	ssaidac2    <= sd0(3 downto 0);
	ssaidasinal <= sd0(4);
	ssaidaek    <= sd1(3 downto 0);
	ssaidaerr   <= sd1(4);
	
	u_teste : process
	begin
	
	sb <= "0000";
	ssel <= '1';
	wait for 10 ns;
	
	ssel <= '0';
	wait for 10 ns;
	
	sb <= "1000";
	ssel <= '1';
	wait for 10 ns;
	
	ssel <= '0';
	wait for 10 ns;
	
	sb <= "0101";
	ssel <= '1';
	wait for 10 ns;
	
	ssel <= '0';
	wait for 10 ns;
	
	wait;
	end process;
	
end architecture;