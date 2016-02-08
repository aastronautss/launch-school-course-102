# Easy 1

## 1)

### 1.

Yes, `TrueClass`

### 2.

Yes, `String`

### 3.

Yes, `Array`

### 4.

Yes, `Fixnum`

## 2)

We can add `include Speed` to each class.

## 3)

`self` in this instance refers to the object (since it is being used within an instance method), and the `#class` method returns the class of the caller. String interpolation automatically calls the `to_s` method on an object.

## 4)

```ruby
fluffy = AngryCat.new
```

## 5)

`Pizza` has an instance variable, because ruby's syntax designates the `@` symbol for instance variables. The `name` variable in the `Fruit` class only exists in the `initialize` method. We can verify this by asking the object.

## 6)

Either defining a getter method:

```ruby
def volume
  @volume
end
```

or adding `attr_accessor :volume` or `attr_reader :volume` to the class.

## 7)

It will print a string naming the object and its object ID, along with a list of its instance variables. You can find this out in irb by making a class, instantiating it, and using `puts`.

## 8)

`self` refers to the object itself, which is an instance of the class. This is because it is being called from within an instance method which in turn can only be called on instances of the class.

## 9)

`self` in this case refers to the class (`Cat`), since it is being used outside of any instance methods. It is equivalent to using `Cat.cats_count`.

## 10)

`Bag.new('some color', 'some material')`. Basically, pass two arguments to `Bag#new`.
