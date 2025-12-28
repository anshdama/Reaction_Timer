// ClkDiv.v
// Divides system clock to create 1ms timing signal for reaction measurement

module ClkDiv(
    input Clk,      
    input DivRst,   
    output reg ClkMS = 0   
);

parameter DividerCount = 50000;  // Adjust to get 1ms period

reg [26:0] counter = 0;

always @(posedge Clk) begin
    if (DivRst == 1) begin
        counter <= 0;
        ClkMS <= 0;
    end
    else begin
        if (counter == DividerCount - 1) begin
            counter <= 0;
            ClkMS <= ~ClkMS;  // Toggle output clock
        end
        else begin
            counter <= counter + 1;
        end
    end
end

endmodule
