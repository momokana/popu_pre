% mapping funtion is in a sigmod form:
% h(user_n,movie i)=1/(1+exp(-wn*xi)
% wn=user_n's category preference
% xi=cagetory vector of movie_i

function [user_category_preference, mapping_matrix] = mapping(user_movie_preference, category_matrix)
user_category_preference=user_movie_preference*category_matrix;
stand=mean(user_category_preference(:));
user_category_preference=user_category_preference./stand;
mapping_matrix=1./(1+exp(-user_category_preference*category_matrix'));