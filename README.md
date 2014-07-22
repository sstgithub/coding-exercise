### Coding problem statement: 
> You are given a function 'secret()' that accepts a single integer parameter and returns an integer. In Ruby, write a program that determines if this function is an additive function [ secret(x+y) = secret(x) + secret(y) ] for all prime numbers under N where N is a given integer.

#### Assumptions made:
1. The objective is to write a program that will find all the prime numbers below a given integer (that the user will put in) and then see if secret(prime#1+prime#2+prime#(N-1)) == secret(prime#1) + secret(prime#2) + secret(prime#(N-1)) is true for each of these prime numbers
2. If N itself is a prime number, it is not counted as a prime number under N. So, if user inputs the integer '7', the program I am writing will only test to see if secret(2+3+5) == secret(2) + secret(3) + secret(5)
3. Secret function is defined in file 'secret.rb' in the same file path as this program.
4. User integer must be equal to or above '3' otherwise program will ask for another input. This is because 3 is the first integer that has a prime number below it (see assumption 2), so I assumed that anything below it will break the secret function as there would be no prime numbers to test in it.

#### Variables used and definitions:
1. @user_int -- this is equal to N in the problem statement
2. int -- this represents each number below N that is tested to see if it's a prime number or not
3. num -- this represents a temporary increasing number below each integer that is being checked for 'primeness'. Each integer to be checked is divided by num and num is increased until finally num is more than or equal to integer being checked. For example: if the integer being checked was 5, then 5 would be divided by 2, then by 3, then by 4, using the modulus operator which just returns the remainder from the division. If the modulus returns 0 that means the integer being checked is not prime and it would stop there but in the case of 5, num would keep increasing until finally the loop ends because num equals the integer being checked - 5.
4. prime_flag -- this means exactly what it says...it flags a number if it is prime.
5. @y_total and @secret_y_total -- see the adder function in program.

#### More on my thought process:
* The kevytest file was created so I could first test and figure out the best way to flag all the prime numbers below a user input integer. From there I went on to coding the full app which also called the secret function. I created a secret.rb file with a possible secret function based on the problem statement, just to be able to fully test my actual program.

#### How I could make this better:
1. When checking an integer to see if its prime, I could first take the square root of the integer, then only divide that integer by prime numbers that are below it. Doing both of these will significantly reduce the computation time required when dealing with very large numbers.
2. Provide some loading messages such as '25% complete', '50% complete' etc so user has some indication of when program will complete when dealing with very large numbers.
