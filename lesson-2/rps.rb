# This is the class that holds the player's information, including their name
# and their move information.
class Player
  attr_accessor :move

  def initialize
  end

  # Chooses the player's move.
  def choose(move_history)
  end

  def computer?
  end

  def human?
  end
end

# Extends the Player class, includes methods for automated name and move
# decisions.
class ComputerPlayer < Player
  LOSS_MULTIPLIER = 0.9
  VICTORY_MULTIPLIER = 1.1

  def initialize
    @move_weights = {}
    populate_move_weights
  end

  def choose(move_history)
    update_move_weights(move_history)
    @move = weighted_random_move
  end

  def computer?
    true
  end

  def human?
    false
  end

  def to_s
    "Computer"
  end

  private

  def populate_move_weights
    Move::VALUES.each { |value| @move_weights[value] = 1.0 }
  end

  def update_move_weights(move_history)
    recent = move_history.most_recent_event
    return if recent.nil? || recent.winner.nil?

    if recent.winner.computer?
      adjust_weights(recent.computer.move, VICTORY_MULTIPLIER)
    elsif recent.winner.human?
      adjust_weights(recent.computer.move, LOSS_MULTIPLIER)
    end
  end

  def adjust_weights(move, multiplier)
      value = move.value
      @move_weights[value] *= multiplier
  end

  def weighted_random_move
    value = @move_weights.max_by { |_, weight| rand**(1.0 / weight) }.first
    Move.new(value)
  end
end

# Extends the Player class, includes methods for manual input.
class HumanPlayer < Player
  def choose(move_history)
    self.move = Move.new(prompt_move)
  end

  def computer?
    false
  end

  def human?
    true
  end

  def to_s
    "Player"
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
  VALUES = [:rock, :paper, :scissors, :lizard, :spock].freeze
  SHORTHAND_MAPPING = { r: :rock,
                        p: :paper,
                        s: :scissors,
                        l: :lizard,
                        sp: :spock }.freeze
  RULES = { rock: [:scissors, :lizard],
            paper: [:rock, :spock],
            scissors: [:paper, :lizard],
            lizard: [:spock, :paper],
            spock: [:rock, :scissors] }.freeze

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

class MoveHistory
  class Event
    attr_accessor :human, :computer, :winner

    def initialize(human, computer, winner)
      @human = human.clone
      @computer = computer.clone
      @winner = (winner ? winner.clone : nil)
    end
  end

  def initialize
    @list = []
  end

  def add_event(human, computer, winner)
    @list << Event.new(human, computer, winner)
  end

  def most_recent_event
    @list.last
  end

  def computer_winning_moves
    events = @list.select { |event| event.winner && event.winner.computer? }
    events.map { |event| event.computer.move }
  end

  def computer_losing_moves
    events = @list.select { |event| event.winner && event.winner.human? }
    events.map { |event| event.computer.move }
  end
end

class RPSGame
  attr_accessor :human, :computer, :score, :move_history

  def initialize
    @human = HumanPlayer.new
    @computer = ComputerPlayer.new
    @move_history = MoveHistory.new
  end

  # Main execution loop.
  def play
    display_welcome_message
    loop do
      reset_score

      loop do
        display_score
        human.choose(@move_history)
        computer.choose(@move_history)
        round_winner_sequence
        break if someone_won?
      end

      display_game_winner
      break unless play_again?
    end

    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to RPS!"
  end

  def display_goodbye_message
    puts "Thanks for playing RPS. Goodbye!"
  end

  def reset_score
    @score = { @human => 0, @computer => 0 }
  end

  def display_score
    puts "Player: #{@score[human]}"
    puts "Computer: #{@score[computer]}"
  end

  def round_winner_sequence
    display_moves
    winner = calculate_winner
    add_to_history(winner)
    display_round_winner(winner)
  end

  def display_moves
    puts "Player chose #{human.move}."
    puts "Computer chose #{computer.move}."
  end

  def calculate_winner
    winner = nil

    if human.move > computer.move
      winner = human
    elsif human.move < computer.move
      winner = computer
    end

    score[winner] += 1 if winner
    winner
  end

  def add_to_history(winner)
    move_history.add_event(human, computer, winner)
  end

  def display_round_winner(winner)
    if winner
      puts "#{winner} wins this round!"
    else
      puts "It's a tie!"
    end
  end

  def display_game_winner
    winner = (@score[human] == 5 ? 'Player' : 'Computer')
    puts "#{winner} wins the match!"
  end

  def someone_won?
    @score.values.any? { |value| value >= 5 }
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
