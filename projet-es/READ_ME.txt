	
     `````````)~\\~\     <_p_
       ````````)^\))\)) </  @\
  V      ````)))\~||~||</ /^`-'
 VVV   __       -\ \\--/ /
VVVVV<'  \\___/  )    .  )'              _
VVVVVV    `====\ _~~~))   ~~/\\         | |   /\
 """"""""""""""""""""""""""""""""\  Y   |  \__| \        Y
                                  \~~~~/         |~Y~~~~~~~~
 ^^^^^^^^^^^^^^^^^^^^^^^^^\~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

_______________________________________________________________________________
 ____  ____   __   _  _  ____   ___  ____   __         ____   __   ____  _  _ 
(  _ \(  _ \ /  \ ( \/ )(  __) / __)(_  _) /  \       (  _ \ / _\ / ___)/ )( \
 ) __/ )   /(  O ) )  /  ) _) ( (__   )(  (  O )       ) _ (/    \\___ \) __ (
(__)  (__\_) \__/ (__/  (____) \___) (__)  \__/       (____/\_/\_/(____/\_)(_/
_______________________________________________________________________________

Dirigida por:
Eliot Masset
Ikarionen Maxène
Di Piaza Hugo

Para probar el programa, siga las instrucciones siguientes :

_Abrir la terminal (Linux: Terminal, Windows: Cygwin(http://cygwin.com/setup-x86_64.exe))

_Visite el directorio del software :
                                   _--> cd <Répertoire>
                                   _ ejemplo: --> cd /home/projet-fr

_Inicie el programa con el siguiente comando :

--> bash projet-bash.sh <ruta al primer directorio> <ruta al segundo directorio>
Ou
--> bash projet-bash.sh

En el caso del segundo comando, se le pedirán los dos caminos anteriores en el programa

_A continuación se le preguntará si desea la versión completa del programa o no, sólo tendrá que teclear en el teclado el número 0 o 1 celón que desee. La confirmación de este hecho con la tecla de entrada de su teclado.

_A continuación, le será posible indicar al programa el directorio o le gustaría obtener la información en forma de archivo de texto (md5.txt). Podrás pasar ese paso con el número 0.

_El programa esta lanza, las diferentes etapas corresponden a la búsqueda de errores :

             _paso 1: Comprueba que hayas puesto dos caminos en el parámetro de tu pedido, si es necesario, te preguntaremos de nuevo por los caminos
             _paso 2: Comprueba que el primer árbol sea un directorio.
             _paso 3: Asegúrate de que el segundo árbol sea un directorio.
             _paso 4: Comprueba que el primer árbol no esté vacío, de lo contrario no es necesario compararlo.
             _paso 5: Comprueba que el segundo árbol no esté vacío, de lo contrario no es necesario compararlo.
             _paso 6: Comprueba que los árboles tengan derecho de lectura, de lo contrario el programa no podrá compararlos.

_Se publicará a continuación :

             _La clasificación de los archivos y carpetas en función de sus impresiones md5 (http://fr.wikipedia.org/wiki/MD5) para cada árbol.
  (al mismo /_Los archivos y carpetas que están en un árbol y no en el otro.
   tiempo)  \_Archivos y carpetas de un árbol, cuyas huellas de md5 aparecen en el otro árbol.
             _El número de archivos y carpetas diferentes entre los dos árboles.
Información: La primera y la segunda etapa sólo aparecen en la versión completa.

_Finalmente se les indicará si los dos árboles son idénticos o diferentes.



En caso de problema no dude en contactarnos por correo electrónico a la dirección: eliotmasset@gmail.com o por mensaje a: 07.83.08.71.74


