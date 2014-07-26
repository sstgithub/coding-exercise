# Assuming that there is a secret.rb file in same file path, with secret
#  function inside it (see Readme.txt for all assumptions and function and
#  variable definitions)
require_relative 'secret.rb'

class KevyFinal
  # obtain the integer from user first and then call compute method
  def obtain_integer
    puts 'Provide an integer for this program to use:'
    @user_int = gets.to_i
    # this loop checks to make sure the given integer, user_int ('N' from the
    #  problem statement), is above 2, as otherwise there will be no prime
    #  numbers below N to test in secret function
    while @user_int < 3
      puts 'Please provide an integer that is greater than or equal to 3:'
      @user_int = gets.to_i
    end
    compute
  end

  def compute
    int = @user_int - 1

    until int == 1
      check_if_int_is_prime(int)
      int -= 1
    end
  end

  def check_if_int_is_prime(int)
    num_to_divide_by = 2
    prime_flag = true
    until num_to_divide_by >= int
      if int % num_to_divide_by == 0
        prime_flag = false
        break
      else
        num_to_divide_by += 1
      end
    end
    # if int stays flagged as prime then it is passed to adder function so it
    #  can be added to @y_total and @secret_y_total
    adder(int) if prime_flag
  end

  # @y_total is equivalent to the 'x+y' and @secret_y_total is equivalent to
  #  'secret(x)+secret(y)' in the problem statement
  def adder(prime_int)
    # Adds the prime integer to @y_total
    if @y_total
      @y_total += prime_int
    else
      @y_total = prime_int
    end

    # Runs secret function on prime integer and adds it to @secret_y_total
    if @secret_y_total
      @secret_y_total += secret(prime_int)
    else
      @secret_y_total = secret(prime_int)
    end
  end

  # Outputs "True..." if the secret function is an additive function of all
  #  prime numbers below N, or outputs "False..." if the secret function is
  #  not an additive function of all prime numbers below N.
  def result
    if secret(@y_total) == @secret_y_total
      puts "True - the secret function is additive of all prime numbers below #{@user_int}."
    else
      puts "False - the secret function is not additive of all prime numbers below #{@user_int}."
    end
    # # print variables to test if rest of function worked
    # puts @y_total, @secret_y_total
  end
end

kevy_final = KevyFinal.new

kevy_final.obtain_integer
kevy_final.result
