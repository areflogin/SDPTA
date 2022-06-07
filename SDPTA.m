%   Author:  Aref YELGHI                                     
%   year:    2013                                                  
%   E-mail:  ar.yelqi (at) gmail (dot) com  

clc; close all; clear all;

%'LineWidth',2
% create training set.

cat=2;
num=10;

ginput(1);

for i=1:cat
   for j=1:num
       [x,y,button] = ginput(1);
         pat_1x(j)=x;
         pat_1y(j)=y;
      if i==1
         plot(x,y,'*r','MarkerSize',12); 
      end
      if i==2
         plot(x,y,'*b','MarkerSize',12); 
      end
      
         axis([0 1 0 1])
         hold on 
      
   end
   
    if  i==1
        pat_1=[pat_1x; pat_1y];
        
    end
     if  i==2
        pat_2=[pat_1x; pat_1y];
     end
     
end

title('Two-dimensional two-class pattern space (Linear Classification)');
xlabel('x');
ylabel('y');

% augmented input vectors
pat_1(3,:)=1; % adding third column 1 to main data
y1=pat_1;
d1=ones(num,1);

pat_2(3,:)=1; 
y2=pat_2;
d2=-1*ones(num,1);

y=[y1 y2];
d=[d1; d2]';
% %% One-Neuron Perceptron Setting
%   
%  % one Input-Output neuron for classifying of Two-Class separable linearly,  
  c=0.1;
  W=0.1*(-1+2*rand(3,1));
  b=ones(1); %bias
  E=0; 
  
  p=1;
  k=1;
while k<1000
   while p <= 2*num
      o=sign(W'*y(:,p));
      W=W+0.5*c*(d(p)-o)*y(:,p);
      E=0.5*((d(p)-o).^2)+E;
      p=p+1;
   end
   W
   Eu(k)=E;
     %% plot line
     % ax + by + c = 0 ==> y=(-c-ax)/b;
     x1 = [0,1];   %x = [xmin,xmax]; 
     if W(2)==0
         W(2)=W(2)+0.0001;
     end
     y1 = (-W(3)/W(2))-((W(1)*x1)/W(2));
     plot(x1,y1,'Color','g')
     %hold on
     drawnow; pause(1)
  %%
   
   if E==0
     break
   else
       E=0;
       p=1;
   end
 k=k+1;
end
 k
  t=1:length(Eu);
 figure (2)
  plot(t,Eu,'Color','r')
 title('Error Convergence');
xlabel('iteration number (k)');
ylabel('Error');

  