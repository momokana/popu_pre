function [group] = preference_group(preference_sum,th_high,th_low)
[user_train_num,~]=size(preference_sum);
group_size=0;
for i=1:user_train_num
    if preference_sum(i)<=th_high && preference_sum(i)>=th_low
        group_size=group_size+1;
    end
end
group=zeros(1,group_size);
j=1;
for i=1:user_train_num
    if preference_sum(i)<=th_high && preference_sum(i)>=th_low
        group(j)=i;
        j=j+1;
    end
end

