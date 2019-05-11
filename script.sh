# Escriba su código aquí
#!/bin/bash

#Transformacion de fecha
sed 's/\//-/g' data.csv > data1.csv
sed 's/-\([0-9][0-9]\);/-20\1;/' data1.csv > data2.csv
sed 's|\([0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9][0-9][0-9]\);|\3-\2-\1;|g' data2.csv > data3.csv
#Reemplazo de las , decimales por punto
sed 's/\,/./g' data3.csv > data4.csv
#Reemplazo de los separadores ; por ,
sed 's/\;/,/g' data4.csv > data5.csv
#Reemplazo las a minuscula por A mayuscula
sed 's/a/A/g' data5.csv > data6.csv
#Reemplazo las c minuscula por C mayúscula
sed 's/c/C/g' data6.csv > data7.csv
#Reemplazar campos nulos por \N
sed -e 's:^,:\\N,:g' -e 's:,,:,\\N,:g' -e 's:,,:,\\N,:g' -e 's:,$:,\\N:g' data7.csv > data8.csv
#Generar los registros que no tienen registros nulos
sed '\:\N:d' data8.csv > LabFinal1.csv
#Borrar archivos de salida
rm data*
#Mostrar final
cat LabFinal1.csv