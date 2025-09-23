defmodule Main do


  def main do
    factorial(4)
    |> IO.puts()

    IO.puts("#{contar_lista([1,2,3,4,5])}")

    IO.puts("#{balance_final([1,2,3,-4,5])}")

    IO.puts("#{elemento_presente?(-4, [2,3,-4,2])}")

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




  end




Main.main()
