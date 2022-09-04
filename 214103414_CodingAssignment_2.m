%Coding Assignment 2 : Binary Coded Genetic algorithm
%Tutorial Q3
%Roll No:214103414
disp('Coding Assignment 2 : Binary Coded Genetic algorithm')
disp('Roll No:214103414')
clear all
clc
%Minimization problem convert into maximization
%f(x)=-f(x)
%Define the function
f = @(X1,X2) -X1-X2+2*X1^2+X2^2-X1*X2;
%Boundaries of both variable
a=0;
b=0.5;
%Generate Random solution(Parent Solution)
disp('Generate Random solution(Parent Solution)')
P1=randi([0,1],1,10);
P2=randi([0,1],1,10);
P3=randi([0,1],1,10);
P4=randi([0,1],1,10);
P5=randi([0,1],1,10);
P6=randi([0,1],1,10);


%Encoded value of each variable

EX1P1=bi2de(P1(1:5),'left-msb');
EX2P1=bi2de(P1(6:10),'left-msb');
EX1P2=bi2de(P2(1:5),'left-msb');
EX2P2=bi2de(P2(6:10),'left-msb');
EX1P3=bi2de(P3(1:5),'left-msb');
EX2P3=bi2de(P3(6:10),'left-msb');
EX1P4=bi2de(P4(1:5),'left-msb');
EX2P4=bi2de(P4(6:10),'left-msb');
EX1P5=bi2de(P5(1:5),'left-msb');
EX2P5=bi2de(P5(6:10),'left-msb');
EX1P6=bi2de(P6(1:5),'left-msb');
EX2P6=bi2de(P6(6:10),'left-msb');

%Value of X1 and X2 variable for each Parent Solution
disp('Value of X1 and X2 variable for each Parent Solution')
X1P1=a+(b-a)*EX1P1/(2^5-1);
X2P1=a+(b-a)*EX2P1/(2^5-1);
X1P2=a+(b-a)*EX1P2/(2^5-1);
X2P2=a+(b-a)*EX2P2/(2^5-1);
X1P3=a+(b-a)*EX1P3/(2^5-1);
X2P3=a+(b-a)*EX2P3/(2^5-1);
X1P4=a+(b-a)*EX1P4/(2^5-1);
X2P4=a+(b-a)*EX2P4/(2^5-1);
X1P5=a+(b-a)*EX1P5/(2^5-1);
X2P5=a+(b-a)*EX2P5/(2^5-1);
X1P6=a+(b-a)*EX1P6/(2^5-1);
X2P6=a+(b-a)*EX2P6/(2^5-1);

%Function value for each solution
disp('Function value for each solution')
f1=f(X1P1,X2P1);
f2=f(X1P2,X2P2);
f3=f(X1P3,X2P3);
f4=f(X1P4,X2P4);
f5=f(X1P5,X2P5);
f6=f(X1P6,X2P6);
sumf=f1+f2+f3+f4+f5+f6;

%Selection process : Roulette Wheel Selection
disp('Selection process : Roulette Wheel Selection')
%Probability 

p1=f1/sumf;
p2=f2/sumf;
p3=f3/sumf;
p4=f4/sumf;
p5=f5/sumf;
p6=f6/sumf;

%Cumulative Probability

cp1=p1;
cp2=cp1+p2;
cp3=cp2+p3;
cp4=cp3+p4;
cp5=cp4+p5;
cp6=1;

%Generate random number
disp('random number  for matting pool')
RN=rand(1,6);

% Selection of Mating pool
MP=zeros(6,10);
for i=1:6
    if RN(i)<cp1
       MP(i,1:10)=P1;
elseif cp1<RN(i)<cp2
       MP(i,1:10)=P2;
elseif cp2<RN(i)<cp3
       MP(i,1:10)=P3;
elseif cp3<RN(i)<cp4
       MP(i,1:10)=P4;
elseif cp4<RN(i)<cp5
       MP(i,1:10)=P5;
else
       MP(i,1:10)=P6;
    end
end
disp('Matting pool')
MP;
%crossover
%single point crossover
CH=zeros(6,10);
n=randi([1,9],1,1);
CH(1,1:n)=MP(1,1:n);CH(1,n+1:10)=MP(2,n+1:10);
CH(2,1:n)=MP(2,1:n);CH(2,n+1:10)=MP(1,n+1:10);
n=randi([1,10],1,1);
CH(3,1:n)=MP(3,1:n);CH(3,n+1:10)=MP(4,n+1:10); 
CH(4,1:n)=MP(4,1:n);CH(4,n+1:10)=MP(3,n+1:10);
n=randi([1,10],1,1);
CH(5,1:n)=MP(5,1:n);CH(5,n+1:10)=MP(6,n+1:10); 
CH(6,1:n)=MP(6,1:n);CH(6,n+1:10)=MP(5,n+1:10);

%Children Solution
disp('Children Solution after crossover')
CH
S1=CH(1,:);
S2=CH(2,:);
S3=CH(3,:);
S4=CH(4,:);
S5=CH(5,:);
S6=CH(6,:);

%convert binary to decimal
s1x1=bi2de(S1(1:5))
s1x2=bi2de(S1(6:10))
s2x1=bi2de(S2(1:5))
s2x2=bi2de(S2(6:10))
s3x1=bi2de(S3(1:5))
s3x2=bi2de(S3(6:10))
s4x1=bi2de(S4(1:5))
s4x2=bi2de(S4(6:10))
s5x1=bi2de(S5(1:5))
s5x2=bi2de(S5(6:10))
s6x1=bi2de(S6(1:5))
s6x2=bi2de(S6(6:10))

%End of Programm