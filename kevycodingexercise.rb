require_relative 'secret' #Part of my assumption - secret file is in same file directory as this test file.

class KevyExercise
	# Coding problem statement(given): You are given a function 'secret()' that accepts a single integer parameter and returns an integer. In Ruby, write a program that determines if this function is an additive function [ secret(x+y) = secret(x) + secret(y) ] for all prime numbers under N where N is a given integer.

	#Assumptions made:
	#Variables used and definitions:


	def initialize
		puts "Enter your integer!"
		@user_int = gets.to_i
		compute(user_int)
	end

	def self.compute(user_int)
		if user_int >= 3 # this if-else loop assumes that integer has to be greater than 2 for this problem otherwise there will be no prime number integer to test in secret as there is no prime number below 2
			int = user_int - 1
			until int == 0
				check_if_prime(int)
				int -= 1
			end
		else
			puts "Please pick an integer that is greater than 2!"
			initialize
		end
	end

	def self.compute(user_int)
		if user_int >= 3 # this if-else loop assumes that integer has to be greater than 2 for this problem otherwise there will be no prime number integer to test in secret as there is no prime number below 2
			int = user_int - 1
			until int == 0
				check_if_prime(int)
				int -= 1
			end

			if prime_flag == true
				adder(int)
			end

			final...
		else
			puts "Please pick an integer that is greater than 2!"
			initialize
		end
	end





	def self.check_if_prime(int)
		num = 2;
		prime_flag = true;

		while num < int
			if int % num == 0
				prime_flag = false;
			else
				num += 1
			end
		end

		#if it goes through and the modulus never equals 0 that means the number is prime and prime stays flagged as true. In this case:

		if prime_flag == true
			adder(int)
		end
	end

	def self.adder(int)
		if @y_total #possible to clean this up by using ||= operator instead?
			@y_total += int
		else
			@y_total = int
		end

		if @secret_y_total #possible to clean this up by using ||= operator instead?
			@secret_y_total += secret(@y_total)
		else
			@secret_y_total = secret(@y_total)
		end
	end

	def self.final #still should pass in parameters even if they are class variables.
		if secret(@y_total) == @secret_y_total == secret(@user_int)
			puts "Your hypothesis was correct!"
		else
			puts "Your hypothesis was incorrect."
		end
	end

end