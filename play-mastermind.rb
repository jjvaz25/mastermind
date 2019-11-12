require_relative 'codebreaker.rb'
require_relative 'codemaker.rb'

class Mastermind
  def initialize
    @codemaker = Codemaker.new
    @codebreaker = Codebreaker.new
    @code_to_break = @codemaker.create_code
    @code_copy = []
    @peg_array = [] 
    @white_peg_values = [] 
    @game_over = false
    @total_guesses = 0
    @guess = []
  end

  def match
    while @game_over != true
      @code_copy = @code_to_break.dup
      #p @code_copy #(this will reveal the code to break)
      @peg_array = [] 
      @white_peg_values = []
      @guess = []
      puts "You are currently on guess number #{@total_guesses+1}"
      puts "This is your last guess!" if @total_guesses == 11
      insert_black_pegs
      insert_white_pegs
      @white_peg_values.each { |color| @peg_array.push("white_peg") }
      @total_guesses += 1
      puts "\n"
      p @peg_array
      game_over?
      puts "\n\n\n"
    end
  end

  def insert_black_pegs
    @guess = @codebreaker.guess
    @code_copy.each_with_index do |color, index|
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
    if @peg_array == ["black_peg", "black_peg", "black_peg", "black_peg"]
      puts "Congrats! You cracked the code!"
      puts "Here is the code you cracked:"
      p @code_to_break
      @game_over = true
      return true
    elsif @total_guesses > 11
      puts "You failed to crack the following code:"
      p @code_to_break
      @game_over = true
      return true
    else
      return false
    end
  end

end

game = Mastermind.new
game.match

