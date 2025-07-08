class Operacion:
    def __init__(self, num1: int, num2: int):
        self.num1 = num1
        self.num2 = num2


class Suma(Operacion):
    def __init__(self, num1: int, num2: int, num3: int):
        super().__init__(num1, num2)
        self.num3 = num3

    def sumar(self) -> int:
        return self.num1 + self.num2 + self.num3


class Resta(Operacion):
    def __init__(self, num1: int, num2: int):
        super().__init__(num1, num2)

    def restar(self) -> int:
        return self.num1 - self.num2


class Multiplicacion(Operacion):
    def __init__(self, num1: int, num2: int, num3: int):
        super().__init__(num1, num2)
        self.num3 = num3

    def multiplicar(self) -> int:
        return self.num1 * self.num2 * self.num3


# Menú por consola
def main():
    while True:
        print("\n--- Calculadora por consola ---")
        print("1. Sumar")
        print("2. Restar")
        print("3. Multiplicar")
        print("4. Salir")

        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            a, b, c = int(input("Num1: ")), int(input("Num2: ")), int(input("Num3: "))
            suma = Suma(a, b, c)
            print("Resultado de la suma:", suma.sumar())

        elif opcion == "2":
            a, b = int(input("Num1: ")), int(input("Num2: "))
            resta = Resta(a, b)
            print("Resultado de la resta:", resta.restar())

        elif opcion == "3":
            a, b, c = int(input("Num1: ")), int(input("Num2: ")), int(input("Num3: "))
            multi = Multiplicacion(a, b, c)
            print("Resultado de la multiplicación:", multi.multiplicar())

        elif opcion == "4":
            print("Saliendo...")
            break
        else:
            print("Opción inválida, intente nuevamente.")


if __name__ == "__main__":
    main()
