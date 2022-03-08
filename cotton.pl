
symptom('spots').
symptom('shedding of leaves').
symptom('discolouration').
symptom('infected petiole').
symptom('angular leaves').
symptom('fungus on stem').
symptom('weak stem').
symptom('boll infection').
symptom('infected roots.').
symptom('stained lint').
symptom('split and shred bark').
symptom('yellowish cotyledon').
symptom('yellowish leaves').


    /*--symptom('small water-soaked spots on cotyledon').*/
    /*--symptom('small water-soaked spots on leaf').*/
    /*symptom('angular leaves').*/
    /*----symptom('collapse of infected petiole collapse').*/
    /*88symptom('elongated, sunken and dark lesions').*/
    /*88symptom('weak stem').*/
    /*symptom('discolouration').*/


    /*symptom('yellowish cotyledon').*/
    /*symptom('brown petiole').*/
    /*--symptom('death of affected leaves').*/
    /*symptom('droping of leaves').*/

    /*--symptom('irregular angular, pale and translucent spots').*/
    /*s--ymptom('few to over a hundred spots on single leaf').*/
    /*symptom('yellowish bronw leaves').*/
    /*symptom('shedding of leaves').*/

    /*symptom('small reddish spots').*/
    /*symptom('fungus on stem').*/
    /*symptom('split and shred bark').*/
    /*symptom('stained lint').*/
    /*symptom('boll infection').*/


    /*symptom('brown spots on cotyledon').*/
    /*--symptom('decayed roots').*/
    /*--symptom('shreded and rotting roots').*/

input :- dynamic(patient/2),
    repeat,
    symptom(X),
    write('Does the patient have '),
    write(X),
    write('?'),
    read(Y),
    assert(patient(X,Y)),
    \+ not(X='yellowish leaves'),
    not(output).

disease(black_arm_disease) :- 
    patient('spots', yes),
    patient('angular leaves',yes),
    patient('infected petiole',yes),
    patient('weak stem', yes),
    patient('discolouration', yes).

disease(vascular_wilt_disease) :-
    not(disease(black_arm_disease)),
    patient('infected petiole', yes),
    patient('shedding of leaves', yes),
    patient('yellowish cotyledon', yes),
    patient('shedding of leavess', yes).

disease(grey_mildew) :-
    not(disease(vascular_wilt_disease)),
    not(disease(black_arm_disease)),
    patient('spots',yes),
    patient('yellowish leaves', yes),
    patient('shedding of leaves', yes).

disease(anthracnose) :-
    not(disease(vascular_wilt_disease)),
    not(disease(black_arm_disease)),
    not(disease(grey_mildew)),
    patient('spots', yes),
    patient('fungus on stem', yes),
    patient('split and shred bark', yes),
    patient('stained lint'),
    patient('boll infection', yes).

disease(root_rot_disease) :-
    not(disease(vascular_wilt_disease)),
    not(disease(black_arm_disease)),
    not(disease(grey_mildew)),
    not(disease(anthracnose)),
    patient('spots', yes),
    patient('infected roots', yes), 

treatment(black_arm_disease,'Field sanitization, Externally seed borne infection can be eradicated by delinting the seed with Cone H2SO4 for 5 minutes, wash with lime solution to neutralise the effect and finally washing with running water to remove the residue and drying seeds.').
treatment(vascular_wilt_disease,'Use of resistant varieties. G. arboreum and G. herbaceum are susceptible whereas G. hirsutum and G. barbedanse are immune.').
treatment(grey_mildew,'Destruction of infected plant debris and sust the crop with 300 mesh sulphur at the rate 20 kg/ha or spray crop with 0.05% propiconazole.').
treatment(anthracnose,'Seed treatment with Thiram 3 g or Carbendazimm 1 g + Thiram 3 g/kg of seed and pray the crop once or twice with copper oxychloride (0.25%) or Zineb (0.25%) after boll formation.').
treatment(root_rot_disease,'Seed treatment with Thiram or Captan at the rate 3 g +1 g Carbendazim/ kg seed, soil mulching after rains and soil disinfection with 0.1% Carbendazim helps in controlling the disease.').

output :- 
    nl,
    possible_diseases,
    nl,
    advice.

possible_diseases :- disease(X), write("The patient may suffer from "), write(X),nl.
advice :- disease(X), treatment(X, Y), write('Treatment: '), write(Y),nl .