library verilog;
use verilog.vl_types.all;
entity Adder is
    port(
        in1             : in     vl_logic_vector(20 downto 0);
        in2             : in     vl_logic_vector(20 downto 0);
        \out\           : out    vl_logic_vector(20 downto 0)
    );
end Adder;
