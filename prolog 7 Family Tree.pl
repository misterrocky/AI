% Facts representing family relationships
parent(john, jim).
parent(john, lisa).
parent(lisa, ann).
parent(lisa, peter).
parent(jim, tom).

% Rules to define different relationships
father(X, Y) :-
    parent(X, Y),
    male(X).

mother(X, Y) :-
    parent(X, Y),
    female(X).

child(X, Y) :-
    parent(Y, X).

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

brother(X, Y) :-
    sibling(X, Y),
    male(X).

sister(X, Y) :-
    sibling(X, Y),
    female(X).

% Facts representing genders
male(john).
male(jim).
male(tom).
male(peter).

female(lisa).
female(ann).

% Query examples
% Who are the siblings of Ann?
% ?- sibling(ann, Sibling).
%
% Who is the father of Tom?
% ?- father(Father, tom).
