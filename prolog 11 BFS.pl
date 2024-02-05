% Sample tree structure
node(a, [b, c, d]).
node(b, [e, f]).
node(c, [g]).
node(d, [h, i]).
node(e, []).
node(f, []).
node(g, []).
node(h, []).
node(i, []).

% Best-first search algorithm
best_first_search(Start, Goal, Path) :-
    best_first_search_helper([node(Start, [])], Goal, Path).

best_first_search_helper([node(State, Path) | _], Goal, Path) :-
    State = Goal.

best_first_search_helper([node(State, Path) | Rest], Goal, ResultPath) :-
    expand(State, Path, Children),
    append(Rest, Children, NewQueue),
    best_first_search_helper(NewQueue, Goal, ResultPath).

expand(State, Path, Children) :-
    node(State, Successors),
    findall(node(Child, [Child | Path]), member(Child, Successors), Children).

% Example usage
% Find a path from 'a' to 'g'
% ?- best_first_search(a, g, Path).
