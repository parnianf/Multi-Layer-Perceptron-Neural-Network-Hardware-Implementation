library verilog;
use verilog.vl_types.all;
entity Datapath is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start_pu        : in     vl_logic;
        ld_hidden_layer : in     vl_logic_vector(3 downto 0);
        ld_output_layer : in     vl_logic_vector(1 downto 0);
        pixels          : in     vl_logic_vector(495 downto 0);
        mnist_class     : out    vl_logic_vector(3 downto 0);
        ready_8_pu      : out    vl_logic
    );
end Datapath;
