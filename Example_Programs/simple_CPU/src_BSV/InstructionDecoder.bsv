import GetPut::*;
import MemoryInterface::*;

typedef UInt#(3) OpcodeT;
// Define a struct for representing instructions
typedef struct {
    OpcodeT opcode;
    UInt#(8) operand1;
    UInt#(8) operand2;
} Instruction;

OpcodeT opcodeAdd=3'd0;

interface Instruction_IFC;
    method Action fetchInstruction(Instruction instruction);
        method Action executeAdd;
    method ActionValue#(Bool) executeInstruction;
     // Add executeAdd method to the interface
endinterface

// Define the Instruction Decoder module
    module mkInstructionDecoder(Instruction_IFC);
        // Local constant to represent the opcode for ADD instruction
        
       
    
        // Method to fetch instruction and execute
        method Action fetchInstruction(Instruction instruction);
            // Implementation of fetchInstruction method
        endmethod
    
        // Method to execute the ADD instruction
        method Action executeAdd;
            $display("Executing ADD operation");
            // Implement the ADD operation here
        endmethod
    
        // Method to execute the instructions
        method ActionValue#(Bool) executeInstruction;
            // For simplicity, return True to indicate success
            return True;
        endmethod
    endmodule
    
    
