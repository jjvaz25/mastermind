A game of mastermind played via the command line. This is a project under the 
Ruby curriculum provided by The Odin Project. I've actually never even heard of
Mastermind, let alone play it. Given my limited knowledge, the game may not be 
100% accurate in terms of the rules. Here is my understanding of the game:
  1) There are two players. One is the codemaker, the other is the codebreaker
  2) The codemaker privately sets 4 pegs in a row. The pegs can be of any color
  3) The codebreaker attempts to guess the code in 12 guesses or less
  4) The code must be accurate in full, as in the same color peg needs to be in
     the exact position of that of the codebmaker
  5) The codemaker must provide feedback after each guess by the codebreaker
    5a) A red peg indicates that the codebreaker guessed both the correct color
        and correct position
    5b) A white peg indicates that a correct color was chosen, but the position 
        of the color was incorrect
    5c) No pegs indicate that the guess is completely incorrect. No matching
        colors or positions. 

=begin thoughts

computer is the codemaker. Computer must randomly select 4 colors. There are
6 colors available to choose:
  [blue, red, green, orange, purple, yellow]

There are two colored pegs:
  [black = correct color AND location, red = correct color but incorrect location]

  Computer must
    1) Randomly select 4 of the above colors 

  
  Human must
    1) select 4 colors
  
  Computer must
    1) place pegs
  
  Things to think about. What is the best way to store color selections for computer
  and person? An array, a hash? Both the color name and color position matter,
  which makes me think an array is best. We can use the element name as the color
  and the index as the position match.

  Should I make one class with the codebreaker and codemaker players? Or a 
  seperate class for each player? Leaning toward 3 classes (codemaker, codebreaker
  and play-game)

  Codemaker methods
    1) randomly generate array with 4 of 6 colors
    2) randomly mix those 4 colors in an array
    3) identify the correct-ness of the player's guesses (feedback)
  
  codebreaker methods
    1) make a guess
  
  Game methods
    1) Game start
    2) Game over
  
  Loops
    1)loop starts with codebreaker guess
    2)loop continues with feedback from codemaker
    3)loop breaks after correct guess or 12 guesses

=end thoughts