function paibu=nextp(a,maxnum)%a是一种粒子排布，该函数计算下一个排布方式
while 1
    for m=length(a):-1:1
        if a(m)~=maxnum
            break
        end
    end
    a(m)=a(m)+1;
    for n=m+1:1:length(a)
        a(n)=a(m);
    end
    if length(a)==length(unique(a))
        break;
    end
end
paibu=a;
end