

package SimpleCPU;
import ClientServer::*;
import GetPut::*;
import Connectable::*;
import FIFO::*;
import BRAMFIFO::*;
import FIFO::*;
import FIFOF::*;
import Vector::*;
import GetPut::*;
import ClientServer::*;
import Assert::*;
import BRAM::*;
import DefaultValue::*;



import GetPut::*;
import MemoryInterface::*;
import RegisterFile::*;
import InstructionDecoder::*;
import SimpleCPU_Parameters::*;
import ClockReset::*;
typedef struct {
    OpcodeT opcode;
    UInt#(8) operand1;
    UInt#(8) operand2;
} Instruction;

// Define an interface for the CPU



// Define the SimpleCPU module
module mkSimpleCPU#(Integer memSize)(Instruction_IFC);
    
    // Instantiate memory interface
    Memory_IFC memoryInterface <- mkMemory;

    // Instantiate register file
    Register_IFC registerFile <- mkRegister;

    // Instantiate clock and reset
    Clock clk <- mkClockReset;
    Reset rst <- mkAsyncReset;

    // Instantiate instruction decoder
    Instruction_IFC instructionDecoder <- mkInstructionDecoder;

    // Program counter
    Reg#(UInt#(8)) pc <- mkReg(0);

    // Method for fetch-decode-execute cycle
    method Action fetchDecodeExecute;
        // Fetch instruction from memory based on the program counter
        Instruction_IFC instruction = memoryInterface.read(pc);
    
        // Decode instruction using the instruction decoder
        instructionDecoder.fetchInstruction(instruction);
    
        // Execute decoded instruction
        instructionDecoder.executeInstruction;
    
        // Increment program counter
        pc <= pc + 1;
    endmethod

    // Method to execute ADD operation
    method Action executeAdd;
        // Read DATA1 and DATA2 from memory
        UInt#(8) data1 = memoryInterface.read(1);
        UInt#(8) data2 = memoryInterface.read(2);
        
        // Perform ADD operation and store result in memory
        UInt#(8) result = data1 + data2;
        memoryInterface.write(0, result); // Store result at address 0
        
        // Set done signal
        done;
    endmethod

    // Methods to execute other operations (SUB, AND, OR, XOR) similarly

    // Output port for dataOut
    method ActionValue#(UInt#(8)) dataOut;
        return memoryInterface.read(0);
    endmethod

    // Output port for done signal
    method Action done;
        // Set done signal
        done;
    endmethod

endmodule

endpackage
