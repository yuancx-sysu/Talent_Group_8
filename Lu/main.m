orbitnum=4;%�����
partipair=2;%���ٶ�����
pair=1;%�Ƿ���Կ���
global G%��������ע����һ��
%G=0.5;%g��d��ȡֵ,ֱ������main����������Gֵ
D=1;
%----------------�ֽ�������������������ֽ���������������Ķ�----------------%
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