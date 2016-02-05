# Lecture: Classes and Objects

## 1.

```ruby
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end
```
## 2., 3.

```ruby
class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    full_name = self.first_name
    full_name += " #{self.last_name}" unless self.last_name.empty?
    full_name
  end

  def name=(new_name)
    parse_full_name(new_name)
  end

  private

  def parse_full_name(full_name)
    names = full_name.split
    self.first_name = names[0]
    self.last_name = names.length > 1 ? names[-1] : ''
  end
end
```

## 4.

```ruby
bob.name == rob.name
```

## 5.

Line 2 will output "This person's name is: " and then the return value of `Object#to_s`.

After we add `Person#to_s`, we'll get "This person's name is: Robert Smith".
