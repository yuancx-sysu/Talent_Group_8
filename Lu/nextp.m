function paibu=nextp(a,maxnum)%a��һ�������Ų����ú���������һ���Ų���ʽ
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