give_advice(cold) :-
    write('Advices and Suggestions:'),
    nl,
    write('1: Tylenol/tab'),
    nl,
    write('2: Panadol/tab'),
    nl,
    write('3: Nasal spray'),
    nl,
    write('Please wear warm clothes.'),
    nl.

give_advice(flu) :-
    write('Advices and Suggestions:'),
    nl,
    write('1: Tamiflu/tab'),
    nl,
    write('2: Panadol/tab'),
    nl,
    write('3: Zanamivir/tab'),
    nl,
    write('Please take a warm bath and do salt gargling.'),
    nl.

give_advice(typhoid) :-
    write('Advices and Suggestions:'),
    nl,
    write('1: Chloramphenicol/tab'),
    nl,
    write('2: Amoxicillin/tab'),
    nl,
    write('3: Ciprofloxacin/tab'),
    nl,
    write('4: Azithromycin/tab'),
    nl,
    write('Please do complete bed rest and take a soft diet.'),
    nl.

give_advice(measles) :-
    write('Advices and Suggestions:'),
    nl,
    write('1: Tylenol/tab'),
    nl,
    write('2: Aleve/tab'),
    nl,
    write('3: Advil/tab'),
    nl,
    write('4: Vitamin A'),
    nl,
    write('Please get rest and use more liquids.'),
    nl.

give_advice(malaria) :-
    write('Advices and Suggestions:'),
    nl,
    write('1: Aralen/tab'),
    nl,
    write('2: Qualaquin/tab'),
    nl,
    write('3: Plaquenil/tab'),
    nl,
    write('4: Mefloquine'),
    nl,
    write('Please do not sleep in open air and cover your full skin.'),
    nl.

give_advice(unknown) :-
    write('No specific advice available. Please consult a healthcare professional.'),
    nl.
