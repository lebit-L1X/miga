
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;  -- Use numeric_std for signed and unsigned arithmetic

entity my_loop_signal is
port (
    input_n : in std_logic_vector(2 downto 0);
    input_l : in std_logic_vector(2 downto 0);
    output_h : out std_logic_vector(2 downto 0)
);
end entity;

architecture rtl of my_loop_signal is
    signal mult: signed(2 downto 0) := "000";
    signal n_int: integer := 0;
begin
process (input_n, input_l)

begin
    n_int <= conv_integer(signed(input_n));  

    for k in 0 to n_int-1 loop
        mult <= mult + signed(input_l);
    end loop;

    output_h <= std_logic_vector(mult);
end process;
end architecture;
