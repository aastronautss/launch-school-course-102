class GoodDog
  DOG_YEARS = 7

  @@number_of_dogs = 0

  attr_accessor :name, :height, :weight, :age

  def initialize(name, height, weight, age)
    @name = name
    @height = height
    @weight = weight
    @age = age * DOG_YEARS

    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end

  def speak
    "#{name} says arf!".capitalize
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def to_s
    "#{self.name} weighs #{self.weight} and is #{self.height} tall
    and is #{self.age} dog years old."
  end
end

sparky = GoodDog.new("Sparky", "12 inches", '10 lbs', 2)
fido = GooDog.new("Fido", "24 inches", '100 lbs', 4)

puts fido.speak
puts sparky.speak

puts ''

puts sparky.info
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky

puts ''

puts "There exists #{GoodDog.total_number_of_dogs} dogs."
