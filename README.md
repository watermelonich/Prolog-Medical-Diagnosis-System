# Prolog Medical Diagnosis System

This project is a Prolog-based medical diagnosis system that determines potential diseases based on user-provided symptoms and offers corresponding medical advice. It dynamically loads symptom and advice data from CSV files, making it easy to update and extend.

### File Descriptions

- **main.pl**: The entry point of the system, which initializes the system and starts the diagnosis process.
- **knowledge/diagnoses.pl**: Contains the logic to verify symptoms for different diseases and determine a diagnosis.
- **knowledge/advice.pl**: Handles loading medical advice from the CSV file and providing it based on the diagnosis.
- **utilities/verify.pl**: Contains the logic for verifying symptoms by asking the user questions.
- **utilities/undo.pl**: Contains the logic for undoing assertions made during the diagnosis process.
- **utilities/csv_reader.pl**: Provides functionality to read data from CSV files.
- **data/symptoms.pl**: Defines the dynamic predicate for symptoms. This file is populated from the CSV data.
- **datasets/symptoms.csv**: CSV file containing diseases and their associated symptoms.
- **datasets/advice.csv**: CSV file containing medical advice for each disease.

## Prerequisites

Ensure you have SWI-Prolog installed on your system. You can download it from [SWI-Prolog website](https://www.swi-prolog.org/).

## Setup

1. Clone the repository to your local machine.
    ```bash
    git clone https://github.com/watermelonich/Prolog-Medical-Diagnosis-System.git
    cd Prolog-Medical-Diagnosis-System
    ```

2. Ensure all the `.pl` files and `.csv` datasets are in the correct directories as outlined in the directory structure above.

## Running the System

1. Open the SWI-Prolog environment.
2. Load the main file:
    ```prolog
    ?- [main].
    ```
3. Start the diagnosis:
    ```prolog
    ?- go.
    ```

## How It Works

### Data Loading

#### `csv_reader.pl`

This module provides functionality to read data from CSV files and populate Prolog predicates dynamically.

```prolog
:- use_module(library(csv)).

load_symptoms :-
    csv_read_file('datasets/symptoms.csv', Rows, [functor(symptom), arity(2)]),
    maplist(assert, Rows).
```

- **load_symptoms/0**: Reads `datasets/symptoms.csv` and asserts each row as a `symptom/2` predicate.

#### `symptoms.pl`

Defines a dynamic predicate for symptoms.

```prolog
:- dynamic symptom/2.
```

#### `advice.pl`

Handles loading medical advice from the CSV file and providing it based on the diagnosis.

```prolog
:- dynamic advice/2.

give_advice(Disease) :-
    advice(Disease, Advice),
    write('Advices and Suggestions:'), nl,
    split_string(Advice, ";", "", AdviceList),
    maplist(writeln, AdviceList).

load_advice :-
    csv_read_file('datasets/advice.csv', Rows, [functor(advice), arity(2)]),
    maplist(assert, Rows).
```

### Diagnosis Process

#### `diagnoses.pl`

Defines the logic for verifying symptoms and determining a diagnosis.

```prolog
:- [data/symptoms].

hypothesis(Disease) :-
    symptom(Disease, Symptoms),
    verify_symptoms(Symptoms),
    !.
hypothesis(unknown). /* no diagnosis */

verify_symptoms([]).
verify_symptoms([Symptom | Rest]) :-
    verify(Symptom),
    verify_symptoms(Rest).
```

- **hypothesis/1**: Tries to match the symptoms of a disease. If no match is found, returns `unknown`.
- **verify_symptoms/1**: Recursively verifies a list of symptoms.

#### `verify.pl`

Contains the logic for verifying symptoms by interacting with the user.

```prolog
ask(Question) :-
    format('Does the patient have the following symptom: ~w? (yes/y or no/n) ', [Question]),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
    ->
    assert(yes(Question)) ;
    assert(no(Question)), fail).

verify(S) :-
    (yes(S)
    ->
    true ;
    (no(S)
    ->
    fail ;
    ask(S))).
```

- **ask/1**: Asks the user if they have a particular symptom.
- **verify/1**: Verifies if a symptom has been confirmed by the user.

#### `undo.pl`

Contains the logic for undoing assertions made during the diagnosis process.

```prolog
:- dynamic yes/1, no/1.

undo :- retract(yes(_)), fail.
undo :- retract(no(_)), fail.
undo.
```

- **undo/0**: Retracts all `yes/1` and `no/1` assertions.

## Adding New Diseases and Symptoms

1. Update `datasets/symptoms.csv` with new diseases and their associated symptoms.
2. Update `datasets/advice.csv` with the corresponding advice for the new diseases.

## Example CSV Entries

### `datasets/symptoms.csv`

```csv
disease,symptoms
cold,headache runny_nose sneezing sore_throat
flu,fever headache chills body_ache
typhoid,headache abdominal_pain poor_appetite fever
measles,fever runny_nose rash conjunctivitis
malaria,fever sweating headache nausea vomiting diarrhea
covid19,fever dry_cough tiredness
dengue,fever headache pain_behind_eyes joint_pain rash
chickenpox,fever tiredness loss_of_appetite rash
```

### `datasets/advice.csv`

```csv
disease,advice
cold,"1: Tylenol/tab; 2: Panadol/tab; 3: Nasal spray; Please wear warm clothes."
flu,"1: Tamiflu/tab; 2: Panadol/tab; 3: Zanamivir/tab; Please take a warm bath and do salt gargling."
typhoid,"1: Chloramphenicol/tab; 2: Amoxicillin/tab; 3: Ciprofloxacin/tab; 4: Azithromycin/tab; Please do complete bed rest and take a soft diet."
measles,"1: Tylenol/tab; 2: Aleve/tab; 3: Advil/tab; 4: Vitamin A; Please get rest and use more liquids."
malaria,"1: Aralen/tab; 2: Qualaquin/tab; 3: Plaquenil/tab; 4: Mefloquine; Please do not sleep in open air and cover your full skin."
covid19,"1: Paracetamol/tab; 2: Ibuprofen/tab; Please isolate yourself and stay hydrated."
dengue,"1: Acetaminophen/tab; Avoid aspirin and NSAIDs. Drink plenty of fluids and get rest."
chickenpox,"1: Calamine lotion; 2: Antihistamines; Drink plenty of fluids and get rest."
```

## Contributing

Contributions are welcome! Feel free to fork this repository and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
