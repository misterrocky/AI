% Facts representing relationships
parent(john, mary).
parent(john, jim).
parent(mary, ann).
parent(mary, peter).

% Rule to define siblings
siblings(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% Backward chaining rule
ancestor(X, Y) :-
    parent(X, Y).
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

% Example query for backward chaining
% Is John an ancestor of Ann?
% ?- ancestor(john, ann).
