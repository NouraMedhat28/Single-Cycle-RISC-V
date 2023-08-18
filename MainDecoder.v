module MainDecoder  (
    input  wire   [6:0]  Decoder_Input,
    output reg    [1:0]  ImmSrc,
    output reg           MemWrite,
    output reg           Branch,
    output reg           ALUSrc,
    output reg           ResultSrc,
    output reg           RegWrite,
    output reg   [1:0]   ALUOp_MD
);


always @(*) begin
    case(Decoder_Input)

        //load word
        7'b000_0011 : begin
           RegWrite  = 1'b1;
           ImmSrc    = 2'b00;
           ALUSrc    = 1'b1;
           MemWrite  = 1'b0;
           ResultSrc = 1'b1;
           Branch    = 1'b0;
           ALUOp_MD  = 2'b00;
           
        end

        //store word
        7'b010_0011 : begin
           RegWrite  = 1'b0;
           ImmSrc    = 2'b01;
           ALUSrc    = 1'b1;
           MemWrite  = 1'b1;
           ResultSrc = 1'b0;
           Branch    = 1'b0;
           ALUOp_MD  = 2'b00;
        end

        //R Type
        7'b011_0011 : begin
           RegWrite  = 1'b1;
           ImmSrc    = 2'b00;
           ALUSrc    = 1'b0;
           MemWrite  = 1'b0;
           ResultSrc = 1'b0;
           Branch    = 1'b0;
           ALUOp_MD  = 2'b10;
        end

        //I Type
        7'b001_0011 : begin
           RegWrite  = 1'b1;
           ImmSrc    = 2'b00;
           ALUSrc    = 1'b1;
           MemWrite  = 1'b0;
           ResultSrc = 1'b0;
           Branch    = 1'b0;
           ALUOp_MD  = 2'b10;
        end

        //Branch 
        7'b110_0011 : begin
           RegWrite  = 1'b0;
           ImmSrc    = 2'b10;
           ALUSrc    = 1'b0;
           MemWrite  = 1'b0;
           ResultSrc = 1'b0;
           Branch    = 1'b1;
           ALUOp_MD  = 2'b01;
        end

        //Default
        default : begin
           RegWrite  = 1'b0;
           ImmSrc    = 2'b00;
           ALUSrc    = 1'b0;
           MemWrite  = 1'b0;
           ResultSrc = 1'b0;
           Branch    = 1'b0;
           ALUOp_MD  = 2'b00; 
        end
    endcase

end
    
endmodule