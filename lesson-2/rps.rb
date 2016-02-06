# This is the class that holds the player's information, including their name
# and their move information.
class Player
  attr_accessor :move

  def initialize
  end

  # Chooses the player's move.
  def choose
  end
end

# Extends the Player class, includes methods for automated name and move
# decisions.
class ComputerPlayer < Player
  def choose
    self.move = Move.random_move
  end
end

# Extends the Player class, includes methods for manual input.
class HumanPlayer < Player
  def choose
    self.move = Move.new(prompt_move)
  end

  private

  def prompt_move
    puts "Pick your move (#{list_of_moves}):"
    choice = ''

    loop do
      choice = gets.chomp
      break if Move.valid_input? choice
      puts "Invalid input!"
    end

    choice
  end

  def list_of_moves
    Move::SHORTHAND_MAPPING.map do |key, value|
      "#{value} (#{key})"
    end.join(', ')
  end
end

# Holds the state and calculates whether or not it is better than another move
class Move
  VALUES = [:rock, :paper, :scissors].freeze
  SHORTHAND_MAPPING = { r: :rock, p: :paper, s: :scissors }.freeze
  RULES = { rock: [:scissors], paper: [:rock], scissors: [:paper] }.freeze

  attr_accessor :value

  # Digests the user's input.
  def initialize(input)
    @value = value_lookup input
  end

  # Returns a new random move.
  def self.random_move
    new(VALUES.sample)
  end

  # Decides whether or not the player's input (probably a string) is valid.
  def self.valid_input?(input)
    (SHORTHAND_MAPPING.keys + VALUES).include? input.to_sym
  end

  # Returns true if the caller wins over the passed move.
  def >(other_move)
    RULES[@value].include? other_move.value
  end

  # Returns true if the passed move wins over the caller.
  def <(other_move)
    RULES[other_move.value].include? @value
  end

  def to_s
    @value.to_s
  end

  private

  # Takes the input (usually a string) and looks up the value, returing it.
  def value_lookup(input)
    input_symbol = input.to_sym
    if VALUES.include? input_symbol
      input_symbol
    else
      SHORTHAND_MAPPING[input_symbol]
    end
  end
end

# class Rule
#   def initialize
#
#   end
# end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = HumanPlayer.new
    @computer = ComputerPlayer.new
  end

  def play
    loop do
      display_welcome_message
      human.choose
      computer.choose
      display_winner

      break unless play_again?
    end

    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to RPS!"
  end

  def display_goodbye_message
    puts "Goodbye!"
  end

  def display_winner
    puts "Player chose #{human.move}."
    puts "Computer chose #{computer.move}."

    if human.move > computer.move
      puts "Player wins!"
    elsif human.move < computer.move
      puts "Computer wins!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Invalid input!"
    end
    answer == 'y'
  end
end

RPSGame.new.play
