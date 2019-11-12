require_relative 'codebreaker.rb'
require_relative 'codemaker.rb'

# finished turn guessing loop, game over method.
class Mastermind
  def initialize
    @codemaker = Codemaker.new
    @codebreaker = Codebreaker.new
    #@code_to_break = @codemaker.create_code
    @code_to_break = ["yellow", "orange", "yellow", "purple"]
    @code_copy = []
    @peg_array = [] #maybe delete this if insert black peg breaks
    @white_peg_values = [] #maybe delete this if insert black peg breaks
    @game_over = false
    @total_guesses = 0
    @guess = []
  end

  def match
    while @game_over != true
      @code_copy = @code_to_break
      puts "Code copy1: #{@code_copy}"
      puts "Code code_2_br: #{@code_to_break}"
      @peg_array = [] 
      @white_peg_values = []
      @guess = []
      puts "You are currently on guess number #{@total_guesses+1}"
      puts "This is your last guess!" if @total_guesses == 11
      puts "before pegs methods, code2br: #{@code_to_break}"
      insert_black_pegs
      insert_white_pegs
      @white_peg_values.each { |color| @peg_array.push("white_peg") } #maybe include this in insert_white_pegs
      @total_guesses += 1
      p @peg_array
      game_over?
      p @code_to_break
    end
  end

  def insert_black_pegs
    @guess = @codebreaker.guess
    @code_copy.each_with_index do |color, index|
      #p "#{color}: #{index}"
      if @code_copy[index] == @guess[index]
        @peg_array.push("black_peg")
        @code_copy[index] = "removed"
        @guess[index] = "removed"
      end
    end
    @peg_array
  end

  def insert_white_pegs
    @code_copy.each_with_index do |color, index|
      next if @code_copy[index] == "removed"
      if @code_copy[index] != @guess[index] && @guess.include?(color)
        @white_peg_values.push(color)
        @white_peg_values = @white_peg_values.uniq
      end
    end
  end
  
  def game_over?
    if @peg_array == ["black_peg", "black_peg", "black_peg", "black_peg"]#I may be able to refactor this as peg_array[3] == "black_peg"
      puts "Congrats! You cracked the code!"
      @game_over = true
      return true
    elsif @total_guesses > 11
      puts "You failed to crack the code."
      @game_over = true
      return true
    else
      return false
    end
  end

end #class end

game = Mastermind.new
game.match


# TESTS
#["yellow", "orange", "yellow", "purple"]
#["yellow", "blue", "blue", "blue"]
#expect: black_peg
#result: black_peg, white_peg

#2nd round my guess ["orange", "blue", "blue", "blue"] (make sure you don't see removed)

#computer code: ["purple", "purple", "yellow", "purple"]
#my guess:      ["purple", "yellow", "purple", "blue"]
#actual result: ["black_peg", "white_peg", "white_peg", "white_peg"]
#expect result: [black_peg, white_peg, white_peg]

#comp code: ["purple", "purple", "yellow", "purple"]
#guess:     ["green", "red", "red", "purple"]
#actual result: ["black_peg", "white_peg"]
#expected result: [black peg]



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


---the below works with white beg
    def match
    @code_copy = @code_to_break
    #peg_array = [] remove comment if breaks to revert
    #white_peg_values = [] remove comment if breaks to revert
    p @code_copy
    guess = @codebreaker.guess
    @code_copy.each_with_index do |color, index|
      #p "#{color}: #{index}"
      if @code_copy[index] == guess[index]
        @peg_array.push("black_peg")
        @code_copy[index] = "removed"
        guess[index] = "removed"
      elsif @code_copy[index] != guess[index] && guess.include?(color)
        white_peg_values.push(color)
        white_peg_values = white_peg_values.uniq
      end
    end
    white_peg_values.each { |color| @peg_array.push("white_peg") }
    # @code_copy = @code_to_break (I don't think I need this line of code because 
    #the "removed" elements will be replaced with their proper terms in line 13)
    p @peg_array
  end

=end
