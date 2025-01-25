extends Node

# Fuel variables
var max_fuel = 100.0
var current_fuel = max_fuel
var fuel_rate = 1.0

func consume_fuel(amount):
    current_fuel = max(current_fuel - (amount * fuel_rate * 0.01), 0)
    if current_fuel <= 0:
        get_parent().velocity = Vector2.ZERO  # Stop hovercraft when fuel is depleted
