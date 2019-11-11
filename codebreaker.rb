class Codebreaker
  def initialize
    @available_colors = ["blue", "red", "green", "orange", "purple", "yellow"]
    @guess = []
  end

  def guess
    i = 1
    while i < 5
      puts "Available colors: #{@available_colors}"
      puts "Choose color for slot #{i}"
      choice = gets.chomp.downcase
      valid_choice(choice)
      i += 1
    end
    @guess
  end

  def valid_choice(choice)
    if @available_colors.include?(choice)
      @guess.push(choice)
      p "Your current selections:"
      p @guess
    else
      choice_accepted = false
      until choice_accepted == true
        puts "Unauthorized selection. Please choose a valid color from 
        #{@available_colors}"
        choice = gets.chomp.downcase
        if @available_colors.include?(choice)
          @guess.push(choice)
          p "Your current selections:"
          p @guess
          choice_accepted = true
        end
      end
    end 
  end 

end #end class


human = Codebreaker.new
human.guess