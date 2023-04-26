CREATE TABLE stars (
    star_name TEXT PRIMARY KEY,
    star_temp_kelvin INTEGER NOT NULL
);

CREATE TABLE planets (
    planet_name TEXT PRIMARY KEY,
    orbital_yrs FLOAT NOT NULL,
    orbits_around TEXT NOT NULL REFERENCES stars
);

CREATE TABLE moons (
    moon_name TEXT PRIMARY KEY,
    planet TEXT NOT NULL REFERENCES planets
);


INSERT INTO stars(star_name, star_temp_kelvin)
    VALUES
    ('The Sun', 5800),
    ('Proxima Centauri', 3042),
    ('Gliese 876', 3192);

INSERT INTO planets(planet_name, orbital_yrs, orbits_around)
    VALUES
    ('Earth', 1.00, 'The Sun'),
    ('Mars', 1.882, 'The Sun'),
    ('Venus', 0.62, 'The Sun'),
    ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
    ('Gliese 876 b', 0.236, 'Gliese 876');


INSERT INTO moons(moon_name, planet)
    VALUES
    ('The Moon', 'Earth'),
    ('Phobos', 'Mars'),
    ('Deimos', 'Mars');



SELECT p.planet_name as planet, s.star_name as star, COUNT(m.planet) as moon_count
FROM moons as m
RIGHT OUTER JOIN planets as p
ON m.planet = p.planet_name
JOIN stars as s
ON p.orbits_around = s.star_name
GROUP BY p.planet_name, s.star_name
ORDER BY p.planet_name;