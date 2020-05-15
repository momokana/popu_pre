function [remains] = find_remains(alcom,user_train_num)
total=(1:user_train_num);
sz_remains=user_train_num-size(alcom,2);
remains=zeros(1,sz_remains);
j=1;
for i=1:user_train_num
    if size(find(alcom==total(i)),2)==0
        remains(j)=total(i);
        j=j+1;
    end
end


