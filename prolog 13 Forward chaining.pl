% Rules representing relationships
parent(john, mary).
parent(john, jim).
parent(mary, ann).
parent(mary, peter).

% Rule to define siblings
siblings(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% Forward chaining rule
ancestor(X, Y) :-
    parent(X, Y).
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

% Example query for forward chaining
% Who are the ancestors of Ann?
% ?- ancestor(X, ann).
