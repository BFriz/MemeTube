-- drop table videos;

CREATE TABLE videos(
  id serial8 primary key,
  title varchar(225),
  description text,
  url varchar(225),
  genre varchar(30)
);


-- insert into videos (title, discription, url, genre) values ('Best Animal Thug Life Compilation of 2015 Part 4', 'Thug life 4', 'su5AF04yWN0', 'health');
-- insert into videos (title, discription, url, genre) values ('Best Animal Thug Life Compilation of 2015 Part 3', 'Thug life 3', 'pNKruLXXwtc', 'health');
