$board = {1 => [" "," "," "], 2 => [" "," "," "], 3 => [" "," "," "]}

$winner = " "

$play = "go"

def show(b)
system "clear"
spacing = "___|___|___"
i = 1
	while i < 4
       		puts "   |   |   "
   row1 = " " + b[i][0].to_s + " | " + b[i][1].to_s + " | " + b[i][2].to_s
        puts row1
      	 	if i < 3
                	then
               	 	puts spacing
                	else
                	puts "   |   |   "
        	end
        i+=1
	end
end

#WHO WON?
def endgame(b,winner)
 
	$full = "yes"
       		b.each do |r|
                	r[1].each do |c|
                        	if c != "x" and c != "o"
                                $full = "no"
                        end
                end
        end
        if $full == "yes"
                $winner = "You have tied the computer!"
                $play = "stop"
        end

(1..3).each do |row|
                if b[row][0] == "x" and b[row][1] == "x" and b[row][2] == "x"

                        $winner = "You have beat the computer!"
                        $play = "stop"
                elsif b[row][0] == "o" and b[row][1] == "o" and b[row][2] == "o"
                        $winner = "You have lost to the computer!"
                        $play = "stop"
                end

	(0..2).each do |col|
                if b[1][col] == "x" and b[2][col] == "x" and b[3][col] == "x"
                        $winner = "You have beat the computer!"
                        $play = "stop"
                elsif b[1][col] == "o" and b[2][col] == "o" and b[3][col] == "o"
                        $winner = "You have lost to the computer, you are bad"
                        $play = "stop"
                end

if b[1][0] == "x" and b[2][1] == "x" and b[3][2] == "x"
                $winner = "You have beat the computer!"
                $play = "stop"
        elsif b[3][0] == "x" and b[2][1] == "x" and b[1][2] == "x"
                $winner = "You have beat the computer!"
                $play = "stop"
        elsif b[1][0] == "o" and b[2][1] == "o" and b[3][2] == "o"
                $winner = "You have lost to the computer, you are bad"
                $play = "stop"
        elsif b[3][0] == "o" and b[2][1] == "o" and b[1][2] == "o"
                $winner = "You have lost to the computer, you are bad"
                $play = "stop"
        end



# (1..3).each do |row|
#                (0..2).each do |col|
#                        if b[row][col] == " "
#                                then
#                                $winner = "It is a tie, you are still bad"
#                                $play = "stop"
#                        end
#                end
#        end
end
end
end

$full = "yes"
$board.each do |r|
        r[1].each do |c|
                if c != "x" and c != "o"
                        $full = "no"
                end
        end
end


def move_comp(b)
	puts "Calculating the move to win as fast as possible"
	sleep 0.75
	row = rand(3) + 1
	place = rand(3)
	rand = [row,place]

  if b[row][place] == "o"
                puts "The computer is trying to cheat!"
                move_comp($board)
        elsif b[row][place] == "x"
                puts "The computer is trying to cheat!"
                move_comp($board)
        else
                b[row][place] = "o"
        end

show(b)
end



def move(b) 
	puts "Please tell me what row you want the X to go(1, 2 or 3)"
	row = gets.to_i

	puts "Please tell me what place inside of that row do you want the X to go(1, 2 or 3)"
	place = (gets.to_i - 1)
if	
	b[row][place] == "o" or b[row][place] == "x"	
	puts "That move is invalid, you are trying to cheat"
	move($board)
elsif b[row][place] = " "

then
	b[row][place] = "x"
end	
#if b[row][place] == "x"
#        then puts "That move is invalid"
#        puts "Please try another space"
#elsif b[row][place] == "o"
#        then puts "That move is invalid"
#        puts "Please try another space"
#else
#        b[row][place] = "x"
puts show(b)
end

while $play == "go"
	endgame($board,$winner)
	move_comp($board)
	endgame($board,$winner)
	break if $play != "go"
	move($board)
	endgame($board,$winner)

end

puts "Someone won!"
puts $winner
