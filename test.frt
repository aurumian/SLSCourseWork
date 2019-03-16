( parameter correct_answer answer -- )
: logNumTest
    dup rot dup rot = if 
	( answer is correct )
	swap
	." Answer for argument: " rot . ." . OK\n"
	drop drop
    else
	swap
	." Wrong answer: " . ."  Expected: " .  ." For argument " . ." \n"
    then
;

." isEven tests:\n"
38 1 38 isEven
logNumTest
69 0 69 isEven
logNumTest

." \nisPrime tests: \n"
-1 0 -1 isPrime
logNumTest
0 0 0 isPrime
logNumTest
1 0 1 isPrime
logNumTest
2 1 2 isPrime
logNumTest
3 1 3 isPrime
logNumTest
111 0 111 isPrime
logNumTest
113 1 113 isPrime
logNumTest

( testing str_copy)
." testing str_copy: \n"
m" string"
heap-show
dup
str_len
inc
heap-alloc
dup
rot
dup
rot
str_copy
.S
drop
dup
prints

heap-free
heap-free
." \n\n"

( testing concat)
." concat test:\n"
m" Hello "
m" World!"

dup
rot
dup
rot
concat
dup
heap-show
prints
." \n"
heap-free

heap-free
heap-free
