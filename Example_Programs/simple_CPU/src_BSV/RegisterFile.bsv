package RegisterFile;
    interface Register_IFC;
        method ActionValue#(UInt#(8)) read(UInt#(8) address);
        method Action write(UInt#(8) address, UInt#(8) data);
    endinterface
    module mkRegister (Register_IFC);
        
        // Define register storage
        Reg#(UInt#(8)) registers[8]; // Assuming 8 data registers
        
        // Implement read method
        method ActionValue#(UInt#(8)) read(UInt#(8) address);
            return registers[address];
        endmethod
        
        // Implement write method
        method Action write(UInt#(8) address, UInt#(8) data);
            registers[address] <= data;
        endmethod
    endmodule
endpackage : RegisterFile