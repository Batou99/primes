# Find the n first primes using the Sieve of Erathostenes method
class Primelib
  class << self
    def first_primes(num)
      raise ArgumentException unless num.is_a?(Integer)
      return [] if num.zero?
      sieve((2..upper_bound(num)).to_a).first(num)
    end

    private

    def sieve(list)
      return [] if list == []

      prime, *rest = *list

      rest.delete_if { |x| (x % prime).zero? }

      [prime, sieve(rest)].flatten
    end

    # Aproximation based on the asymptotic law of distribution of prime numbers
    # The aproximation works for np > 55 (305 elements on the sieve) so we
    # return at least 305 to be on the safe side
    def upper_bound(num_primes)
      # NOTE: log is NaN if num_primes == 1 so we assume we just want to scan
      # up to 2 if the requested num_primes is less or equal to 1
      return 2 if num_primes <= 1

      aprox = num_primes * Math.log(num_primes) * Math.log(Math.log(num_primes))

      [305, aprox].max
    end
  end
end
