function ifp=ifpair(a)%判断是否全部配对
ifp=1;
for m=1:length(a)
    if mod(a(m),2) 
        if ~ismember(a(m)+1,a)
            ifp=0;
            break
        end
    else
        if ~ismember(a(m)-1,a)
            ifp=0;
            break
        end
    end
end
end