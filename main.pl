:- [knowledge/diagnoses].
:- [utilities/verify].
:- [utilities/undo].
:- [knowledge/advice].

go :-
    hypothesis(Disease),
    write('I believe that the patient has '),
    write(Disease),
    nl,
    write('TAKE CARE'),
    nl,
    give_advice(Disease),
    undo.
