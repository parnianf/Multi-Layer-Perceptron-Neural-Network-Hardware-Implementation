library verilog;
use verilog.vl_types.all;
entity AdderTree is
    port(
        in1             : in     vl_logic_vector(14 downto 0);
        in2             : in     vl_logic_vector(14 downto 0);
        in3             : in     vl_logic_vector(14 downto 0);
        in4             : in     vl_logic_vector(14 downto 0);
        in5             : in     vl_logic_vector(14 downto 0);
        in6             : in     vl_logic_vector(14 downto 0);
        in7             : in     vl_logic_vector(14 downto 0);
        in8             : in     vl_logic_vector(14 downto 0);
        res             : out    vl_logic_vector(20 downto 0)
    );
end AdderTree;
