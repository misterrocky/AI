% Rules to solve Towers of Hanoi
hanoi(1, Source, Target, _, Moves) :-
    write('Move disk 1 from '), write(Source), write(' to '), writeln(Target),
    Moves = 1.

hanoi(N, Source, Target, Auxiliary, Moves) :-
    N > 1,
    N1 is N - 1,
    hanoi(N1, Source, Auxiliary, Target, Moves1),
    write('Move disk '), write(N), write(' from '), write(Source), write(' to '), writeln(Target),
    hanoi(N1, Auxiliary, Target, Source, Moves2),
    Moves is Moves1 + 1 + Moves2.

%hanoi(3, 'A', 'C', 'B', Moves).
