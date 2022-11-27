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
have_hair(human).

mammal(X) :- warm_blooded(X),
    produce_milk(X),
    have_hair(X).

related(X, Y) :- parent(X, Y).

related(X, Y) :- parent(X, Z) , related(Z, Y).

double(X, Y) :- Y is X*2.

is_even(X) :- mod(X, 2) =:= 0.

say_hi :- write("what\'s your name? "), nl,
    read(X),
    write("Hi "),
    write(X).

fav_char :- write("what\'s your favourite char? "),
    get(X),
    format("the ascii value ~w is ", [X]),
    put(X), nl.


% read and write to and from files:

write_to_file(File, Text) :-
    open(File, write, Stream),
    write(Stream, Text), nl,
    close(Stream).

read_file(File) :- 
    open(File, read, Stream),
    get_char(Stream, Char1),
    process_stream(Char1, Stream),
    close(Stream).

process_stream(end_of_file, _) :- !.

process_stream(Char, Stream) :-
    write(Char),
    get_char(Stream, Char2),
    process_stream(Char2, Stream).

%looping:
count_to_10(10) :- write(10), nl.
count_to_10(X) :-
    write(X), nl,
    Y is X + 1,
    count_to_10(Y).


count_down(Low, High) :-
    between(Low, High, Z),
    Y is High - Z,
    write(Y), nl.

count_up(Low, High) :-
    X is High-Low,
    between(0, X, Z),
    Y is Low + Z,
    write(Y), nl.

guess_num :- loop(start).

loop(15) :- write("You guess it!").
loop(X) :- 
    X \= 15,
    write("Guess a number "),
    read(Guess),
    write(Guess),
    write(" is not the number try again "),
    nl,
    loop(Guess).

%write all elements in a list:

write_list([]).

write_list([Head|Tail]) :-
    write(Head),nl,
    write_list(Tail).

%join two strings:

join_str(Str1, Str2, Str3) :-
    name(Str1, StrList1),
    name(Str2, StrList2),
    append(StrList1, StrList2, StrList3),
    name(Str3, StrList3).

