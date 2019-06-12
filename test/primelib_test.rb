require 'minitest/autorun'
require_relative '../lib/primelib'

# Naive implementation of primality test
def is_prime(n)
  return false if n < 2
  return true  if n == 2

  (2..Math.sqrt(n).ceil).each do |num|
    return false if (n % num).zero?
  end

  true
end

describe Primelib do
  describe ".first_primes" do
    it "returns 20 elements" do
      assert_equal 20, Primelib.first_primes(20).size
    end

    it "returns only primes" do
      assert(Primelib.first_primes(40).all? { |x| is_prime(x) })
    end

    it "works for zero" do
      assert_equal [], Primelib.first_primes(0)
    end

    it "works for one" do
      assert_equal [2], Primelib.first_primes(1)
    end
  end
end
