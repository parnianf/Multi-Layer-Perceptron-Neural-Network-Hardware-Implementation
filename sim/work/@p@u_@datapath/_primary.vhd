library verilog;
use verilog.vl_types.all;
entity PU_Datapath is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ld              : in     vl_logic;
        acc_rst         : in     vl_logic;
        read_data_reg_ld: in     vl_logic;
        inputs_neuron   : in     vl_logic_vector(495 downto 0);
        weights_neuron  : in     vl_logic_vector(495 downto 0);
        bias            : in     vl_logic_vector(7 downto 0);
        round           : in     vl_logic_vector(3 downto 0);
        mult_done       : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end PU_Datapath;
