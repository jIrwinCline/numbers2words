#!/user/bin/env ruby
require 'pry'

class String
  def evaluate
    #/---------------------------
    array_ones = {"0" => "", "1" => "one","2" => "two","3" => "three","4" => "four","5" => "five","6" => "six","7" => "seven","8" => "eight","9" => "nine","10" => "ten"}

    array_teens = {"0" => "ten", "1" => "eleven","2" => "twelve","3" => "thirteen","4" => "fourteen","5" => "fifteen","6" => "sixteen","7" => "seventeen","8" => "eighteen","9" => "nineteen"}

    array_tens = {"0" => "", "1" => "ten", "2" => "twenty","3" => "thirty","4" => "fourty","5" => "fifty","6" => "sixty","7" => "seventy","8" => "eighty","9" => "ninety"}

    array_hundreds = {"0" => "" , "1" => "one-hundred","2" => "two-hundred","3" => "three-hundred","4" => "four-hundred","5" => "five-hundred","6" => "six-hundred","7" => "seven-hundred","8" => "eight-hundred","9" => "nine-hundred"}

    array_thousands = {"0" => "" , "1" => "one-thousand","2" => "two-thousand","3" => "three-thousand","4" => "four-thousand","5" => "five-thousand","6" => "six-thousand","7" => "seven-thousand","8" => "eight-thousand","9" => "nine-thousand"}

    array_millions = {"0" => "" , "1" => "one-million","2" => "two-million","3" => "three-million","4" => "four-million","5" => "five-million","6" => "six-million","7" => "seven-million","8" => "eight-million","9" => "nine-million"}

    array_billions = {"0" => "" , "1" => "one-billion","2" => "two-billion","3" => "three-billion","4" => "four-billion","5" => "five-billion","6" => "six-billion","7" => "seven-billion","8" => "eight-billion","9" => "nine-billion"}

    array_trillions = {"0" => "" , "1" => "one-trillion","2" => "two-trillion","3" => "three-trillion","4" => "four-trillion","5" => "five-trillion","6" => "six-trillion","7" => "seven-trillion","8" => "eight-trillion","9" => "nine-trillion"}

    #/----------------------------
    split_number = self.split('').reverse
    @num_not_changed = self.split('').map(&:to_i).reverse
    # binding.pry

    i = 0
    word_array = []
    if split_number[i+1] == "1"
      num = split_number[i]
      word_array = word_array.push(array_teens.fetch(num))
      i = 2
    end

    while i < split_number.length do
      if i == 0
        num = split_number[i]
        word_array = word_array.push(array_ones.fetch(num))
      elsif i == 1
        num = split_number[i]
        word_array = word_array.push(array_tens.fetch(num))
      elsif i == 2
        num = split_number[i]
        word_array = word_array.push(array_hundreds.fetch(num))
      elsif i == 3
        num = split_number[i]
        word_array = word_array.push(array_thousands.fetch(num))
      elsif i == 4

        #// issues with statement below GOT THIS FIXED BUT ISSUES STILL
        #// 11700 causes issue and 1,022,000,000 doesn't say 'twenty-2'
        if split_number[i-1] == '0'
          word_array = word_array.push('thousand')
          # binding.pry
          if @num_not_changed[3] == 0 && @num_not_changed[4] == 0 && @num_not_changed[5] == 0
            pop = word_array.pop()
          end
        end
        num = split_number[i]
        word_array = word_array.push(array_tens.fetch(num))
      elsif i == 5
        num = split_number[i]
        word_array = word_array.push(array_hundreds.fetch(num))
        # Millions

      elsif i == 6
        if split_number[i+1] == "1"
          num = split_number[i]
          # binding.pry
          word_array = word_array.push(array_teens.fetch(num) + ' million')
          i = i + 2
        else
          if i == 6
            num = split_number[i]
            word_array = word_array.push(array_millions.fetch(num))
          elsif i == 7
            if split_number[i-1] == '0'
              word_array = word_array.push('million')
            end
            num = split_number[i]
            word_array = word_array.push(array_tens.fetch(num))
          end
        end
      elsif i == 8
        num = split_number[i]
        word_array = word_array.push(array_hundreds.fetch(num))

        # Billions
      elsif i == 9
        if split_number[i+1] == "1"
          num = split_number[i]
          # binding.pry
          word_array = word_array.push(array_teens.fetch(num) + ' billion')
          i = i + 2
        else
          if i == 9
            num = split_number[i]
            word_array = word_array.push(array_billions.fetch(num))
          elsif i == 10
            if split_number[i-1] == '0'
              word_array = word_array.push('billion')
            end
            num = split_number[i]
            word_array = word_array.push(array_tens.fetch(num))
          end
        end
      elsif i == 11
        num = split_number[i]
        word_array = word_array.push(array_hundreds.fetch(num))
      # Trillions
    elsif i == 12
      if split_number[i+1] == "1"
        num = split_number[i]
        # binding.pry
        word_array = word_array.push(array_teens.fetch(num) + ' trillion')
        i = i + 2
      else
        if i == 12
          num = split_number[i]
          word_array = word_array.push(array_trillions.fetch(num))
        elsif i == 13
          if split_number[i-1] == '0'
            word_array = word_array.push('trillion')
          end
          num = split_number[i]
          word_array = word_array.push(array_tens.fetch(num))
        end
      end
    elsif i == 14
      num = split_number[i]
      word_array = word_array.push(array_hundreds.fetch(num))

      end
      i = i + 1
    end
    word_array.reverse.join(' ')
  end
end

p "Git us the number"
new_integer = gets.chomp
p new_integer.evaluate
