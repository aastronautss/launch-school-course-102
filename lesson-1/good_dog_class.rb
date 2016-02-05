class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end

  def speak
    "#{self.name} says arf!"
  end
end

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

class Cat < Animal
end

sparky = GoodDog.new("brown")
paws = Cat.new

puts sparky.speak
puts paws.speak
