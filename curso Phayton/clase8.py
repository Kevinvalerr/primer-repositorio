to_do = [ "Dirigirnos al hotel",
            "Ir almorzar",
            "Visitar un museo ",
            "volver al hotel"]
print(to_do)       
numbers = [1,2,3,4, "cinco"] 
print(type(numbers))      
mix = ["uno",  2, 4.5, True,[1,2,3,4]]
print(mix)
print(len(mix))
print("Primer elemento", mix[0])
print("Segundo elemento", mix[1])
print("Ultimo elemento", mix[-1])
string = "Hola  Mundo"
print("Primer elemento", string[0])
print("Segundo elemento", string[1])
print("Ultimo elemento", string[-1])
print(mix[0:2])
print(mix)
mix.append(False)
print(mix)
mix.append(["a","b"])
print(mix)
mix.insert(1,["a","b"])
print(mix)
print(mix.index(["a","b"]))
numbers = [1,2,3,4,100,300,45,60] 
print(numbers)
print("Mayor",max(numbers))
print("Menor",min(numbers))
del numbers[-1]
print(numbers)
del numbers
print(numbers)