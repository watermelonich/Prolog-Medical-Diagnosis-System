:- dynamic yes/1, no/1.

undo :- retract(yes(_)), fail.
undo :- retract(no(_)), fail.
undo.
