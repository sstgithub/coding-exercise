
def compute(user_int)
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

	if prime_flag == true
		adder(int)
	end

end


def adder(prime_int)
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

def secret(y) #placeholder for calling an outside file function here
	y = y * 2
end

def final(y_total, secret_y_total)
	if secret(@y_total) == @secret_y_total
		puts "True - the secret function is additive of all prime numbers below N"
	else
		puts "False - the secret function is not additive of all prime numbers below N"
	end
end

puts "Enter your integer!"
@user_int = gets.to_i
compute(@user_int)
# puts "#{@y_total} is sum of prime ints."
# puts "#{@secret_y_total} is sum of prime ints put in secret function one by one."
final(@y_total, @secret_y_total)