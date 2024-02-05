% Facts about fruits and their colors
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(watermelon, green).

% Query to find fruits with a specific color
fruit_with_color(Color, Fruit) :-
    fruit_color(Fruit, Color).

% Example queries
% Find fruits that are red
% ?- fruit_with_color(red, Fruit).
%
% Find the color of an apple
% ?- fruit_color(apple, Color).
