import GetPut::*;
import Vector::*;
interface Memory_IFC;
    method UInt#(8) read(UInt#(8) address);
    method Action write(UInt#(8) address, UInt#(8) data);
endinterface

module mkMemory(Memory_IFC);
    // Define memory storage
    Reg#(UInt#(8)) memory[256];

    // Initialize memory to 0
    for (int i = 1; i < 256; i = i + 1) begin
        memory[i]<- mkReg(0);
    end

    // Implement logic to read data from memory at the specified address
    method UInt#(8) read(UInt#(8) address);
        return memory[address];
    endmethod

    // Implement logic to write data to memory at the specified address
    method Action write(UInt#(8) address, UInt#(8) data);
        memory[address] <= data;
    endmethod
endmodule