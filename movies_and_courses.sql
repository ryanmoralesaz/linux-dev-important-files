-- 1. Create the database
DROP DATABASE IF EXISTS student_movies_and_courses;
CREATE DATABASE IF NOT EXISTS student_movies_and_courses;
USE student_movies_and_courses;

-- 2. Create the courses table
CREATE TABLE IF NOT EXISTS courses (
    id INT NOT NULL AUTO_INCREMENT,
    class_name VARCHAR(255) NOT NULL,
    teacher VARCHAR(100) NOT NULL,
    classroom VARCHAR(20) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    PRIMARY KEY (id)
);

-- 3. Create the movies table
CREATE TABLE IF NOT EXISTS movies (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    director VARCHAR(100) NOT NULL,
    actors TEXT NOT NULL,
    rating TINYINT NOT NULL,
    PRIMARY KEY (id)
);

-- 4. Insert 10 sample rows into courses
INSERT INTO courses (class_name, teacher, classroom, start_time, end_time)
VALUES
('Mathematics I',        'John Smith',       'Room 101', '08:00:00', '09:00:00'),
('English Literature',   'Mary Johnson',     'Room 102', '09:15:00', '10:15:00'),
('Physics',              'Robert Brown',     'Room 201', '10:30:00', '11:30:00'),
('Chemistry',            'Linda Davis',      'Lab 1',    '11:45:00', '12:45:00'),
('History',              'Michael Wilson',   'Room 103', '13:00:00', '14:00:00'),
('Biology',              'Patricia Taylor',  'Lab 2',    '14:15:00', '15:15:00'),
('Computer Science',     'William Jones',    'Lab 3',    '15:30:00', '16:30:00'),
('Art',                  'Jennifer Garcia',  'Studio 1', '16:45:00', '17:45:00'),
('Music',                'James Martinez',   'MusicHall','08:30:00', '09:30:00'),
('Physical Education',   'Elizabeth Miller', 'Gym',      '09:45:00', '10:45:00');

-- 5. Insert 10 sample rows into movies
INSERT INTO movies (title, director, actors, rating)
VALUES
('Inception',
    'Christopher Nolan',
    'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page',
    5),
('The Matrix',
    'Lana Wachowski, Lilly Wachowski',
    'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss',
    5),
('Interstellar',
    'Christopher Nolan',
    'Matthew McConaughey, Anne Hathaway, Jessica Chastain',
    5),
('The Shawshank Redemption',
    'Frank Darabont',
    'Tim Robbins, Morgan Freeman',
    5),
('Pulp Fiction',
    'Quentin Tarantino',
    'John Travolta, Uma Thurman, Samuel L. Jackson',
    4),
('The Godfather',
    'Francis Ford Coppola',
    'Marlon Brando, Al Pacino, James Caan',
    5),
('The Dark Knight',
    'Christopher Nolan',
    'Christian Bale, Heath Ledger, Aaron Eckhart',
    5),
('Forrest Gump',
    'Robert Zemeckis',
    'Tom Hanks, Robin Wright, Gary Sinise',
    4),
('Fight Club',
    'David Fincher',
    'Brad Pitt, Edward Norton, Helena Bonham Carter',
    5);

-- End of script

