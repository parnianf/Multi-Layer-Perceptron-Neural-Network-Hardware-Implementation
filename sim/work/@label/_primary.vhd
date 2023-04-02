library verilog;
use verilog.vl_types.all;
entity \Label\ is
    port(
        output_layer_out: in     vl_logic_vector(79 downto 0);
        mnist_class     : out    vl_logic_vector(3 downto 0)
    );
end \Label\;
