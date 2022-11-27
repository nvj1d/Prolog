male(albert).
male(bob).
male(bill).
male(carl).
male(charlie).
male(dan).
male(edward).

female(alice).
female(betsy).
female(diana).

parent(albert, bob).
parent(albert, betsy).
parent(albert, bill).

parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).

parent(bob, carl).
parent(bob, charlie).

get_grandchild :- parent(albert, X), parent(X, Y),
    write("albert grand children are"), nl,
    write(Y).

get_sharedparent :- parent(X, carl), parent(X, charlie),
    format('~w ~s parent ~n', [X, "is the"]).

brother(bob, bill).

grandparent(X, Y) :- parent(Z, Y), parent(X, Z).

stabs(tybalt, mercutio, sword).
hates(romeo, X) :- stabs(X, mercutio, sword).

what_grad(5) :- write("Go to Kindergarten").
what_grad(6) :- write("Go to 1st Grade").
what_grad(Other) :- Grade is Other - 5,
    format('Go to grade ~w', [Grade]).


owns(albert, pet(cat, olive)).

customer(tom, smith, 20.55).
customer(sally, smith, 120.55).

get_cust_bal(Fname, Lname) :-
    customer(Fname, Lname, X),
    write(Fname), tab(1),
    format('~w owes us ~2f$ ~n', [Lname, X]).

vertical(line(point(X, Y),point(X, Y2))).
horizontal(line(point(X, Y),point(X2, Y))).


warm_blooded(penguin).
warm_blooded(human).

produce_milk(penguin).
produce_milk(human).

have_features(penguin).
have_hair(humain).

mammal(X) :- warm_blooded(X),
    produce_milk(X),
    have_hair(X).

