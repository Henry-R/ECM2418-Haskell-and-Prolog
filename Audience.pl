perfect_square(X) :-
    S is floor(sqrt(X)),
    X is S * S.

odd(X) :-
    X > 0,
    1 is mod(X, 2).

divides(X, Y) :-
    X > 0, Y > 0,
    0 is mod(Y, X).

exists_zero([0|_]).
exists_zero([_|XS]) :-
    exists_zero(XS).

distinct([]).
distinct([X|XS]) :-
    \+ member(X, XS),
    distinct(XS).

num_to_list(N,[N]):-
   N < 10.
num_to_list(N,Ys):-
   between(10, inf, N),
   Q is N // 10,    % Quotient
   R is (N mod 10), % Remainder
   num_to_list(Q,Xs),
   append(Xs,[R], Ys).

generator3(X) :-
    between(1000, 1000000, X),
    perfect_square(X).

tester3(X) :-
    num_to_list(X, XS),
    distinct(XS),
    length(XS, L),
	L1 is L - 2,
    L2 is L - 1,
    nth0(0, XS, FST),  % First
	nth0(1, XS, SND),  % Second
    nth0(2, XS, TRD),  % Third
    nth0(L2, XS, LST), % Last
    nth0(L1, XS, LBO), % Last but one
    % Last equal to number
	LST is L,
    % Last but one odd
    odd(LBO),
    % One digit zero
    exists_zero(XS),
    % Multiples of first digit
    divides(FST, SND),
    divides(FST, TRD),
	divides(FST, LBO).

main :-
    generator3(N), tester3(N), write(N).
    