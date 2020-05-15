function [group] = similarity_group(sparse_similarity_matrix,initial,th)
[user_train_num,~]=size(sparse_similarity_matrix);
group_size=0;
for i=1:user_train_num
    if sparse_similarity_matrix(initial,i)>th
        group_size=group_size+1;
    end
end
group=initial*ones(1,group_size);
j=1;
for i=initial:user_train_num
    if sparse_similarity_matrix(initial,i)>th
        group(j)=i;
        j=j+1;
    end
end



