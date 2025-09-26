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

    # IO.puts("#{calcular_cantidad_pedidos([%{producto: "Leche", cantidad: 3}, %{producto: "Tomate", cantidad: 7}, %{producto: "Lechuga", cantidad: 5}])}")

     IO.inspect(permutar([1, 2, 3, 4, 5]))
    #     IO.inspect(sumar_arbol({
    #   5,
    #   {4, {11, {7, nil, nil}, {2, nil, nil}}, nil},
    #   {8, {13, nil, nil}, {4, nil, {1, nil, nil}}}
          # }, 22))

    IO.puts("#{sumar_matriz([[1,2,3],
                              [2,6,5],
                              [1,9,0]])}")


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

  # Octavo ejercicio

  def calcular_cantidad_pedidos([])do
    0
  end


  def calcular_cantidad_pedidos([hd | tl]) do
    Map.get(hd,:cantidad) + calcular_cantidad_pedidos(tl)
  end


  # Noveno ejercicio


  # Caso base
  def permutar([]), do: [[]]

  # Caso recursivo
  def permutar([h | t]) do
    t
    |> permutar()
    |> insertar_en_todas_posiciones(h)
  end

  # Inserta elem en todas las posiciones de cada permutación
  defp insertar_en_todas_posiciones([], _elem), do: []
  defp insertar_en_todas_posiciones([perm | resto], elem) do
    insertar_en_una_lista(perm, elem) ++ insertar_en_todas_posiciones(resto, elem)
  end

  # Inserta elem en todas las posiciones de una lista plana
  defp insertar_en_una_lista(lista, elem) do
    do_insertar(lista, elem, [])
  end

  # Auxiliar recursivo
  defp do_insertar([], elem, acc), do: [acc ++ [elem]]  # caso base: insertamos al final
  defp do_insertar([h | t], elem, acc) do
    [[acc ++ [elem] ++ [h | t]] | do_insertar(t, elem, acc ++ [h])]
  end




  # Decimo ejercicio
  def sumar_arbol(nil, _objetivo, _ruta, _suma), do: []

  def sumar_arbol({valor, izq, der}, objetivo, ruta \\ [], suma \\ 0) do
    nueva_ruta = ruta ++ [valor]
    nueva_suma = suma + valor

    if izq == nil and der == nil do
      if nueva_suma == objetivo do
        [nueva_ruta]
      else
        []
      end
    else

      rutas_izq = sumar_arbol(izq, objetivo, nueva_ruta, nueva_suma)
      rutas_der = sumar_arbol(der, objetivo, nueva_ruta, nueva_suma)

      rutas_izq ++ rutas_der
    end
  end


  # Onceavo ejercicio
  def sumar_matriz([fila| []]) do
    sumar_fila(fila)
  end

  def sumar_matriz([fila|resto]) do
    sumar_fila(fila) + sumar_matriz(resto)
  end

  def sumar_fila([]) do
      0
    end

  def sumar_fila([elemento| resto]) do
    elemento + sumar_fila(resto)
  end




end


Main.main()
