library verilog;
use verilog.vl_types.all;
entity Controller is
    generic(
        IDLE            : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi0);
        READ_DATA       : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi1);
        HIDDEN_LAYER_0  : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi0);
        HIDDEN_LAYER_1  : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi1);
        HIDDEN_LAYER_2  : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi0);
        HIDDEN_LAYER_3  : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi1);
        OUTPUT_LAYER_0  : vl_logic_vector(2 downto 0) := (Hi1, Hi1, Hi0);
        OUTPUT_LAYER_1  : vl_logic_vector(2 downto 0) := (Hi1, Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        ready_8_pu      : in     vl_logic;
        start_pu        : out    vl_logic;
        test_index      : out    vl_logic_vector(9 downto 0);
        ld_hidden_layer : out    vl_logic_vector(3 downto 0);
        ld_output_layer : out    vl_logic_vector(1 downto 0);
        single_test_done: out    vl_logic;
        done            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 2;
    attribute mti_svvh_generic_type of READ_DATA : constant is 2;
    attribute mti_svvh_generic_type of HIDDEN_LAYER_0 : constant is 2;
    attribute mti_svvh_generic_type of HIDDEN_LAYER_1 : constant is 2;
    attribute mti_svvh_generic_type of HIDDEN_LAYER_2 : constant is 2;
    attribute mti_svvh_generic_type of HIDDEN_LAYER_3 : constant is 2;
    attribute mti_svvh_generic_type of OUTPUT_LAYER_0 : constant is 2;
    attribute mti_svvh_generic_type of OUTPUT_LAYER_1 : constant is 2;
end Controller;
