function [L4,DL4]=P4R(zita)
   NPI= length(zita);

   L4(1,1:NPI)=(4*zita.^3-4*zita.^2-zita+1).*zita/6;
   L4(2,1:NPI)=4*zita.*(-2*zita.^3+zita.^2+2*zita-1)/3;
   L4(3,1:NPI)=4*zita.^4-5*zita.^2+1;
   L4(4,1:NPI)=4*zita.*(-2*zita.^3-zita.^2+2*zita+1)/3;
   L4(5,1:NPI)=(4*zita.^3+4*zita.^2-zita-1).*zita/6;

   DL4(1,1:NPI)=(16*zita.^3-12*zita.^2-2*zita+1)/6;
   DL4(2,1:NPI)=(-32*zita.^3+12*zita.^2+16*zita-4)/3;
   DL4(3,1:NPI)=16*zita.^3-10*zita;
   DL4(4,1:NPI)=(-32*zita.^3-12*zita.^2+16*zita+4)/3;
   DL4(5,1:NPI)=(16*zita.^3+12*zita.^2-2*zita-1)/6;


end
