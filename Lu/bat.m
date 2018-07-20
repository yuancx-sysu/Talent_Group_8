global G
global ene
yy=[];
nn=-1:0.2:1;
for m=1:length(nn)
    G=nn(m);
    main;
    yy=[yy ene];
end

plot(nn,yy);
axis([-1 1 -0.7 0.1]);
xlabel('Interaction strength,g');
ylabel('correlation energy');
%title('')
hold on;