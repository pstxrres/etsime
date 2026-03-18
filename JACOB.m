function [JACO]=JACOB(DL,s)
[n,NPI]=size(DL);
   for I=1:1:NPI
       JACO(I)=dot(s,DL(1:n,I));
   end
end
