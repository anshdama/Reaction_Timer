// ReactionTimer_tb.v
// Testbench for ReactionTimer module
// Simulates normal, cheat, consecutive, and slow reactions

module ReactionTimer_tb();
    reg Clk;
    reg Rst;
    reg Start;
    reg [12:0] RandomValue;
    reg LCDAck;

    wire [7:0] LED;
    wire [9:0] ReactionTime;
    wire Cheat;
    wire Slow;
    wire Wait;
    wire LCDUpdate;

    // Instantiate ReactionTimer
    ReactionTimer ReactionTimer_1 (
        .Clk(Clk), .Rst(Rst), .Start(Start),
        .LED(LED), .ReactionTime(ReactionTime), 
        .Cheat(Cheat), .Slow(Slow), .Wait(Wait),
        .RandomValue(RandomValue), .LCDUpdate(LCDUpdate), .LCDAck(LCDAck)
    );

    initial Clk = 0;
    always #500000 Clk = ~Clk; // Generate clock

    // Task: Simulate pressing Start button
    task press_start; begin 
        Start = 1; 
        #150000000; 
        Start = 0; 
        #1000000; 
    end endtask

    // Task: Simulate LCD handshake
    task lcd_handshake; begin 
        wait(LCDUpdate == 1); 
        #1000000; 
        LCDAck = 1; 
        wait(LCDUpdate == 0); 
        #1000000; 
        LCDAck = 0; 
    end endtask

    initial begin
        // Reset sequence
        Rst = 1; Start = 0; RandomValue = 0; LCDAck = 0; 
        #2000000; Rst = 0; #2000000;

        // Test cases
        // 1. Normal reaction
        RandomValue = 13'd10; press_start(); lcd_handshake();
        wait(LED == 8'hFF); #50000000; press_start(); lcd_handshake(); #100000000;

        // 2. Consecutive measurement
        RandomValue = 13'd15; press_start(); lcd_handshake();
        wait(LED == 8'hFF); #30000000; press_start(); lcd_handshake(); #100000000;

        // 3. Cheat detection
        RandomValue = 13'd100; press_start(); lcd_handshake();
        #10000000; press_start(); lcd_handshake(); #100000000;

        // 4. Slow response
        RandomValue = 13'd10; press_start(); lcd_handshake();
        wait(LED == 8'hFF); #600000000; press_start(); lcd_handshake();

        $finish;
    end
endmodule
