#!/bin/bash
#Miguel Rosas

# Lista de valores para lc
valores_t=("120")

# Leer valores desde el archivo parametros.txt
n=$(grep -oP 'n\s*=\s*\K[\d.+-]+' parameters.txt)
a=$(grep -oP 'a\s*=\s*\K[\d.+-]+' parameters.txt)

# Obtiene la cantidad desde el primer argumento
cantidad=1

# Bucle para crear y mover carpetas, editar y genrar mallado
for ((i = 1; i <= $cantidad; i++)); do
  # Genera el nombre de la carpeta
  nombre_carpeta="Case_$i"

  # Crea la carpeta del caso
  mkdir "$nombre_carpeta"

  # Copia carpetas del caso dentro de las carpetasgeneradas
  cp -r "Case_0/0/" "$nombre_carpeta/"
  cp -r "Case_0/0.orig/" "$nombre_carpeta/"
  cp -r "Case_0/constant/" "$nombre_carpeta/"
  cp -r "Case_0/system/" "$nombre_carpeta/"
  cp "Case_0/extract_freesurface_plane.py" "$nombre_carpeta/"
  cp "Case_0/extract_freesurface.sh" "$nombre_carpeta/"

  ddir=$(pwd)
  sed -i "s|\$ddir|$ddir|g" "./$nombre_carpeta/extract_freesurface_plane.py"

  # Copia un archivo dentro de la carpeta
  archivo_geo="Case_0/flume.geo"
  archivo_geoi="flume_Case_$i.geo"
  touch "$archivo_geo"
  cp "$archivo_geo" "$nombre_carpeta/$archivo_geoi"

  # Realiza el intercambio en el archivo
  valor_t="${valores_t[i - 1]}"
  sed -i "s/\$tt/$valor_t/g" "$nombre_carpeta/system/controlDict"
  sed -i "s/\$i/$i/g" "$nombre_carpeta/extract_freesurface_plane.py"
  sed -i "s/\$nn/$n/g" "$nombre_carpeta/constant/porosityProperties"
  sed -i "s/\$nn/$n/g" "$nombre_carpeta/system/setFieldsDict"
  sed -i "s/\$aa/$a/g" "$nombre_carpeta/system/setFieldsDict"

  #Generar mallado gmsh
  cd "$nombre_carpeta/"
  mkdir freesurface
  gmsh "$archivo_geoi" -3

  #Genera mallado OpenFoam
  gmshToFoam "flume_Case_$i.msh"

  #Lineas a eliminar en polymesh/bondary
  lineas_eliminar=("24" "30" "36" "42" "48" "54")

  #Itera sobre las líneas a eliminar y utiliza sed para quitarlas
  for numero_linea in "${lineas_eliminar[@]}"; do
    sed -i "${numero_linea}d" "constant/polyMesh/boundary"
  done

  # Reemplaza "patch" por "wall"
  sed -i '29s/patch/wall/; 35s/patch/wall/ ' "constant/polyMesh/boundary"
  sed -i '23s/patch/empty/ ' "constant/polyMesh/boundary"
  setFields
  decomposePar
  mpirun -np 8 interIsoFoam -parallel >log
  kitty --hold -e bash -c "./extract_freesurface.sh &&  rm -r ./proce*; exec bash" &
  cd ..
done
cp ./Case*/*csv ./Kr_calculation/
cd ./Kr_calculation
python3 extractor.py
python3 separador.py

echo "Proceso completado."
