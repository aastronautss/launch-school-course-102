# Hard 1

## 1)

```ruby
class SecretFile
  def initialize(secret_data, logger)
    @logger = logger
    @data = secret_data
    @logger.create_log_entry
  end

  def data
    @logger.create_log_entry
    @data
  end
end
```

## 2)

```ruby
module Vehicle
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Catamaran
  include Vehicle

  attr_accessor :propeller_count, :hull_count

  # ...
end

class WheeledVehicle
  include Vehicle

  # Same as before sans range method and attr_accessor line.
end
```

## 3)

```ruby
class Boat
  include Vehicle

  attr_accessor :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    self.fuel_efficiency = km_traveled_per_liter
    sef.fuel_capacity = liters_of_fuel_capacity

    self.propeller_count = num_propellers
    self.hull_count = num_hulls
  end
end

class Catamaran < Boat
end

class Motorboat < Boat
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end
```

## 4)

```ruby
class Boat
  def range
    super + 10
  end
end
```
