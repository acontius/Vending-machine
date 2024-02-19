library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
entity tb_vending is
end entity;

architecture Behavior of tb_vending is 
    signal    clk, RST            : std_logic;
    signal    Coin_in             : std_logic_vector(2 downto 0);
    signal    ticket              : std_logic_vector(2 downto 0);
    signal    Submit              : std_logic;
    signal    T5_out,T4_out,T15_out,Remaining_money : std_logic;
    signal    value               :integer range 0 to 100000;
begin

utt:Vending port map(
    clk => clk,
    RST => RST,
    Coin_in => Coin_in,
    ticket => ticket,
    Submit => Submit,
    T5_out => T5_out,
    T4_out => T4_out,
    T15_out => T15_out,
    Remaining_money => Remaining_money,
    value => value
);

clk <= not clk after 4 ns;

process
begin
    wait for 4 ns then
        Coin_in <= "01";
    wait for 10 ns then
        Coin_in <= "00";


    wait for 15 ns then
        Coin_in <=  "10";
    wait for 10 ns then
        Coin_in <= "00";
    

    wait for 15 ns then
        Coin_in <= "10";
    wait for 10 ns then
        Coin_in <= "00";


    wait for 15 ns then
        Coin_in <= "01";
    wait for 10 ns then
        Coin_in <= "00"; 

    
    wait for 15 ns then
        ticket <= "00";
    wait for 10 ns then
        ticket <= "00";


    wait for 15 ns then
        ticket <= "10";
    wait for 10 ns then
        ticket <= "00";


    wait for 15 ns then
        Submit <= '1';
    wait for 10 ns then
        Submit <= '0';


    wait;
    end process;
end architecture;