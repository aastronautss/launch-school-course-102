# Easy 3

## 1)

1: `Hello` is output.
2: `NoMethodError`
3: `ArgumentError`
4: `Goodbye` is output.
5: `NoMethodError`

## 2)

Define a class method `self.hi`.

## 3)

```ruby
fluffy = AngryCat.new(44, "Fluffy")
snowball = AngryCat.new(13, "Snowball")
```

## 4)

Declare a `to_s` method in the class:

```ruby
class Cat
  def to_s
    @type
  end
end
```

## 5)

You'd get a `NoMethodError` at line 2, and (assuming the code still runs) another one at line 6. This is because `Television.manufacturer` is a classs method, while `Television#model` is an instance variable, and cannot be called from instances and the class, respectively.

## 6)

We could use `@age` (call the instance variable itself), or simply `age` since it is being called from within an instance method, and so the getter method will be called if we use the latter.

## 7)

The `return` keyword doesn't need to be there, since the last line of the method is returned anyhow.
