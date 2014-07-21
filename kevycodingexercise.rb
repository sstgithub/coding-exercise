require_relative 'secret' #Part of my assumptions (see below) - secret file is in same file directory as this test file.


# Coding problem statement(given): You are given a function 'secret()' that accepts a single integer parameter and returns an integer. In Ruby, write a program that determines if this function is an additive function [ secret(x+y) = secret(x) + secret(y) ] for all prime numbers under N where N is a given integer.

#Assumptions made:
	# 1. x and y are possible prime numbers below N. 
	# 2. If N itself is a prime number, it is not counted as a prime number under N. So, if user inputs the integer '7', the program I am writing will only test to see if secret(2+3+5) == secret(2) + secret(3) + secret(5) == secret(7)
	# 3. Secret function is defined in class Secret in file secret in the same file path as this program.
	# 4. User integer must be equal to or above '3' otherwise program will ask for another input. This is because 3 is the first integer that has a prime number below it (see assumption 2), so anything below it will probably break the secret function.

#Variables used and definitions:
	# 1. @user_int -- this is equal to N in the problem statement
	# 2. int -- this represents each number below N that is tested to see if it's a prime number or not
	# 3. num -- this represents a temporary increasing number below each integer that is being checked for 'primeness'. Each integer to be checked is divided by num and num is increased until finally num is more than or equal to integer being checked. For example: if the integer being checked was 5, then 5 would be divided by 2, then by 3, then by 4, using the modulus operator which just returns the remainder from the division. If the modulus returns 0 that means the integer being checked is not prime and it would stop there but in the case of 5, num would keep increasing until finally the loop ends because num equals the integer being checked - 5.
	# 4. prime_flag -- this means exactly what it says...it flags a number it is prime.
	# 5. @y_total and @secret_y_total -- see the adder function below

	#How I could make this better:
		# 1. When checking an integer to see if its prime, first take the square root of the integer, then only divide that integer by prime numbers that are below it. Doing both of these will significantly reduce the computation time required when dealing with very large numbers.

class KevyExercise
	def initialize
		puts "Enter your integer!"
		@user_int = gets.to_i
		compute(@user_int)
	end

	def self.compute(user_int)
		unless user_int >= 3 # this first loop assumes that integer has to be greater than 2 for this problem otherwise there will be no prime number integer to test in secret function as no prime number exists below 2
		puts "Please pick an integer that is greater than 2!"
		@user_int = gets.to_i
		

		else
			int = user_int - 1

			until int == 1
				check_if_prime(int)
				int -= 1
			end
		end

	
	end





	def self.check_if_prime(int)
		num = 2;
		prime_flag = true;

		until num >= int
			if int % num == 0
				prime_flag = false;
			else
				num += 1
			end
		end

		#if it goes through check_if_prime all the way till int == 0, and the modulus never equals 0 that means the number is prime and prime stays flagged as true and the number needs to be added to @y_total and to @secret_y_total. So:

		if prime_flag == true
			adder(int)
		end	
	end

	def self.adder(prime_int) # this function just adds the prime integer discovered in check_if_prime to @y_total which is equivalent to the 'x+y' in the problem statement, and it also runs the prime integer through the secret function than adds it to @secret_y_total which is the equivalent of 'secret(x) + secret(y)'' in the problem statement
		if @y_total 
			@y_total += prime_int
		else
			@y_total = prime_int
		end

		if @secret_y_total 
			@secret_y_total += secret(@y_total)
		else
			@secret_y_total = secret(@y_total)
		end

		#Ultimately the loops above should determine both the value of secret(x+y+...) and secret(x) + secret(y) + secret(...), where x, y, and ... are prime numbers below N.

		final(@y_total, @secret_y_total)
	end


	def self.final(y_total, secret_y_total) # this function outputs "Your hypothesis was correct!" if the secret function is an additive function of all prime numbers below N, or it outputs "Your hypothesis was incorrect." if the secret function is not an additive function of all prime numbers below N.
	#still should pass in parameters even if they are class variables?
		if secret(y_total) == secret_y_total == secret(@user_int)
			puts "Your hypothesis was correct!"
		else
			puts "Your hypothesis was incorrect."
		end
	end

end