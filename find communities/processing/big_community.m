function [big_com]=big_community(group,com,user_train_num)
big_com=zeros(user_train_num);
[sz,~]=size(com);
for i=1:sz
    for j=i:sz
        big_com(group(i),group(j))=com(i,j);
        big_com(group(j),group(i))=big_com(group(i),group(j));
    end
end
