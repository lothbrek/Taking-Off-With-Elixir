defmodule Physics.Rocketry do

  import Converter
  import Calcs
  import Physics.Laws
  import Planets


  def escape_velocity(:earth), do: earth |> escape_velocity
  def escape_velocity(:mars), do: mars |> escape_velocity
  def escape_velocity(:moon), do: moon |> escape_velocity

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> convert_to_km #converter module
      |> rounded_to_nearest_tenth #converter module
  end

  def orbital_speed(height) do
    newtons_gravitational_constant * earth.mass / orbital_radius(height)
      |> square_root
  end

  def orbital_acceleration(height) do
    orbital_speed(height) |> squared / orbital_radius(height)
  end

  defp orbital_radius(height) do
    earth.radius + (height |> to_meters)
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
    |> square_root
  end
end
