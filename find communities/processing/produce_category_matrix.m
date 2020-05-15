% To produce the category feature matrix of all movies.
% 1 Action 
% 2 Adventure 
% 3 Animation
% 4 Children
% 5 Comedy
% 6 Crime
% 7 Documentary
% 8 Drama
% 9 Fantasy
% 10 Film-Noir
% 11 Horror
% 12 Musical
% 13 Mystery
% 14 Romance
% 15 Sci-Fi
% 16 Thriller
% 17 War
% 18 Western
% 19 (no genres listed)
% 20 IMAX
% E.g. if a movie contains "action" category, the first coordinate of its
% category vector will be 1, otherwise 0.

function[category_matrix]=produce_category_matrix(movies,category_num)
[movie_num,~]=size(movies);
category_matrix=zeros(movie_num,category_num);
for i=1:movie_num
    if size(strfind(movies{i,2},'Action'),1)~=0
        category_matrix(i,1)=1;
    end
    if size(strfind(movies{i,2},'Adventure'),1)~=0
        category_matrix(i,2)=1;
    end
    if size(strfind(movies{i,2},'Animation'),1)~=0
        category_matrix(i,3)=1;
    end
    if size(strfind(movies{i,2},'Children'),1)~=0
        category_matrix(i,4)=1;
    end
    if size(strfind(movies{i,2},'Comedy'),1)~=0
        category_matrix(i,5)=1;
    end
    if size(strfind(movies{i,2},'Crime'),1)~=0
        category_matrix(i,6)=1;
    end
    if size(strfind(movies{i,2},'Documentary'),1)~=0
        category_matrix(i,7)=1;
    end
    if size(strfind(movies{i,2},'Drama'),1)~=0
        category_matrix(i,8)=1;
    end
    if size(strfind(movies{i,2},'Fantasy'),1)~=0
        category_matrix(i,9)=1;
    end
    if size(strfind(movies{i,2},'Film-Noir'),1)~=0
        category_matrix(i,10)=1;
    end
    if size(strfind(movies{i,2},'Horror'),1)~=0
        category_matrix(i,11)=1;
    end
    if size(strfind(movies{i,2},'Musical'),1)~=0
        category_matrix(i,12)=1;
    end
    if size(strfind(movies{i,2},'Mystery'),1)~=0
        category_matrix(i,13)=1;
    end
    if size(strfind(movies{i,2},'Romance'),1)~=0
        category_matrix(i,14)=1;
    end
    if size(strfind(movies{i,2},'Sci-Fi'),1)~=0
        category_matrix(i,15)=1;
    end
    if size(strfind(movies{i,2},'Thriller'),1)~=0
        category_matrix(i,16)=1;
    end
    if size(strfind(movies{i,2},'War'),1)~=0
        category_matrix(i,17)=1;
    end
    if size(strfind(movies{i,2},'Western'),1)~=0
        category_matrix(i,18)=1;
    end
    if size(strfind(movies{i,2},'(no gere listed)'),1)~=0
        category_matrix(i,19)=1;
    end
    if size(strfind(movies{i,2},'IMAX'),1)~=0
        category_matrix(i,20)=1;
    end
end

    
    







