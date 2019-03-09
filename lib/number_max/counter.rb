# frozen_string_literal: true

module NumberMax
  class Counter
    attr_reader :result_number_amount, :current_length

    def initialize(n)
      @result_number_amount = n
      @current_length = 0
      @result = []
    end

    def call(data)
      current_number = ''
      data.each_char do |char|
        if number?(char)
          current_number += char
        else
          next if current_number == ''
          check_new_number(current_number)
          current_number = ''
        end
      end

      check_new_number(current_number) if current_number != ''

      result
    end

    def result
      @result[0...@result_number_amount]
    end

    private

    def check_new_number(new_number)
      if new_number.length > current_length
        @current_length = new_number.length
        @result = [new_number]
      elsif new_number.length == current_length && @result.length < @result_number_amount
        @result << new_number
      end
    end

    def number?(char)
      ('0'..'9').cover?(char)
    end
  end
end
