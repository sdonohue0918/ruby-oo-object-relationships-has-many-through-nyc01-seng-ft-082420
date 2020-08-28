class Customer
    attr_accessor :name, :age
   
    @@all = []
   
    def initialize(name, age)
      @name = name
      @age = age
      @@all << self
    end
   
    def self.all
      @@all
    end

    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
      end

    #   If you take a look at our customer right now, they aren't capable of doing much. Let's change that and give them the ability to create a meal. To do this, they'll need to take in an instance of a waiter and supply the total and tip, which we'll have defaulted to 0 here as well:

    def meals
        Meal.all.select do |meal|
          meal.customer == self
        end
      end

      def waiters
        meals.map do |meal|
          meal.waiter
        end
      end

      #So rachel.meals will return an array of all of Rachel's meals, but what if we now want a list of all of the waiters that Rachel has interacted with? Each meal is also associated with a waiter, so to get every waiter from every meal Rachel has had, we need to take the array of all of Rachel's meals, map over it, getting the waiter from each of those meals.

    #   Since we already have a #meals method to get an array of meals, we can reuse it here and write a #waiters method like the following:


   
end