# OOP Book Exercises

## I. The Object Model

### 1.

We create an object in Ruby by calling the `.new` method on the class from which we want the object to be.

```ruby
class Person
end

fred = Person.new
```

### 2.

A module is a way of adding pre-fab functionality to a class, without being a class itself. It achieves this by adding mixins to a class, which are pre-written methods made to serve more general purposes. It is a form of polymorphism.

```ruby
module Walk
end

class Person
  include Walk
end

fred = Person.new
```

## II. Classes and Objects I

```ruby
class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "Vrooom!"
  end

  def brake
    @current_speed -= number
    puts "Brrrrrt!"
  end

  def shut_off
    speed = 0
    puts "Chugga chugga chug"
  end

  def current_speed
    "#{@current_speed} mph"
  end

  def spray_paint(color)
    self.color = color
    puts "Your car is now #{color}!"
  end
end

puts "Welcome to Car!"
puts "Which year would you like your car to be?"
year = gets.chomp.to_i
puts "What color?"
color = gets.chomp
puts "What model do you want?"
model = gets.chomp

the_car = MyCar.new(year, color, model)

loop do
  puts "Do you want to change the color? (y/n)
  choice = gets.chomp
  if choice.downcase.start_with?('y')
    puts "Which color?"
    new_color = gets.chomp
    the_car.spray_paint(new_color)
  else
    break
  end
end

puts "Bye!"
```

## III. Classes and Objects II

### 1. and 2.

```ruby
class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def self.gas_mileage(miles_driven, gallons_consumed)
    miles_driven / gallons_consumed
  end

  def to_s
    "This car is a #{color} #{year} #{model}. Such taste!"
  end

  def speed_up(number)
    @current_speed += number
    puts "Vrooom!"
  end

  def brake
    @current_speed -= number
    puts "Brrrrrt!"
  end

  def shut_off
    speed = 0
    puts "Chugga chugga chug"
  end

  def current_speed
    "#{@current_speed} mph"
  end

  def spray_paint(color)
    self.color = color
    puts "Your car is now #{color}!"
  end
end

puts "Welcome to Car!"
puts "Which year would you like your car to be?"
year = gets.chomp.to_i
puts "What color?"
color = gets.chomp
puts "What model do you want?"
model = gets.chomp

the_car = MyCar.new(year, color, model)

loop do
  puts "Do you want to change the color? (y/n)
  choice = gets.chomp
  if choice.downcase.start_with?('y')
    puts "Which color?"
    new_color = gets.chomp
    the_car.spray_paint(new_color)
  else
    break
  end
end

puts the_car

puts "Bye!"
```

### 3.

There is no setter method for `@name`. We need to either define one called `name=` or add it to `attr_writer` (or `attr_accessor`).

## IV. Inheritance

### 1., 2., 3., 4., 5., 6.

```ruby
module Lodable
  def can_take_load?(weight)
    weight <= 2000
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year, :model

  @@number_of_vehicles

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0

    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    @@number_of_vehicles
  end

  def self.gas_mileage(miles_driven, gallons_consumed)
    miles_driven / gallons_consumed
  end

  def to_s
    "This car is a #{color} #{year} #{model}. Such taste!"
  end

  def speed_up(number)
    @current_speed += number
    puts "Vrooom!"
  end

  def brake
    @current_speed -= number
    puts "Brrrrrt!"
  end

  def shut_off
    speed = 0
    puts "Chugga chugga chug."
  end

  def current_speed
    "#{@current_speed} mph"
  end

  def spray_paint(color)
    self.color = color
    puts "Your car is now #{color}!"
  end

  def print_age
    "This vehicle is #{age_in_years} old!"
  end

  private

  def age_in_years
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  NUMBER_OF_WHEELS = 4
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  include Loadable

  NUMBER_OF_WHEELS = 4
  NUMBER_OF_DOORS = 2
end

puts MyTruck.ancestors

puts ''

puts MyCar.ancestors

puts ''

puts Vehicle.ancestors
```

### 7.

```ruby
class Student
  attr_reader :name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    @grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end
```

### 8.

We're trying to call an instance method from the `Person` object `bob` that is defined as private. We can fix that by making the method public (not putting it below the `private` keyword).
