CREATE TABLE planets (
    planet_name TEXT PRIMARY KEY,
    orbital_yrs NUMERIC(4,3) NOT NULL,
    orbits_around TEXT NOT NULL REFERENCES stars
)

CREATE TABLE stars (
    star_name TEXT PRIMARY KEY,
    star_temp_kelvin TEXT NOT NULL
)

CREATE TABLE moons (
    moon_name TEXT PRIMARY KEY,
    planet TEXT NOT NULL REFERENCES planets
)


INSERT INTO planets(planet_name, orbital_yrs, orbits_around)
    VALUES
    ('Earth', 1.00, 'The Sun'),
    ('Mars', 1.882, 'The Sun'),
    ('Venus', 0.62, 'The Sun'),
    ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
    ('Gliese 876 b', 0,236, 'Gliese 876');

INSERT INTO stars(star_name, star_temp_kelvin)
    VALUES
    ('The Sun', '5800°K'),
    ('Proxima Centauri', '3042°K'),
    ('Gliese 876', '3192°K');

INSERT INTO moons(moon_name, planet)
    VALUES
    ('The Moon', 'Earth'),
    ('Phobos', 'Mars'),
    ('Deimos', 'Mars');