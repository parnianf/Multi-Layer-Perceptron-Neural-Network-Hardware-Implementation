library verilog;
use verilog.vl_types.all;
entity PU is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        inputs          : in     vl_logic_vector(495 downto 0);
        weights         : in     vl_logic_vector(495 downto 0);
        bias            : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0);
        ready           : out    vl_logic
    );
end PU;
