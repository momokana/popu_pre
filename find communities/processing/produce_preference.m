% To produce the user preference matrix based on ratings.
% (i,j)means the ith user's rating on the jth movie. The rating is
% normalized, i.e. initial rating divided by 5.0. If the user has not given
% a rating on the film, (i,j)=0.

function [user_movie_preference] = produce_preference(user_num,ratings,new_movieID)
[row,~]=size(ratings);
[movie_num,~]=size(new_movieID);
user_movie_preference=zeros(user_num,movie_num);
for r=1:row
    i=ratings(r,1);
    oldID=ratings(r,2);
    for m=1:movie_num
        if new_movieID(m,2)==oldID
            newID=new_movieID(m,1);
        end
    end
    user_movie_preference(i,newID)=ratings(r,3)/5;
end
