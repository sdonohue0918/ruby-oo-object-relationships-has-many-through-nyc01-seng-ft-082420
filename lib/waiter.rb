class Waiter
 
    attr_accessor :name, :yrs_experience
   
    @@all = []
   
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
   
    def self.all
      @@all
    end


    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
      end

    #   As you can see, we don't need to take customer in as an argument, because we're passing in self as a reference to the current instance of customer. This method will allow us to create new meals as a customer, and automatically associate each new meal with the customer that created it. We can do the same thing for the Waiter class:


    def meals
        Meal.all.select do |meal|
          meal.waiter == self #checking for waiter now
        end
      end


      #To reinforce this concept, let's look at the same sort of relationship, but in the other direction. This time, we will build out methods so a waiter can find the customer that tips the the best.

    #Again to start, just like the customer, the waiter needs a way to get all the meals they have served. We'll create a #meals method again, with a subtle change:


    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip
        end
       
        best_tipped_meal.customer
      end


      #To find the best tipper, we can write another method, #best_tipper, use the array we get from #meals, then return the customer of the meal with the highest tip:


   
end