class Codemaker

  def initialize
    @color_options = ["blue", "red", "green", "orange", "purple", "yellow"]
    @chosen_code = []
  end

  def create_code
    #method to pick random numbers between 0-5, each corresponding with an index
    #of @color_options
    4.times do |number|
      number = rand(6)
      @chosen_code.push(@color_options[number])
    end
    p @chosen_code
    @chosen_code
  end

end

computer = Codemaker.new

