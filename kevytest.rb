#this will just test by printing each prime number for each user input I put in. 




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
		puts int 
		puts " is a prime number."
	end

end

puts "Enter your integer!"
@user_int = gets.to_i
compute(@user_int)