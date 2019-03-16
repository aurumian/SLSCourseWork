( Черезов Юри1 P3200)
( a -- 1/0)
: isEven 2 % not ;

( a -- 1/0)
( returns 1 if a is prime)
: isPrime 
    dup 1 > 
    swap 
    dup 2 / 1 + 2 for 
	dup r@ % rot land swap 
    endfor 
    drop 0 > 
;

( a -- address)
( returns address of the byte with answer)
: isPrime! isPrime 1 allot dup -rot c! ;

( a -- [a+1])
: inc 1 + ;

( str_addr -- length)
( returns lenght of null terminated string without counting ending 0)
: str_len dup 
    repeat 
	dup c@ swap inc 
	swap 
    not until 
    swap - 1 - 
;

( src_str_addr dest_str_addr -- last_symb_addr)
( returns address of the last symbol [null symbol] )
: str_copy 
    repeat 
	swap dup c@ rot dup rot dup rot c! 
	rot inc rot inc rot 
    not until 
    swap drop 1 - 
;

( str_addr1 str_addr2 -- str_addr)
: concat dup str_len rot dup str_len rot + inc heap-alloc dup -rot str_copy rot swap str_copy drop ;


( n -- n n1 n2 n3 ...)
: collatz 
    dup 1 > if
	repeat
	    dup 2 % if
		dup 3 * 1 +
	    else 
		dup 2 /
	    then
	dup 1 = until
    then
;
