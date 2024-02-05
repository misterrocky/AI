% Initial state: monkey is on the floor, banana is hanging from the ceiling,
% and the chair is not at the monkey's position.
state(on_floor, at(monkey, middle), at(banana, ceiling), not_at(chair, middle)).

% Actions to move the monkey, the chair, and reach the banana
action(grab, state(on_floor, at(monkey, Position), at(monkey, Position), at(chair, Position)), state(on_chair, at(monkey, Position), at(monkey, Position), at(chair, Position))).
action(climb, state(on_floor, at(monkey, Position), at(monkey, Position), at(chair, Position)), state(on_chair, at(monkey, Position), at(monkey, Position), at(chair, Position))).
action(push(Position), state(on_floor, at(monkey, Position), at(banana, ceiling), not_at(chair, Position)), state(on_floor, at(monkey, Position), at(banana, ceiling), at(chair, Position))).

% Rules to perform actions
perform(Action, State, NewState) :-
    call(Action, Action, State, NewState).

% Goal state: monkey has the banana
goal_state(state(_, at(monkey, _), at(banana, _), _)).

% Plan to achieve the goal
plan(State, Plan) :-
    goal_state(State),
    Plan = [].

plan(State, [Action | RestOfPlan]) :-
    action(Action, State, NewState),
    plan(NewState, RestOfPlan).

% Example usage
% To find a plan to get the banana, use:
% ?- plan(state(on_floor, at(monkey, middle), at(banana, ceiling), not_at(chair, middle)), Plan).
