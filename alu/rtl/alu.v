module alu(
input [7:0] a,
input [7:0] b,
input [2:0] ctrl,
output reg [7:0] y,
output reg zero,
output reg negative,
output reg carry
);
reg[8:0] result;
reg [8:0] sum;
reg [8:0] diff;

always @(*) begin
result= 9'b0;
carry=1'b0;
negative =1'b0;
zero =1'b0;
sum=9'b0;
diff=9'b0;

case(ctrl)
3'b000 :begin
y= a&b;
end

3'b001: begin
y= a|b;
end

3'b010: begin
sum = a+b;
y=sum[7:0];
carry=sum[8];
end

3'b110: begin
diff={1'b0,a}-{1'b0,b};
y=diff[7:0];
carry=diff[8];
end

default: begin
y=8'b00000000;
end
endcase

if (ctrl == 3'b010) bgein
zero =(y==8'b00000000);
negative =sum[7];
end
else if(ctrl == 3'b110) begin
zero =(y==8'b00000000);
negative =diff[7];
end
end

endmodule
