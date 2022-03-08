friends(john, joe).
singer(mary).
even_number(14).
gives(john, book(mary)).

/*female(jane).
female(mary).
parent(john, jane).
parent(john, mary).*/
parents(X,Y),female(X):-sister(X,Y).
