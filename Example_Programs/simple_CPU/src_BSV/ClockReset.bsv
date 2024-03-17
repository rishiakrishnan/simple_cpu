package ClockReset;

// Importing necessary modules
import GetPut::*;

// Define the clock interface
interface ClockReset_IFC;
    // Output port for clock signal
    method Action clock;
    // Output port for reset signal
    method Action reset;
endinterface

// Define the module to create clock and reset signals
module mkClockReset(ClockReset_IFC);
    // Declare the clock signal
    Reg#(Bool) clk_inst <- mkRegU;
    // Declare the reset signal
    

    // Method to toggle the clock signal
    method Action clk;
        clk_inst <= ~clk_inst; // Toggle the clock signal
    endmethod

    // Method to drive the reset signal
    method Action reset;
        Reg#(Bool) resetSignal_inst <- mkRegU(False);// Set the reset signal low
    endmethod
endmodule

endpackage
