#
# Othello Game Class
# Author(s): Nandigam, Blake Lapum, Cole Sellers
#

class Othello

  # Constants
  WHITE = 'W'
  BLACK = 'B'
  EMPTY = '-'
  TIE = 'T'

  # Creates getter methods for instance variables @size, @turn, @disc,
  # @p1Disc, and @p2Disc
  attr_reader  :size, :turn, :disc, :p1Disc, :p2Disc

	# Constructs and initializes the board of given size
	def initialize(size, startPlayer, discColor)
		# validate arguments
		if size < 4 || size > 8 || size % 2 != 0
			raise ArgumentError.new('Invalid value for board size.')
		end
		if startPlayer < 1 || startPlayer > 2
			raise ArgumentError.new('Invalid value for player number.')
		end
		if discColor != WHITE && discColor != BLACK
			raise ArgumentError.new('Invalid value for disc.');
		end

		# set instance variables
    @board = []
		@size = size
		@turn = startPlayer
		@disc = discColor

		# set two more instance variables @p1Disc and @p2Disc
		if @turn == 1
			@p1Disc = @disc
			@p2Disc = @disc == WHITE ? BLACK : WHITE
		else
			@p2Disc = @disc
			@p1Disc = @disc == WHITE ? BLACK : WHITE;
		end

		# create the grid (as array of arrays)
		@board = Array.new(@size)
		for i in (0...@board.length)
			@board[i] = Array.new(@size)
			@board[i].fill(0)
		end

		# initialize the grid
		initializeBoard()
	end

  # Initializes the board with start configuration of discs
  def initializeBoard()
    #
    # TO DO: complete this method
		#
		for i in (0...@board.length)
			for j in (0...@board.length)
				@board[i][j] = EMPTY
			end
		end

		@board[@size/2][@size/2] = BLACK
		@board[@size/2 - 1][@size/2 - 1] = BLACK
		@board[@size/2 - 1][@size/2] = WHITE
		@board[@size/2][@size/2 - 1] = WHITE

  end

  # Returns true if placing the disc of current player at row,col is valid;
  # else returns false
  def isValidMove(row, col)
  	return isValidMoveForDisc(row, col, @disc)
  end

	# Returns true if placing the specified disc at row,col is valid;
  # else returns false
	def isValidMoveForDisc(row, col, disc)
		if @board[row][col] != EMPTY
			return false
		end

    #
    # TO DO: add your code below
		#
		


    # DO NOT DELETE THE LINE BELOW
		return false	# if control reaches this point, then it's not a valid move
	end

	# Places the disc of current player at row,col and flips the opponent discs as needed
	def placeDiscAt(row, col)
		if (!isValidMove(row, col))
			return
		end

    #
    # TO DO: add your code below
    #


    # DO NOT DELETE THE CODE BELOW
		if (!isGameOver())
			prepareNextTurn();   # prepare for next turn
		end
	end

	# Sets @turn and @disc instance variables for next player
	def prepareNextTurn()
		if @turn == 1
			@turn = 2
		else
			@turn = 1
		end
		if @disc == WHITE
			@disc = BLACK
		else
			@disc = WHITE
		end
	end

	# Returns true if a valid move for current player is available;
  # else returns false
	def isValidMoveAvailable()
		isValidMoveAvailableForDisc(@disc)
  end

	# Returns true if a valid move for the specified disc is available;
  # else returns false
	def isValidMoveAvailableForDisc(disc)
    #
    # TO DO: add your code below
    #


    # DO NOT DELETE THE LINE BELOW
		return false;
	end

	# Returns true if the board is fully occupied with discs; else returns false
	def isBoardFull()
    #
    # TO DO: add your code below
		#
		for i in (0...@board.size)
			for j in (0...@board.size)
				if @board[i][j] == EMPTY
					return false
				end
			end
		end

    # DO NOT DELETE THE LINE BELOW
		return true;
	end

	# Returns true if either the board is full or a valid move is not available
  # for either disc
	def isGameOver()
		return isBoardFull() ||
					(!isValidMoveAvailableForDisc(WHITE) &&
								!isValidMoveAvailableForDisc(BLACK))
	end

	# If there is a winner, it returns Othello::WHITE or Othello::BLACK.
	# In case of a tie, it returns Othello::TIE
	def checkWinner()
		blackCount = 0
    whiteCount = 0

    #
    # TO DO: add your code below
    #
		for i in (0...@board.size)
			for j in (0...@board.size)
				if @board[i][j] == WHITE
					whiteCount = whiteCount + 1
				end
				if @board[i][j] == BLACK
					blackCount = blackCount + 1
				end
			end
		end


    # DO NOT DELETE THE CODE BELOW
		if blackCount == whiteCount
			return TIE
		end

		return blackCount > whiteCount ? BLACK : WHITE
	end

	# Returns a string representation of the board
	def to_s()
		str = "\n  "
		for i in (0...@size)
			str << (i+1).to_s + ' '
		end
		str << "\n";
		for i in (0...@size)
			str << (i+1).to_s + ' ';
			str << @board[i].join(' ') + "\n";
		end
		return str;
	end

end
