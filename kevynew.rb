require_relative 'secret.rb' #assuming that there is a secret.rb file in same file path, with secret function inside it (see Readme.txt for all assumptions and function and variable definitions)


class KevyNew
	def initialize
	end

	def get_integer
		puts "Provide an integer for this program to use:"
		@user_int = gets.to_i
		while @user_int < 3 #this loop checks to make sure the given integer, user_int ('N' from the problem statement), is above 2, as otherwise there will be no prime numbers below N to test in secret function
			puts "Please provide an integer that is greater than or equal to 3:"
			@user_int = gets.to_i
		end
		compute(@user_int)
	end

	def compute(user_int)
		int = user_int - 1

		until int == 1
			check_if_prime(int)
			int -= 1
		end
	end

	def check_if_prime(int)
		num = 2;
		prime_flag = true;

		until num >= int
			if int % num == 0
				prime_flag = false;
				break
			else
				num += 1
			end
		end

		#if it goes through check_if_prime all the way till int == 0, and the modulus never equals 0 that means the number is prime and prime stays flagged as true and the number needs to be added to @y_total and to @secret_y_total. So:

		if prime_flag == true
			adder(int)
		end

	end


	def adder(prime_int) # this function just adds the prime integer discovered in check_if_prime to @y_total which is equivalent to the 'x+y' in the problem statement, and it also runs the prime integer through the secret function than adds it to @secret_y_total which is the equivalent of 'secret(x) + secret(y)'' in the problem statement
		if @y_total 
				@y_total += prime_int
		else
			@y_total = prime_int
		end

		if @secret_y_total 
			@secret_y_total += secret(prime_int)
		else
			@secret_y_total = secret(prime_int)
		end

	end

	def final(y_total, secret_y_total) # this function outputs "True..." if the secret function is an additive function of all prime numbers below N, or it outputs "False..." if the secret function is not an additive function of all prime numbers below N.
		if secret(@y_total) == @secret_y_total
			puts "True - the secret function is additive of all prime numbers below #{@user_int}."
		else
			puts "False - the secret function is not additive of all prime numbers below #{@user_int}."
		end
	end
end

kevy_new = KevyNew.new

kevy_new.get_integer
kevy_new.final(@y_total, @secret_y_total)