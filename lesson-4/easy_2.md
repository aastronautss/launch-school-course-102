# Easy 2

## 1)

Line 2 will return something like `"You will eat a nice lunch"`.

## 2)

Line 2 will return `"You will "` and then one of the choices from the `choice` method of the `RoadTrip` class, since `choices` was overridden.

## 3)

For orange:

`Orange`, `Taste`, `Object`, `Kernel`, `BasicObject`

For HotSauce

`HotSauce`, `Taste`, `Object`, `Kernel`, `BasicObject`

## 4)

`attr_accessor :type`

## 5)

`excited_dog` is a local variable, since it doesn't have any symbols attached to it, and it is in snake_case.

`@excited_dog` is an instance variable since it has an `@` at the beginning.

`@@excited_dog` is a class variable since it has two `@` sybmols at the beginning.

## 6)

`Television.manufacturer` is a class method, since it is being defined using `self` (which means it could also be defined using `Television`).

## 7)

`@@cats_count` is a class variable and can be accessed by the class itself, and persists beyond instances of the `Cat` class. We can do this to illustrate what it does:

```ruby
puts Cat.cats_count
fluffy = Cat.new('stupid type')
puts Cat.cats_count
snowball = Cat.new('cats suck')
puts Cat.cats_count
```

## 8)

```ruby
class Bingo < Game
  # Some code
end
```

## 9)

A `play` method added to `Bingo` would override the method of that name from the `Game` class it is a subclass of. We can invoke the `Game`'s `play` method from `Bingo`'s `play` method by using `super`.

## 10)

* Code tends to be organized better.
* Encapulation makes it so things that break in one part of the program don't affect other parts.
* Allows for more expressive code.
* Functionality is made much clearer, and we don't have to repeat ourselves as often.
* OO code is reused much easier.
