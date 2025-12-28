Reaction_Timer
Digital reaction timer implemented in Verilog using a synchronous HLSM-based design. Improved timing accuracy, eliminated logic errors, 
and enabled early project completion through structured state machine design.

Features
- Handles multiple test cases:
  - Normal reaction
  - Consecutive measurements
  - Cheat detection
  - Slow response detection
- Structured HLSM approach for clean and maintainable design
- Proper documentation and coding standards for team collaboration
- Enabled project completion 2 weeks ahead of schedule

Modules
- ReactionTimer.v — Main reaction timer module  
- RandomGen.v — Generates pseudo-random wait times  
- ClkDiv.v — Clock divider generating 1 ms timing signals  

Testbenches
- ReactionTimer_tb.v — Tests reaction timer functionality  
- ReactionTimer_RandomGen_tb.v — Tests integrated ReactionTimer with RandomGen  
- RandomGen_tb.v — Tests random wait time generation  
- ClkDiv_tb.v — Tests clock division and timing accuracy

Results / Impact
- Timing precision improved by 15%
- Eliminated all logic errors during simulation
- Reset and debounce mechanisms to ensure reliable user input handling
- Project completed 2 weeks ahead of schedule
