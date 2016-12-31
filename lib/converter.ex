defmodule Converter do
  def convert_to_km(val) do
    val/1000
  end

  def rounded_to_nearest_tenth(val) do
    Float.ceil val, 1
  end

  def to_light_seconds({:miles, miles}) do
    (miles * 5.36819e-6) |> round_down
  end

  def to_light_seconds({:meters, meters}) do
    (meters * 3.335638620368e-9) |> round_down
  end

  defp to_meters(val), do: val * 3.335638620368e-9

  def round_down(val) when is_float(val), do: trunc(val)

  defp round_to(val, precision \\ 5) when is_float(val) do
    Float.round(val, precision)
  end
end

defmodule ConverterTwo do
  def to_light_seconds({unit, val}, precision: precision) do
    case unit do
      :miles -> from_miles(val)
      :meters -> from_meters(val)
      :feet ->  from_feet(val)
      :inches -> from_inches(val)
    end |> round_to(precision) #example 1
  end

  defp from_miles(val), do: val * 5.36819e-6
  defp from_meters(val), do: val * 3.335638620368e-9
  defp from_feet(val), do: val * 1.016702651488166404e-9
  defp from_inches(val), do: val * 8.472522095734715723e-11
  defp round_to(val, precision), do: Float.round(val, precision)
end
