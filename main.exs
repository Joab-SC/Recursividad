defmodule Main do


  def main do
    # factorial(4)
    # |> IO.puts()

    # IO.puts("#{contar_lista([1,2,3,4,5])}")

    # IO.puts("#{balance_final([1,2,3,-4,5])}")

    # IO.puts("#{elemento_presente?(-4, [2,3,-4,2])}")

    # IO.puts("#{calcular_dias_reservados([%{cliente: "Laura", dias: 3}, %{cliente: "Joab", dias: 7}, %{cliente: "Sharif", dias: 4}])}")

    # IO.puts("#{potencia_numero(2,3)}")

    # IO.puts("#{sumar_pares([1,6,9,4,8,2,7])}")

    IO.puts("#{calcular_cantidad_pedidos([%{producto: "Leche", cantidad: 3}, %{producto: "Tomate", cantidad: 7}, %{producto: "Lechuga", cantidad: 5}])}")


  end

  # Primer ejercicio

  def factorial(n) when n < 0, do: IO.puts("Error numero negativo")

  def factorial (0) do
    1
  end

  def factorial (n) do
    n * factorial(n-1)
  end

  # Segundo ejercicio

  def contar_lista(lista) do
    [_|tl] = lista
    contar_lista(tl, 0+1)
  end

  def contar_lista([],count) do
    count
  end

  def contar_lista(lista, count) do
    [_|tl] = lista
    contar_lista(tl, count+1)
  end


  # Tercer ejercicio

  def balance_final([])do
    0
  end

  def balance_final(lista) do
    [head|tail] = lista
    head + balance_final(tail)
  end

  # Cuarto ejercicio

  def elemento_presente?(_, []) do
    false
  end

  def elemento_presente?(elemento, [hd| _]) when elemento == hd do
     true
    end

  def elemento_presente?(elemento, [_| tl]) do
     # [hd| tl] =  lista
      elemento_presente?(elemento, tl)
    end


  # Quinto ejercico

  def calcular_dias_reservados([])do
    0
  end


  def calcular_dias_reservados([hd | tl]) do
    Map.get(hd,:dias) + calcular_dias_reservados(tl)
  end

  # Sexto ejercicio

  def potencia_numero(_,0) do
    1
  end

  def potencia_numero(n,exponente) do
    n * potencia_numero(n, exponente - 1)
  end

  # Septimo ejercicio

  def sumar_pares([]) do
    0
  end

  def sumar_pares([hd|tl]) when rem(hd,2) == 0 do
    hd + sumar_pares(tl)
  end

  def sumar_pares([_|tl]) do
    0 + sumar_pares(tl)
  end

  # Septimo ejercicio

  def calcular_cantidad_pedidos([])do
    0
  end


  def calcular_cantidad_pedidos([hd | tl]) do
    Map.get(hd,:cantidad) + calcular_cantidad_pedidos(tl)
  end

  end


Main.main()
