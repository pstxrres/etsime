function [tipo,nodel,xn]=malla_6(a,b,NE)
 tipo(1:2:NE)=2; tipo(2:2:NE)=1; n=1+sum(tipo);
 nodel=zeros(NE,3);
 nodel(1:2:NE,1)=1:3:n-1; nodel(1:2:NE,2)=2:3:n-1;
 nodel(1:2:NE,3)=3:3:n;
 nodel(2:2:NE,1)=3:3:n-1; nodel(2:2:NE,2)=4:3:n;
 xn=linspace(a,b,n)'; H=xn(2)-xn(1);
 if (n>8)
 xn(8)=xn(7)+0.8*H;
 end
 if (n>11)
 xn(11)=xn(10)+1.2*H;
 end
end
