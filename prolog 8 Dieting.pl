% Facts representing diseases and associated diets
diet_suggestion(heart_disease, low_fat).
diet_suggestion(diabetes, low_carb).
diet_suggestion(hypertension, low_salt).
diet_suggestion(cholesterol, low_cholesterol).

% Rule to suggest a diet based on a given disease
suggest_diet(Person, Disease, Diet) :-
    has_disease(Person, Disease),
    diet_suggestion(Disease, Diet),
    write('For '), write(Person), write(' with '), write(Disease),
    write(' we suggest a '), write(Diet), write(' diet.'),
    nl.

% Example facts representing individuals and their diseases
has_disease(john, heart_disease).
has_disease(susan, diabetes).
has_disease(mike, hypertension).

% Example queries
% What diet to suggest for John with heart disease?
% ?- suggest_diet(john, heart_disease, Diet).
%
% What diet to suggest for Susan with diabetes?
% ?- suggest_diet(susan, diabetes, Diet).
