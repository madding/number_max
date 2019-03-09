# frozen_string_literal: true

require 'thor'
require 'benchmark'

module NumberMax
  class CLI < Thor
    desc 'nmax n', 'Max n numbers from input'
    def nmax(maximum_numbers)
      counter = NumberMax::Counter.new(maximum_numbers.to_i)

      while line = STDIN.gets
        counter.call(line)
      end

      p counter.result
    end
  end
end
