orbitnum=4;%轨道数
partipair=2;%多少对粒子
pair=1;%是否配对开关
global G%批量运行注释下一行
%G=0.5;%g和d的取值,直接运行main在这里输入G值
D=1;
%----------------分界线以上是输入参数，分界线以下请勿随意改动----------------%
global ene

paibu=1:partipair*2;
corresp=paibu';
dem=1;

while 1
    paibu=nextp(paibu,orbitnum*2);
    if pair==1
        if ~ifpair(paibu)
            continue
        end
    end
    corresp=[corresp paibu'];
    dem=dem+1; 
    if paibu==2*(orbitnum-partipair)+1:2*orbitnum
        break
    end
end
syms g d;
hmi=sym('hmi',[dem,dem]);
for m=1:dem
    for n=1:dem
        zong=[(corresp(:,m))' (corresp(:,n))'];
        hmi(m,n)=-g*(length(zong)-length(unique(zong)))/4;
        if m==n
             x=sum(zong)-1.5*length(zong);
             hmi(m,n)=hmi(m,n)+x*d/4;
%             hmi(m,n)=hmi(m,n)+2*d*(m-1);
        end
    end
end

Fhmi=subs(hmi,{g,d},{G D});
Fhmi=vpa(Fhmi);
[~,fihmi]=eig(Fhmi);
ene=min(diag(fihmi))-Fhmi(1,1);