class Dog
   def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
   end
   attr_accessor :name, :age
   attr_reader :breed

   def bark
     if @age > 3
        @bark.upcase
     else
      @bark.downcase
     end
   end

   def favorite_foods
    @favorite_foods
   end

   def favorite_food?(food)
    @favorite_foods.include?(food.capitalize)
   end
end
