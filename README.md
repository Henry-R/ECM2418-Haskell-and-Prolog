# ECM2418 Haskell and Prolog

This was a project I completed during the ECM2418 Computer Languages and Representations module at the University of Exeter. 
In this project I achieved 75% (although I lost the remaining 25% to a single erroneous include statement in one file) 

## Specification
Each file represents a different problem I have to solve

### Light Show (Haskell)
My bedside clock displays the time and date using eight digits; for example,
at 9.43am on 28th June, the display would be

`09432806`

Each digit in the electronic display lights up some (or all) of seven light seg-
ments, the above display lighting up a total of 45 segments.
On one occasion recently, the displayed digits were all different and the total
number of lit segments was prime. The same was true exactly one day later.
Then, just one minute after the second occasion, the number of lit segments
was the average of the numbers of lit segments on those two previous occasions.
What was that third display?

The program should finish executing in under 1 second.

### Digital Trio
"I have a couple of subtraction problems for you”, George told Martha. Look:
N1 - N2 = N3 and N3 - N4 = N5. Can you solve them if I tell you that N1,
N3 and N5 are all three-digit whole numbers whose sum is less than 2000, the
same three non-zero digits appearing in all three numbers but no digit being
repeated within any of those numbers? N2 and N4 are both two-digit whole
numbers using two of the three digits mentioned above, and the first digit of
N1 is not equal to the first digit of N2.

The program must compute the answer in under 5 seconds.

### Easier to Ask the Audience
“I have forgotten the phone number!” complained Martha, about to phone a
friend. “So have I!” replied George, “but I have some vague memories of it.
It is a perfect square with all the digits different, and the last digit is equal
to the number of digits to be dialled. The last-but-one digit is odd and one
of the digits is zero. Also the second and third and last-but-one digits are all
exact multiples of the first digit. Maybe you can work it out.”

Martha proceeded to dial the number correctly.

What number did she dial?

The program must compute the answer in under 2 seconds.

### Cube Route
I have a set of ten cards, each of which has a different digit written on it. All
the cards have been used to make a set of prime numbers. After discarding
the smallest prime, and without changing the order of any cards, I have placed
the remaining primes in order of decreasing size to give a large number. It is
possible, without changing the order of any cards, to break this number into
a set composed entirely of cubes. Neither set contains a number with more
than four digits.

List, in order of decreasing size, my set of prime numbers.

The program must compute the answer in under 120 seconds.
