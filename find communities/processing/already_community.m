function [alcom] = already_community(alre_com,group,com) % group = remaining group
[com_size,~]=size(com);
s=sum(com);
alcom=zeros(1,com_size);
j=1;
for i=1:com_size
    if s(i)>1
        alcom(j)=group(i);
        j=j+1;
    end
end
alcom((alcom==0))=[];
alcom=[alcom alre_com];
alcom=sort(alcom);
