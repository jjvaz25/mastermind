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