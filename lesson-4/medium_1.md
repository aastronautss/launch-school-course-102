# Medium 1

## 1)

Ben's right, since it'll call the getter method for `balance`, since he used `attr_reader :balance`.

## 2)

There isn't a setter method for `@quantity`, so we'll get a `NoMethodError`. We can do this by either using `@quantity` or providing a setter method (using `attr_writer`, `attr_accessor`, or defining a `quantity=` method).

## 3)

This would cause a problem only if we don't want to be able to modify `@product_name` or `@quantity` from outside the class. Adding `attr_accessor` will make it so we can do this.

## 4)

```ruby
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet "Hello"
  end
end

class Goodbye < Greeting
  def bye
    greet "Goodbye"
  end
end
```

## 5)

```ruby
def to_s
  filling = (@filling_type ? @filling_type : "Plain")
  topping = (@glazing ? " with #{@glazing}" : '')
  filling + topping
end
```

## 6)

They'll work the same, since we have an `attr_accessor` for `@template`.

## 7)

`def self.information` should be the name, since we'd always call it as `Light.information`, and `Light.light_information` would be repetitive.
