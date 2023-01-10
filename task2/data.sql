-- inserting person 
insert into person (lastname, firstname, age) values
(	'Danvers',	'Carol',	63),
(	'Stark',	'Tony',	53),
(	'Banner',	'Bruce',	39),
(	'Odinson',	'Thor',	1500),
(	'Odinson',	'Loki',	1054),
(	'Odinsdottir',	'Hela',	3000),
(	'Romanoff',	'Natasha',	33),
(	'Lang',	'Scott',	46),
(	'Parker',	'Peter',	17),
(	'Rogers',	'Steve',	99),
(	'Fury',	'Nick',	66),
(	'Strange',	'Stephan',	42),
(	'Maximoff',	'Wanda',	26),
(	'Maximoff',	'Pietro',	26),
(	'Brunnhilde',	'Valkyrie',	5000),
(	'Wakanda',	'Shuri',	24),
(	'Wakanda',	'TChalla',	35),
(	'Barton',	'Clint',	53),
(	'Barnes',	'Bucky',	106),
(	'Wilson',	'Sam',	40),
(	'Wong',	'Benedict',	51),
(	'Quill',	'Peter',	38),
(	'Carter',	'Peggy',	95),
(	'Belova',	'Yelena',	27),
(	'Bishop',	'Kate',	22),
(	'Asadi',	'Hannah',	20),
(	'Molavi',	'Hosna',	19),
(	'Asghari',	'Yas',	22),
(	'Samadder',	'Pranto',	18),
(	'Jogell',	'Fredrick',	26),
(	'Cosentino',	'Dante',	24),
(	'Ande',	'Fanuel',	24),
(   'Stenman',	'Nellie',	24),
(	'Linlu',	'Silvia',	20),
(	'Ekström',	'Arthur',	21),
(	'Persson',	'Oscar',	24),
(	'Belmar',	'Tomas',	20),
(	'NågonDraken',	'Albin',	20),
(	'Hocker',	'Simon',	24),
(	'ko',	'E-joon',	25),
(	'Jälmefors',	'Elin',	22),
(	'Verner-Clarsson',	'Tove',	30),
(	'Asp',	'Pontus',	25),
(	'Helmfrid',	'Rickard',	31),
(	'Frosterud',	'Edvin',	20),
(	'gamer',	'Kristofer',	18),
(	'Origami',	'Vlad',	20),
(	'KnutssonMendoza',	'Ludvig',	26);

-- inserting instructor 
insert into instructor(id, paydate) values
(3,NULL),
(4,NULL),
(11,NULL),
(29,NULL),
(7,NULL),
(5,NULL),
(10,NULL),
(8,NULL),
(9,NULL),
(15,NULL),
(21,NULL),
(20,NULL);

-- inserting lessons
insert into lesson ( instructorid, price, level, date, type) values 
(3,	1000,	'beginner',	'2022-10-23',	'individual'),
(4,	1000,	'beginner',	'2022-10-17',	'individual'),
(11,	1000,	'beginner',	'2022-11-11',	'individual'),
(29,	1000,	'intermediate',	'2022-11-22',	'individual'),
(3,	1000,	'advaned', '2022-10-23',	'individual'),
(4,	1000,	'intermediate',	'2022-10-01',	'individual'),
(7,	1000,	'advanced',	'2022-10-20',	'individual'),
(7,	600,	'beginner',	'2022-10-21',	'group'),
(11,	600,	'beginner',	'2022-11-19',	'group'),
(5,	600,	'intermediate',	'2022-11-08',	'group'),
(29,	600,	'advaned',	'2022-10-25',	'group'),
(10,	600,	'intermediate',	'2022-10-06',	'group'),
(9,	600,	'advanced',	'2022-10-13',	'group'),
(10,	600,	'advanced',	'2022-11-13',	'group'),
(3,	600,	'beginner',	'2022-10-05',	'group'),
(8,	600,	'beginner',	'2022-10-04',	'group'),
(15,	600,	'intermediate',	'2022-11-17',	'group'),
(4,	800,	'beginner',	'2022-10-28',	'ensemble'),
(4,	800,	'beginner',	'2022-11-21',	'ensemble'),
(21,	800,	'beginner',	'2022-11-23',	'ensemble'),
(10,	800,	'intermediate',	'2022-11-27',	'ensemble'),
(20,	800,	'advaned',	'2022-11-07',	'ensemble'),
(9,	800,	'intermediate',	'2022-10-16',	'ensemble');

-- inserting individual lessons  
insert into individual_lessons (lessonid, instrument) values 
(1,	'chello'),                                            
(2,	'violin'),                                            
(3,	'piano'),                                             
(4,	'guitar'),                                            
(5,	'harp'),                                              
(6,	'drums'); 

-- inserting group lesson
insert into group_lessons (lessonid, minseats, maxseats, instrument) values
(9,	2,	5,	'piano'),
(10, 2,	6,	'harp'),
(11,	2,	4,	'violin'),
(12,	2,	5,	'guitar');

-- inserting ensembles 
insert into ensemble (lessonid, minseats, maxseats, genre, current_students, date) values
(20,	4,	20,	'classic',	7,	'2022-11-27'),
(21,	3,	7,	'pop',	6,	'2022-10-28');

-- inserting sibling 
insert into sibling (id, hassibling) values
(6,	    't'),
(7,	    't'),
(8,	    't'),
(9,	    'f'),
(10,    'f'),
(11,	't'),
(12,	't'),
(13,	'f'),
(14,	't'),
(15,	't'),
(16,	'f'),
(17,	'f'),
(18,    'f'),
(19,	'f'),
(20,	't'),
(21,	'f'),
(22,	'f'),
(23,	'f'),
(24,	'f'),
(25,	'f'),
(26,	'f'),
(27,	'f'),
(28,	'f'),
(29,	'f'),
(30,	'f'),
(31,    'f'),
(32,	'f'),
(33,    'f'),
(34,	'f'),
(35,    'f');

-- insert student 
insert into student (id, level) values
(6,	    'intermediate'),
(7,	    'intermediate'),
(8,	    'advanced'),
(9,	    'beginner'),
(10,    'beginner'),
(11,	'advanced'),
(12,	'intermediate'),
(13,	'intermediate'),
(14,	'beginner'),
(15,	'beginner'),
(16,	'intermediate'),
(17,	'advanced'),
(18,    'intermediate'),
(19,	'beginner'),
(20,	'intermediate'),
(21,	'intermediate'),
(22,	'beginner'),
(23,	'beginner'),
(24,	'beginner'),
(25,	'intermediate'),
(26,	'beginner'),
(27,	'advanced'),
(28,	'intermediate'),
(29,	'beginner'),
(30,	'intermediate'),
(31,    'advanced'),
(32,	'beginner'),
(33,    'intermediate'),
(34,	'beginner'),
(35,    'beginner');

-- insert sibling list
insert into siblinglist (siblingid, id) values 
(6,7),
(6,8),
(7,6),
(7,8),
(15,16),
(16,15);




