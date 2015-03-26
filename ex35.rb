def gold_room
  puts "this room is full of gold. how much do you take?"
  print "> "
  choice = $stdin.gets.chomp
  
  if choice.include?("0") ||  choice.include?("1")
    how_much = choice.to_i
  else
    dead("Man, learn to type a number.")
  end
  
  if how_much < 50
    puts "Nice, not too greedy, you win!"
    exit(0)
  else 
    dead("you greedy bastard!")
  end
end

def bear_room
	puts "There is a bear here."
  puts "The bear has a bunch of honey."
  puts "The fat bear is in front of another door."
  puts "How are you going to move the bear?"
  bear_moved = false

	while true
	  print"> "
	  choice = $stdin.gets.chomp
  
	  if choice == "take honey"
		dead("the bear slaps your face off")
	  elsif choice == "taunt bear" && !bear_moved
		puts "the bear has moved from the door.  You can proceed."
		bear_moved = true
	  elsif choice = "taunt bear" && bear_moved
		dead("the bear get annoyed and chews your leg off")
	  elsif choice == "open door" && bear_moved
		gold_room
	  else
		puts "what the fuck did you say?"
	  end
	end
end


def cthulhu_room
  puts "Here you see the great evil Cthulhu."
  puts "He, it, whatever stares at you and you go insane."
  puts "Do you flee for your life or eat your head?"

  print "> "
  choice = $stdin.gets.chomp

  if choice.include? "flee"
    start
  elsif choice.include? "head"
    dead("Well that was tasty!")
  else
    cthulhu_room
  end
end


def dead(why)
  puts why, "Good job!"
  exit(0)
end

def start
  puts "You are in a dark room."
  puts "There is a door to your right and left."
  puts "Which one do you take?"

  print "> "
  choice = $stdin.gets.chomp

  if choice == "left"
    bear_room
  elsif choice == "right"
    cthulhu_room
  else
    dead("You stumble around the room until you starve.")
  end
end

start