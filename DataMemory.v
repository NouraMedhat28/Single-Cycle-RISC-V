module DataMemory #(
    parameter  Data_Memory_Width = 'd32,
               Data_Memory_Depth = 'd100
) (
    input   wire   [Data_Memory_Width-1:0]   A_Data,
    input   wire                             CLK,
    input   wire                             RST,
    input   wire                             WE,
    input   wire   [Data_Memory_Width-1:0]   WD,
    output  reg    [Data_Memory_Width-1:0]   RD
);

integer i;

reg [Data_Memory_Width-1:0]  Data_Mem  [0:Data_Memory_Depth-1];

//Read combinationally
always @(*) begin
    RD = Data_Mem[A_Data];
end

  

always @(posedge CLK or negedge RST) begin
    //Asynchronous Reset
    if(!RST) begin 
        for (i =0; i<Data_Memory_Depth; i = i+1 ) begin
        Data_Mem [i] <= 'b0;
      end
       
    end

    else if (WE=='b1) begin
        Data_Mem[A_Data] <= WD;
    end
   
end
    
endmodule
