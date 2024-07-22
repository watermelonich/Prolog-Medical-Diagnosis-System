:- [data/symptoms].

hypothesis(cold) :- cold, !.
hypothesis(flu) :- flu, !.
hypothesis(typhoid) :- typhoid, !.
hypothesis(measles) :- measles, !.
hypothesis(malaria) :- malaria, !.
hypothesis(unknown). /* no diagnosis */

cold :-
    verify(headache),
    verify(runny_nose),
    verify(sneezing),
    verify(sore_throat).

flu :-
    verify(fever),
    verify(headache),
    verify(chills),
    verify(body_ache).

typhoid :-
    verify(headache),
    verify(abdominal_pain),
    verify(poor_appetite),
    verify(fever).

measles :-
    verify(fever),
    verify(runny_nose),
    verify(rash),
    verify(conjunctivitis).

malaria :-
    verify(fever),
    verify(sweating),
    verify(headache),
    verify(nausea),
    verify(vomiting),
    verify(diarrhea).
