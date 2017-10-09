# PHASE 2
def convert_to_int(str)

  Integer(str)
rescue ArgumentError
  return nil
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
begin
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
raise ArgumentError.new("That is not a fruit and not coffee.")
  end
rescue ArgumentError
  if maybe_fruit == "coffee"
    feed_me_a_fruit
  end
end
end


def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime

    if @yrs_known < 5
      raise ArgumentError.new("We can't be best friends...yet ;) ")
    end

    if @name.length < 1
      raise ArgumentError.new("You need a name.")
    end

    if @fav_pastime.length < 1
      raise ArgumentError.new("You need a hobby.")
    end 
  end


  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."

  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
