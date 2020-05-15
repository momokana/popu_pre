function [ratings_train]=time_divider(ratings,time_div)
[sz,~]=size(ratings);
num=0;
for i=1:sz
    if ratings(i,4)<time_div
        num=num+1;
    end
end
ratings_train=zeros(num,4);
j=1;
for i=1:sz
    if ratings(i,4)<time_div
        ratings_train(j,:)=ratings(i,:);
        j=j+1;
    end
end