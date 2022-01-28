set(0,'DefaultFigureWindowStyle','docked')
set(0,'defaultaxesfontsize',20)
set(0,'defaultaxesfontname','Times New Roman')
set(0,'DefaultLineLineWidth', 2);
n=1; %number of particles
x=zeros(n,1);
v=zeros(n,1);
t=0;
F=1;
m=1;
dt=1;
nt=1000;
a=1;
F=m*a;
T=0;
for i = 2: nt
    dL=0.5*a*(dt)^2 + v(:,i-1)*dt;
    t(i)=t(i-1)+dt;
    T(i)=T(i-1)+1;
    %P=1-exp(-dt/T(i)); 
    if rand()<0.05
        v(:,i)=0;
        x(:,i)=x(:,i-1)+v(:,i-1)*dt+0.5* F/m*(dt)^2;
    else 
        v(:,i)=v(:,i-1)+F/m*dt;
        x(:,i)=x(:,i-1)+v(:,i-1)*dt+0.5* F/m*(dt)^2;
    end
    drift=mean(v(1,:));
    str = sprintf('Drift velocity =%d', drift);
    subplot(3,1,1)
    plot(t,x,'o')
    xlabel('time')
    ylabel('position')
    subplot(3,1,2)
    plot(t,v,'-')
    xlabel('time')
    ylabel('velocity')
    title(str)
    subplot(3,1,3)
    plot(x,v)
    xlabel('position')
    ylabel('velocity')
    pause(0.1)
end
    