prime(A) :-
	A > 1,
	L is floor(sqrt(A)),
    % no divisors between 2 and the sqrt of A
	\+ (between(2, L, X),
    	0 is A mod X).

cube( A ) :-
    F is floor(sqrt( A )),
    between( 1, F, N ),
    A is N * N * N.

int_to_list( N, [N] ) :-
    between( 0, 9, N ).
int_to_list( N, YS ) :-
    between( 10, inf, N ),
    Q is N // 10,
    R is N mod 10,
    int_to_list( Q, XS ),
    append( XS, [R], YS ).
    
list_to_int(DS, N) :-
    list_to_int(DS, 0, N).
list_to_int([], D, D).
list_to_int([H|T], D, N) :-
    D1 is 10 * D + H,
    list_to_int(T, D1, N).

split_at( N, XS, L, R ) :-
   length(L,N),
   append(L,R,XS).

split_primes( [], [] ).
split_primes( XS, [PS|ZS] ) :-
    \+ nth0( 0, XS, 0 ),
    % Primes only have 1 - 4 digits
    between(1, 4, S),
    split_at( S, XS, PS, YS ),
    
    list_to_int( PS, P ),
    prime( P ),
    
    split_primes( YS, ZS ).

drop_first( [_|T], T ).
discard_smallest( XS, AS ) :-
    maplist( list_to_int, XS, YS ),
    sort( YS, S ),
    drop_first( S, ZS ),
    maplist( int_to_list, ZS, AS ).

split_cubes( [], [] ).
split_cubes( XS, [PS|ZS] ) :-
    % Cubes only have 1 - 4 digits
    between(1, 4, S),
    split_at( S, XS, PS, YS ),
    
    list_to_int( PS, P ),
    cube( P ),
    
    split_cubes( YS, ZS ).

% results repeated 4 times
generator4( PS ) :-
	permutation([0,1,2,3,4,5,6,7,8,9], XS),
    split_primes( XS, PS ).

tester4( X ) :-
    discard_smallest( X, Y ),
    reverse( Y, Z ),
    flatten( Z, F ),
    split_cubes( F, _ ).

main :-
    generator4( X ), tester4( X ), write( X ).
