// ClkDiv_tb.v
// Testbench for ClkDiv module
// Verifies correct 1ms output clock generation

module ClkDiv_tb();
    reg Clk;
    reg DivRst;
    wire ClkMS;

    // Instantiate ClkDiv
    ClkDiv ClkDiv_1(
        .Clk(Clk),
        .DivRst(DivRst),
        .ClkMS(ClkMS)
    );

    // Generate system clock
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk;
    end

    initial begin
        // Apply reset
        DivRst = 1;
        #100;
        DivRst = 0;

        // Let simulation run to check clock division
        #3000000;
        $finish;
    end
endmodule
