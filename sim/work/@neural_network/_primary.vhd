library verilog;
use verilog.vl_types.all;
entity Neural_network is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        mnist_class     : out    vl_logic_vector(3 downto 0);
        single_test_done: out    vl_logic;
        done            : out    vl_logic
    );
end Neural_network;
