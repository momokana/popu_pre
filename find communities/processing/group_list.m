% To find groups based on the community matrix

function [allgroups,group_num,grouplist] = group_list(big_com)
[sz,~]=size(big_com);
allgroups=zeros(sz,sz);
group_num=0;
for i=1:sz
    for m=1:i
        if big_com(i,m)==1
            break;
        end
    end
    if m==i
        group_num=group_num+1;
        allgroups(group_num,1)=i;
    else
        for n=1:i
            if allgroups(n,1)==m
                break;
            end
        end
        for j=1:i
            if allgroups(n,j)==0
                allgroups(n,j)=i;
                break;
            end
        end
    end
end
grouplist=cell(group_num,1);
for k=1:group_num
    grouplist{k}=allgroups(k,1:end);
    grouplist{k}((grouplist{k}==0))=[];
end



