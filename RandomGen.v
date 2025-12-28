// RandomGen.v
// Generates pseudo-random wait time for reaction timer
// RandomValue cycles between 1000 and 3000 to simulate unpredictability

module RandomGen(
    input Clk,           
    input Rst,           
    output reg [12:0] RandomValue  
);

always @(posedge Clk) begin
    if (Rst == 1) begin
        RandomValue <= 13'd1000;  // Initialize to minimum
    end
    else begin
        if (RandomValue >= 13'd3000) begin
            RandomValue <= 13'd1000;  // Wrap around
        end
        else begin
            RandomValue <= RandomValue + 1;  
        end
    end
end

endmodule
