	
     `````````)~\\~\     <_p_
       ````````)^\))\)) </  @\
  V      ````)))\~||~||</ /^`-'
 VVV   __       -\ \\--/ /
VVVVV<'  \\___/  )    .  )'              _
VVVVVV    `====\ _~~~))   ~~/\\         | |   /\
 """"""""""""""""""""""""""""""""\  Y   |  \__| \        Y
                                  \~~~~/         |~Y~~~~~~~~
 ^^^^^^^^^^^^^^^^^^^^^^^^^\~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


__________________________________________________________________________________________________________________________________________________________________________

         _          _           _                  _        _             _           _                _               _                  _            _       _  
        /\ \       /\ \        /\ \               /\ \     /\ \         /\ \         /\ \             / /\            / /\               / /\         / /\    / /\
       /  \ \     /  \ \      /  \ \              \ \ \   /  \ \       /  \ \        \_\ \           / /  \          / /  \             / /  \       / / /   / / /
      / /\ \ \   / /\ \ \    / /\ \ \             /\ \_\ / /\ \ \     / /\ \ \       /\__ \         / / /\ \        / / /\ \           / / /\ \__   / /_/   / / / 
     / / /\ \_\ / / /\ \_\  / / /\ \ \           / /\/_// / /\ \_\   / / /\ \ \     / /_ \ \       / / /\ \ \      / / /\ \ \         / / /\ \___\ / /\ \__/ / /  
    / / /_/ / // / /_/ / / / / /  \ \_\ _       / / /  / /_/_ \/_/  / / /  \ \_\   / / /\ \ \     / / /\ \_\ \    / / /  \ \ \        \ \ \ \/___// /\ \___\/ /   
   / / /__\/ // / /__\/ / / / /   / / //\ \    / / /  / /____/\    / / /    \/_/  / / /  \/_/    / / /\ \ \___\  / / /___/ /\ \        \ \ \     / / /\/___/ /    
  / / /_____// / /_____/ / / /   / / / \ \_\  / / /  / /\____\/   / / /          / / /          / / /  \ \ \__/ / / /_____/ /\ \   _    \ \ \   / / /   / / /     
 / / /      / / /\ \ \  / / /___/ / /  / / /_/ / /  / / /______  / / /________  / / /          / / /____\_\ \  / /_________/\ \ \ /_/\__/ / /  / / /   / / /      
/ / /      / / /  \ \ \/ / /____\/ /  / / /__\/ /  / / /_______\/ / /_________\/_/ /          / / /__________\/ / /_       __\ \_\\ \/___/ /  / / /   / / /       
\/_/       \/_/    \_\/\/_________/   \/_______/   \/__________/\/____________/\_\/           \/_____________/\_\___\     /____/_/ \_____\/   \/_/    \/_/        
                                                                                                                                                                  
__________________________________________________________________________________________________________________________________________________________________________



Made by:
Eliot Masset
Ikarionen Maxène
Di Piaza Hugo

To test the program please follow the following instructions :

_Open terminal (Linux: Terminal, Windows: Cygwin(http://cygwin.com/setup-x86_64.exe))

_Go to the software directory :
                              _--> cd <Directory>
                              _ example: --> cd /home/projet-en

_Launch program with the following command :

--> bash projet-bash.sh <path to the first directory> <path to the second directory>
Or
--> bash projet-bash.sh

In the case of the second command, you will be asked the 2 upstream paths in the program

_You will then be asked whether you want the full version of the program or not, you will only have to type the number 0 or 1 according to your choice. Confirmation is done with the enter key of your keyboard.

_It will then be possible to indicate to the program the directory where you would like to have the information as a text file (md5.txt). You can pass this step with the number 0.

_Program launching, differents steps correspond to the error search :

             _step 1: Check that you have set 2 paths in the parameter of your command, in case you are asked again the paths
             _step 2: Checks that the first directory is a forlders.
             _step 3: Checks that the second directory is a forlders.
             _step 4: Checks that the first directory is not empty, otherwise it is useless to compare it.
             _step 5: Checks that the second directory is not empty, otherwise it is useless to compare it.
             _step 6: Check that directories have read rights, otherwise it will be impossible for the program to compare them.

_It will then be posted :

             _Sorting files and folders according to their hash md5(https://fr.wikipedia.org/wiki/MD5) for each directory.
   (same    /_Files and folders that are in one directory and not in the other.
    time)   \_Files and folders of a directory whose hash md5 appear in the other directory.
             _The number of different files and folders between the two directory.
Information : The first and second step don't appear in the complet version.

_You will finally be told whether the two directories are identical or different..



In case of problem do not hesitate to contact us by email at : eliotmasset@gmail.com or by message : 07.83.08.71.74


