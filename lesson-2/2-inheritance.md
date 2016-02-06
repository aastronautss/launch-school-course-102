# Lecture: Inheritance

## 1.

```ruby
class Bulldog < Dog
  def swim
    "can't swim!"
  end
end
```

## 2.

```ruby
class Pet
  def speak
    'hello!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end
```

## 3.

```
Pet
 #speak
 #run
 #jump
  |
  +--Dog
  |   #speak
  |   #fetch
  |   #swim
  |
  +--Cat
      #speak
```

## 4.

A method lookup path (which we can see by calling `#ancestors` on an `Object`) is the order in which Ruby looks for methods when we call one. It's important because methods can be overridden by subclasses, in which case the method that Ruby will execute will be the one defined in that sublcass, rather than the superclass.
