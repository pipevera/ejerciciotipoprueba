
file = File.open("prueba.csv", "r") #abre el archivo y almacena el archivo abierto en la variable file
	data = file.readlines #devuelve un arreglo, donde cada elemento corresponde a una linea del archivo
	file.close	#cierra el archivo


def verificar_aprobado(promedio, nota_aprobacion=5)
	promedio.to_f >= nota_aprobacion
end

	continuar = true

	while(continuar)

	puts "menu de opciones"	
	puts "1) archivo de promedios creado"
	puts "2) mostrar inasistencias"	
	puts "3) mostrar alumnos reprobados"
	puts "4) Salir"
	puts "ingrese una opcion" #imprime en consola
	opcion = gets.chomp.to_i #pide al usuario que ingrese un string

if opcion ==1 #si la opcion ingresada fue 1, entonces:
	
	arr_prom = [] #declarando un arreglo vacio

	data.each do |linea| # iterando el arreglo data
		#linea = "juan, 9, 2, 5, 1, 1"

		arr_linea = linea.split(", ") #arr_linea = ["juan", "9", "2, "5", "1", "1"] 
		#suma = arr_linea[1].to_f + arr_linea[2].to_f + arr_linea[3].to_f + arr_linea[4].to_f + arr_linea[5].to_f
		
		suma = arr_linea.inject(0) { |acu, var| acu + var .to_f}
		#prom = suma / 5
		prom = suma / (arr_linea.count - 1) #promedio 18 / (6 - 1)

		arr_prom << "#{arr_linea[0]}, #{prom}" #arr_prom = ["juan, 3.6"]
end

	# print arr_prom

	file = File.open("promedios.csv", "w")
	arr_prom.each do |alumno|
		file.puts alumno

	end
	file.close

	puts "se ha creado el archivo de promedios con exito"
end


if opcion == 2
	data.each do |linea| #linea "felipe, 10, 2, A, 8, 1"
		arr_linea = linea.chomp.split(", ") 
		contador_inasistencias = 0
		arr_linea.each do |elemento|
			contador_inasistencias += 1 if elemento == "A"
		end
		puts "#{arr_linea[0]} #{contador_inasistencias} inasistencias"

	end
end

if opcion == 3
	file = File.open("promedios.csv", "r")
	content = file.readlines
	file.close
	
	content.each do |alumno| #alumno = "juan, 3.6\n"
		arr_alumno = alumno.chomp.split(", ") #arr_alumno = ["juan", "3.6"]
		
		if verificar_aprobado(arr_alumno[1])
			puts "El alumno #{arr_alumno[0]} ha aprobado"
		else
			puts "El alumno #{arr_alumno[0]} ha reprobado"

		end
	end
end
	if opcion == 4
	continuar = false
	end
	if opcion < 1 || opcion > 4 || opcion.to_i == 0
		puts "opcion no valida, intente nuevamente.."
	end
end