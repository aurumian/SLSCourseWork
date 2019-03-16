." isEven test:\n"
." 38 isEven . \n"
38 isEven . ." \n"
." 69 isEven . \n"
69 isEven . ." \n"
." \nisPrime test: \n"
." 111 isPrime . \n"
111 isPrime . ." \n"
." 113 isPrime .\n"
113 isPrime . ." \n\n"

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
