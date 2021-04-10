#!/bin/bash
funcA() {
 echo "Error. La sintaxis del script es la siguiente:"
 echo "......................: $0 directorio1 directorio2 directorio3 directorio4 directorio5" # COMPLETAR
exit 1
}

funcB() {
echo "Error. $1 no es un directorio " # COMPLETAR
}

funcC() {
 if [[ ! -d $2 ]]; then
 funcB $2
 exit 1 #faltaba el exit
 fi
} #el $2 hace referencia al dir1 ,es el segundo aprametro q se le manda a  la funcion

#la funcion c verifica que el parametro 2(q el script recive como $1) sea un directorio? --> es verdadero si no es un directorio

if [ $# -lt 5 ]
then
    funcA
fi

funcC $# $1 $2 $3 $4 $5

LIST=$(ls -d $1/*) # el error creo q  es que se escribe como $1/, hace ls de lo q hay en $1 y le pone dir1/nombre
                    # Pone en la variable como string creo, el contenido del directorio si uso $2 le asigna dir2/diego dir2/iorio, q es lo contiene el directorio $2


ITEMS=()
for d in $LIST; do
    ITEM="$(ls $d | wc -l)-$d" # cuenta los archivos que tiene $d y dedspues la guarda en items, la parte -$d es para poner el nombre del directorio  al q le conto los  arcivos 
 
    ITEMS+=($ITEM) #las pone el el vector como texto
done

#echo "${ITEMS[@]}"
IFS=$'\n' sorted=($(sort -rV -t '-' -k 1 <<<${ITEMS[*]})) #en sorted tambien lo pone como vector pero lo ordena, rV lo ordena alreves usando los numeros, -t '-' pone como separador al guion, creo q el -k 1 ordena en base a la primer columna o algo asi, en el vector el uso de [*] queire decir q me da toddo en la misma variable, una sola string
# con los parentesis sale un directorio solo 
#el $ es para q reconozca  la barra

#hasta aca pregunta si $1 es un directorio si no lo es se va , si entra crea un vector q es ITEMS y adentro del for cuenta los archivos que tienen los directorios
#y los mete en un tector , una vez que sSale los ordena de mayor a menor considerando el numero de archivos que tiene cada directorio


CANDIDATES="${sorted[*]:0:2}" #esto guarda en candidates  los primero N elementos del vector --> eñ 2 tenia un signo pesos q no iba
#echo ${CANDIDATES[@]}
unset IFS
echo "El/Los archivos que poseen la mayor cantidad de registros son" #COMPLETAR
printf "%s\n" "$(cut -d '-' -f 2 <<<${CANDIDATES[*]})" #imprime con formato el campo ?

                             ##---PUNTO 1---##
#el objetivo del Script es mostrar el o los directorios  que posean mayor cantidad de arcivos 
#del dentro del primer parametro que se pasa a la funcion, el cual debe ser un directorio

#el script recibe 5 directorios 


                              ##---PUNTO 2---##
#El script comienza verifizando que la cantidad de parametros sea correcta, si no es asi emite un mensaje de error mostrando la sintaxis esperada,
# si la cantidad de parametros es correcta, continua verificando si el primero parameto ingresado es un directorio, si no lo es muestra mensaje del error correspondiente.
#Una vez pasada la verificacion, los ordena en forma decendente en funcion de la cantidad de archivos que contenga cada uno
#Finalmente muestra los 2 directorios que resultaron tener la mayor cantidad de archivos 
                             
 
                            ##---PUNTO 4--##

#La funcA podria llamarse ErrorCantParam
#La funcB podria llamarse ErrorValdiacionDirectorio
#La funnC podria llamarse VallidacionDirectorio


                            ##---PUNTO 5--##
#agregaria la validacion de la cantidad de parametros que recive el script
#ERRORES
    # $1*/ fue cambiado por $1/*
    # las funciones no pseeian el comando "exit 1" para finalizar la ejecucion del scritp  
    #


                            ##---PUNTO 6---##
#   $# brinda la cantidad de parametros que se pasaron al script
#   $@ devuelve un array de parametros.
#   $* devuelve una cadena de parametros    
#   $0 Brinda el nombre del script
#   $? Brinda el valor de ejecucion del ultimo comando ejecutado
#   $$ Devuelve el pid del proceso actual
#   $! Devuelve el PID del ultimo proceso hijo ejecutado en segundo plano.
#   $PWD Devuelve el directorio actual

                              ##---PUNTO 7---##
    #[`  `] Guarda el valor de ejecucion del comando
    #['  '] toma todo como una cadena. 
    #["  "] toma como cadena a solo las cadenas.
    #       Las utilizamos cuando queremos pasar cadenas separadas 
    #       por espacios como un solo parametro al script

                              ##---PUNTO G---##
#Si el scritp se ejecuta sin parametros y tenemos la validacion del numero de parametros , se muestra el mensaje de error y termina,
#en caso de no tenerlas, se verifica si el priemr parametro es un directorio, como no lo es, se muestra el mensaje correspondiente y termina al ejecucion


                    # +++++++++++++++FIN DE ARCHIVO+++++++++++++++++++++++