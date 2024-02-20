library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity vending is 
    port (
        clk                 : in std_logic;
        Coin_in             : in std_logic_vector(1 downto 0);
        ticket              : in std_logic_vector(1 downto 0);
        Submit              : in std_logic;
        T5_out,T4_out,T15_out : out std_logic;
        value               :out integer range 0 to 100000
    );
end entity vending;

architecture Behavior of vending is

signal temp : integer range 0 to 100000 := 0;

begin 
  
    process (clk)
    begin 
     if (clk'event and clk = '1') then
        T5_out <= '0' ;
        T4_out <= '0';
        T15_out <= '0' ;
        value <= 0;
        if Submit = '1' then 
            value <= temp;
            temp <= 0;
        elsif ticket = "11" then
            if temp >= 500 then 
                temp <= temp - 500;
                T5_out <= '1';
            end if;
        elsif ticket = "01" then
            if temp >= 1500 then
                temp <= temp - 1500;
                T15_out <= '1';
            end if;
        elsif ticket = "10" then
            if temp >= 4000 then
                temp <= temp - 4000;
                T4_out <= '1';
            end if;
        elsif Coin_in = "01" then 
            temp <= temp + 500;
        elsif Coin_in = "10" then 
            temp <= temp + 1000;
        end if;
      end if ;
    end process;
end architecture;
