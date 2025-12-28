// RandomGen_tb.v
// Testbench for RandomGen module
// Verifies pseudo-random wait time generation and wrap-around behavior

module RandomGen_tb();
    reg Clk;
    reg Rst;
    wire [12:0] RandomValue;

    // Instantiate RandomGen
    RandomGen RandomGen_1(
        .Clk(Clk),
        .Rst(Rst),
        .RandomValue(RandomValue)
    );

    // Generate clock: toggle every 500 time units
    initial begin
        Clk = 0;
        forever #500 Clk = ~Clk;
    end

    initial begin
        // Apply reset
        Rst = 1;
        #2000;
        Rst = 0;

        // Let simulation run to observe RandomValue incrementing and wrapping
        #2100000;
        $finish;
    end
endmodule
