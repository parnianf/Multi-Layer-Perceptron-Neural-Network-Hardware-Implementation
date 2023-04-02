library verilog;
use verilog.vl_types.all;
entity PU_Controller is
    generic(
        READ_DATA       : vl_logic_vector(1 downto 0) := (Hi0, Hi0);
        MULTIPLY        : vl_logic_vector(1 downto 0) := (Hi0, Hi1);
        ADD             : vl_logic_vector(1 downto 0) := (Hi1, Hi0);
        WRITE_REGISTER  : vl_logic_vector(1 downto 0) := (Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        round           : out    vl_logic_vector(3 downto 0);
        ld              : out    vl_logic;
        rst_acc         : out    vl_logic;
        ready           : out    vl_logic;
        mult_done       : out    vl_logic;
        read_data_reg_ld: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of READ_DATA : constant is 2;
    attribute mti_svvh_generic_type of MULTIPLY : constant is 2;
    attribute mti_svvh_generic_type of ADD : constant is 2;
    attribute mti_svvh_generic_type of WRITE_REGISTER : constant is 2;
end PU_Controller;
