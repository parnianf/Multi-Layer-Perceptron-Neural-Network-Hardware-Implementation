library verilog;
use verilog.vl_types.all;
entity Multiplier is
    port(
        in1             : in     vl_logic_vector(7 downto 0);
        in2             : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(14 downto 0)
    );
end Multiplier;
