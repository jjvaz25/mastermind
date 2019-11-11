require_relative 'codebreaker.rb'
require_relative 'codemaker.rb'

class Mastermind
  def initialize
    @codemaker = Codemaker.new
    @codebreaker = Codebreaker.new
    @code_to_break = @codemaker.create_code
  end

  def match
    peg_array = []
    p @code_to_break
    guess = @codebreaker.guess
    @code_to_break.each_with_index do |color, index|
      p "#{color}: #{index}"
      if @code_to_break[index] = guess[index]
        peg_array.push("black_peg")
      end
    end
    p peg_array
  end
      
=begin
      if guess.index(color) != nil
        peg_array.clear
        peg_array.push "black_peg"
      elsif guess.index(color) == nil && guess.include?(color)
        peg_array.push("white_peg")
      end  # if this returns something != nil we have a black peg (BUT if repeat colors were chosen we'd accidentally give two black pegs instead of 1)
      p guess.include?(color) # white peg if true
    end
=end 

end #class end

game = Mastermind.new
game.match