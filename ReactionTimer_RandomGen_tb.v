// ReactionTimer_RandomGen_tb.v
// Testbench integrating ReactionTimer and RandomGen modules
// Tests system with pseudo-random wait times and reaction measurement

module ReactionTimer_RandomGen_tb();
    reg Clk;
    reg Rst;
    reg Start;
    reg LCDAck;

    wire [12:0] RandomValue;
    wire [7:0] LED;
    wire [9:0] ReactionTime;
    wire Cheat;
    wire Slow;
    wire Wait;
    wire LCDUpdate;

    // Instantiate RandomGen
    RandomGen RandomGen_1(
        .Clk(Clk),
        .Rst(Rst),
        .RandomValue(RandomValue)
    );

    // Instantiate ReactionTimer
    ReactionTimer ReactionTimer_1(
        .Clk(Clk),
        .Rst(Rst),
        .Start(Start),
        .LED(LED),
        .ReactionTime(ReactionTime),
        .Cheat(Cheat),
        .Slow(Slow),
        .Wait(Wait),
        .RandomValue(RandomValue),
        .LCDUpdate(LCDUpdate),
        .LCDAck(LCDAck)
    );

    // Generate clock
    initial Clk = 0;
    always #500000 Clk = ~Clk;

    // Task: simulate pressing Start button
    task press_start; 
        begin 
            Start = 1; 
            #150000000; 
            Start = 0; 
            #1000000; 
        end 
    endtask

    // Task: simulate LCD handshake
    task lcd_handshake; 
        begin 
            wait(LCDUpdate == 1);  
            #1000000; 
            LCDAck = 1; 
            wait(LCDUpdate == 0); 
            #1000000; 
            LCDAck = 0; 
        end 
    endtask

    initial begin
        // Reset sequence
        Rst = 1; Start = 0; LCDAck = 0; 
        #2000000; 
        Rst = 0; 
        #2000000;

        // Test 1: Normal reaction
        press_start(); 
        lcd_handshake();
        wait(LED == 8'hFF); 
        #50000000; 
        press_start(); 
        lcd_handshake();
        #10000000; 

        // Test 2: Consecutive measurement
        press_start(); 
        lcd_handshake();
        wait(LED == 8'hFF);
        #40000000; 
        press_start(); 
        lcd_handshake();
        #10000000; 

        // Test 3: Cheat detection
        press_start(); 
        lcd_handshake();
        #10000000; 
        press_start(); 
        lcd_handshake();
        #50000000; 

        // Test 4: Slow response
        press_start(); 
        lcd_handshake();
        wait(LED == 8'hFF);
        #600000000; 
        press_start(); 
        lcd_handshake();

        #5000000;
        $finish;
    end
endmodule
