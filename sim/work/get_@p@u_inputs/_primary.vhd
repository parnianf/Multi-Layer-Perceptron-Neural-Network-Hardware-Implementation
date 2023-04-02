library verilog;
use verilog.vl_types.all;
entity get_PU_inputs is
    port(
        inputs_neuron   : in     vl_logic_vector(495 downto 0);
        weights_neuron  : in     vl_logic_vector(495 downto 0);
        round           : in     vl_logic_vector(3 downto 0);
        selected_inputs : out    vl_logic_vector(63 downto 0);
        selected_weights: out    vl_logic_vector(63 downto 0)
    );
end get_PU_inputs;
