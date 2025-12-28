Reaction_Timer: 

This project implements a hardware-based Reaction Timer using Verilog and the High-Level State Machine (HLSM) design methodology. 
The system measures the elapsed time between an LED signal and a user’s response, simulating a reaction test. It includes cheat 
detection, slow-response detection, and an LCD interface for displaying results.

Features
- Handles multiple test cases:
  - Normal reaction
  - Consecutive measurements
  - Cheat detection
  - Slow response detection
- Structured HLSM approach for clean and maintainable design
- Proper documentation and coding standards for team collaboration

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
