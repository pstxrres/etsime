function [L5,DL5]=P5R(zita)
   NPI= length(zita);
   L5(1,1:NPI)=-625/768*((zita-1).*(zita.^2-1/25).*(zita.^2-9/25));
   DL5(1,1:NPI)=-625/768*(zita.^2-1/25).*(zita.^2-9/25)+2*zita.*(zita-1).*(zita.^2-9/25)+2*zita.*(zita-1).*(zita.^2-1/25));
   L5(2,1:NPI)=3125/768*((zita-3/5).*(zita.^2-1).*(zita.^2-1/25));
   DL5(2,1:NPI)=3125/768*((zita.^2-1).*(zita.^2-1/25)+2*zita.*(zita-3/5).*(zita.^2-1/25)+2*zita.*(zita-3/5).*(zita.^2-1));
   L5(3,1:NPI)=-3125/384*((zita-1/5).*(zita.^2-1).*(zita.^2-9/25));
   DL5(3,1:NPI)=-3125/384*((zita.^2-1).*(zita.^2-9/25)+2*zita.*(zita-1/5).*(zita.^2-9/25)+2*zita.*(zita-1/5).*(zita.^2-1));
   L5(4,1:NPI)=3125/576*((zita+1/5).*(zita.^2-1).*(zita.^2-9/25));
   DL5(4,1:NPI)=3125/576*((zita.^2-1).*(zita.^2-9/25)+2*zita.*(zita+1/5).*(zita.^2-9/25)+2*zita.*(zita+1/5).*(zita.^2-1));
   L5(5,1:NPI)=-3125/768*((zita+3/5).*(zita.^2-1/25).*(zita.^2-1));
   DL5(5,1:NPI)=-3125/768*((zita.^2-1/25).*(zita.^2-1)+2*zita.*(zita+3/5).*(zita.^2-1)+2*zita.*(zita+3/5).*(zita.^2-1/25));
   L5(6,1:NPI)=625/768*((zita+1).*(zita.^2-1/25).*(zita.^2-9/25));
   DL5(6,1:NPI)=625/768*((zita.^2-1/25).*(zita.^2-9/25)+2*zita.*(zita+1).*(zita.^2-9/25)+2*zita.*(zita+1).*(zita.^2-1/25));
   
end