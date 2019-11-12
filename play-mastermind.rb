require_relative 'codebreaker.rb'
require_relative 'codemaker.rb'

class Mastermind
  def initialize
    @codemaker = Codemaker.new
    @codebreaker = Codebreaker.new
    #@code_to_break = @codemaker.create_code
    @code_to_break = ["purple", "purple", "yellow", "purple"]
  end

  def match
    code_copy = @code_to_break
    peg_array = []
    white_peg_values = []
    p code_copy
    guess = @codebreaker.guess
    code_copy.each_with_index do |color, index|
      #p "#{color}: #{index}"
      if code_copy[index] == guess[index]
        peg_array.push("black_peg")
        code_copy[index] = "removed"
        guess[index] = "removed"
      elsif code_copy[index] != guess[index] && guess.include?(color)
        white_peg_values.push(color)
        white_peg_values = white_peg_values.uniq
      end
    end
    white_peg_values.each { |color| peg_array.push("white_peg") }
    # code_copy = @code_to_break (I don't think I need this line of code because 
    #the "removed" elements will be replaced with their proper terms in line 13)
    p peg_array
  end
end #class end

game = Mastermind.new
game.match


# TESTS
#["yellow", "orange", "yellow", "purple"]
#["yellow", "blue", "blue", "blue"]
#expect: black_peg
#result: black_peg, white_peg

#computer code: ["purple", "purple", "yellow", "purple"]
#my guess:      ["purple", "yellow", "purple", "blue"]
#actual result: ["black_peg", "white_peg", "white_peg", "white_peg"]
#expect result: [black_peg, white_peg, white_peg]


=begin

SAVE THIS..The below returns accurate black_peg, but doesn't pass the white peg
tests above

  def match
    peg_array = []
    white_peg_values = []
    p @code_to_break
    guess = @codebreaker.guess
    @code_to_break.each_with_index do |color, index|
      p "#{color}: #{index}"
      if @code_to_break[index] == guess[index]
        peg_array.push("black_peg")
      elsif @code_to_break[index] != guess[index] && guess.include?(color)
        white_peg_values.push(color)
        white_peg_values = white_peg_values.uniq
      end
    end
    white_peg_values.each { |color| peg_array.push("white_peg") }
    p peg_array
  end



=end
