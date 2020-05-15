% To calculate the similarity matrix of all users, the similarity between
% user i and user j is definced by the cosine correlation of their
% preference vector. 
% i.e. dot(preferecei, preferencej)/(norm(preferencei)*norm(preferencej))
% Each element of the similarity matrix is a real number between 0 and 1.
% The similarity matrix is symmetrical.
% The sparse_similarity_matrix is obtainned by referring elements below the
% mean of similarity matrix as 0.


function [sparse_similarity_matrix,similarity_matrix] = similarity(user_movie_preference)
[user_num,~]=size(user_movie_preference);
similarity_matrix=zeros(user_num);
for i=1:user_num
    for j=(i+1):user_num
        preference_i=user_movie_preference(i,1:end);
        preference_j=user_movie_preference(j,1:end);
        if norm(preference_i)~=0 && norm(preference_j)~=0
            similarity_matrix(i,j)=dot(preference_i,preference_j)/(norm(preference_i)*norm(preference_j));
        end
    end
end
similarity_matrix=similarity_matrix+similarity_matrix'+eye(user_num);
sparse_similarity_matrix=similarity_matrix;
sparse_similarity_matrix((sparse_similarity_matrix<0.05))=0;

 

