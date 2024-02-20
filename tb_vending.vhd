library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity tb_vending is
end entity;


architecture Behavior of tb_vending is  
    component vending is
        port (
        clk                 : in std_logic;
        Coin_in             : in std_logic_vector(1 downto 0);
        ticket              : in std_logic_vector(1 downto 0);
        Submit              : in std_logic;
        T5_out,T4_out,T15_out : out std_logic;
        value               :out integer range 0 to 100000
    );      
    end component;

    signal    clk                 : std_logic := '0';
    signal    Coin_in             : std_logic_vector(1 downto 0);
    signal    ticket              : std_logic_vector(1 downto 0);
    signal    Submit              : std_logic;
    signal    T5_out,T4_out,T15_out: std_logic;
    signal    value               :integer range 0 to 100000;

begin
    uut:vending port map(
    clk => clk,
    Coin_in => Coin_in,
    ticket => ticket,
    Submit => Submit,
    T5_out => T5_out,
    T4_out => T4_out,
    T15_out => T15_out,
    value => value
);
clk <= not clk after 5 ns;

process
begin
    wait for 10 ns ;
        Coin_in <= "10";
    wait for 10 ns ;
        Coin_in <= "00";


    wait for 10 ns ;
        Coin_in <=  "10";
    wait for 10 ns ;
        Coin_in <= "00";
    

    wait for 15 ns ;
        Coin_in <= "10";
    wait for 10 ns ;
        Coin_in <= "00";


    wait for 10 ns ;
        Coin_in <= "10";
    wait for 10 ns ;
        Coin_in <= "00"; 

    
    wait for 10 ns ;
        ticket <= "01";
    wait for 10 ns ;
        ticket <= "00";



    wait for 10 ns ;
        Submit <= '1';
    wait for 15 ns ;
        Submit <= '0';


    wait;
    end process;
end architecture;
