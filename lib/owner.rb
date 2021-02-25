require 'cat.rb'
require 'dog.rb'

require 'pry'

class Owner 
  
  attr_reader :name, :species
  @@all = []
  
  def initialize(name)
    @name=name
    @species='human'
    @@all << self
    
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count 
  end

  def self.reset_all
    @@all = []
    @@all.count 
  end

  def cats
    #a array of cats that belong to the owner
    
    Cat.all.select do |var|
      var.owner == self
    end
    
  end

   def dogs
    Dog.all.select do |var|
      var.owner == self
    end
   end

    def buy_cat(name)
      Cat.new(name,self)
    end

    def buy_dog(name)
      Dog.new(name,self)
    end

    def walk_dogs
      #changes mood in Dog class to happy
      Dog.all.select do |var|
        if var.owner ==self
          var.mood = "happy"
        end
      end
    end

    def feed_cats
      #changes mood in Dog class to happy
      Cat.all.select do |var|
        if var.owner ==self
          var.mood = "happy"
        end
      end
    end

    def sell_pets
      Dog.all.select do |var|
        if var.owner ==self
          var.mood = "nervous"
          var.owner = nil
        end
      end
      Cat.all.select do |var|
        if var.owner ==self
          var.mood = "nervous"
          var.owner = nil
        end
      end
    end

    def list_pets
      #  = []
      # Dog.all.select do |var|
      #   if var.owner ==self
      #     all_pets << var
      #   end
      # end
      # Cat.all.select do |var|
      #   if var.owner ==self
      #     all_pets << var
      #   end
      # end
      # all_pets
      #binding.pry
      dog_count = dogs.count
      cat_count = cats.count
      "I have #{dog_count} dog(s), and #{cat_count} cat(s)."
    end
end

