% Facts representing the database with names and dates of birth
dob(john, date(1990, 5, 15)).
dob(susan, date(1985, 8, 23)).
dob(mike, date(1995, 2, 10)).
dob(lisa, date(1980, 11, 7)).

% Query to get the date of birth for a given person
get_dob(Person, DateOfBirth) :-
    dob(Person, DateOfBirth).

% Query to check if a person is born in a specific year
born_in_year(Person, Year) :-
    dob(Person, date(Year, _, _)).

% Query to check if a person is born in a specific month
born_in_month(Person, Month) :-
    dob(Person, date(_, Month, _)).



% get_dob(john, Date).
%born_in_year(susan, 1985).
%born_in_month(mike, 2).

