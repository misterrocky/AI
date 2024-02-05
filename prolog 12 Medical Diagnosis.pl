% Facts about symptoms and possible diseases
symptom(john, fever).
symptom(john, cough).
symptom(jane, headache).
symptom(jane, nausea).

disease(fever, flu).
disease(cough, cold).
disease(headache, stress).
disease(nausea, flu).

% Rule to diagnose a disease based on symptoms
diagnose(Person, Disease) :-
    symptom(Person, Symptom),
    disease(Symptom, Disease).

% Example queries
% What disease does John have?
% ?- diagnose(john, Disease).
%
% What disease does Jane have?
% ?- diagnose(jane, Disease).
