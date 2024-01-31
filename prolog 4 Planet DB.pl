% Facts representing the database with planets and some information about them
planet(mercury, rocky, 0.39).
planet(venus, rocky, 0.72).
planet(earth, rocky, 1.00).
planet(mars, rocky, 1.52).
planet(jupiter, gas_giant, 5.20).
planet(saturn, gas_giant, 9.58).
planet(uranus, ice_giant, 19.22).
planet(neptune, ice_giant, 30.05).

% Query to get information about a specific planet
planet_info(Name, Type, Distance) :-
    planet(Name, Type, Distance).

%planet_info(earth, Type, Distance).
