library ieee;
use ieee.numeric_std.all
use ieee.std_logic_1164.all;

entity Vending is 
    port (
        clk                 : in std_logic;
        Coin_in             : in std_logic_vector(2 downto 0);
        ticket              : in std_logic_vector(2 downto 0);
        Submit              : in std_logic;
        T5_out,T4_out,T15_out,Remaining_money : out std_logic;
        value               :out integer range 0 to 100000
    );
end entity Vending;
architecture Behavior of Vending is
signal currentMoney : integer range 0 to 100000 := 0;

begin 
    
    process (clk)
    begin 
        T5_out <= '0' ;
        T4_out <= '0'';
        T15_out <= '0' ;
        value <= '0';
        if ticket = "00" then
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
            currentMoney <= currentMoney + 500;
        elsif Coin_in = "10" then 
            currentMoney <= currentMoney + 1000;
        elsif Submit = '1' then 
            value <= temp;
            temp <= '0';
        end if;
    end process;
end architecture;