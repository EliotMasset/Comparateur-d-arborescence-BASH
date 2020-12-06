#!/bin/bash

cd ../

rm -f tempListe*                                                          # ||
rm -f projet-bash-site.html                                               # ||
rm -f projet-bash-site.css                                                # ||
rm -f TempSauvegarde*                                                     # ||
rm -f md5*                                                                # ||
rm -f tempmd5*                                                            # ||
rm -f listeArborescence*                                                  # ||
rm -f log                                                                 # ||
rm -f listeFichier*                                                       # ||
rm -f Sauvegarde*                                                         # \/ Suppression des fichiers temporaires si existants
arbo1=$1                                                                  #1re arborescence rentrée en paramètre
arbo2=$2                                                                  #2nd arborescence rentrée en paramètre
log=log.txt                                                               #fichier log qui redirige les erreurs
versionComplete=2                                                         # ||
Booldestination=2                                                         # ||
cheminversmd5=0                                                           # ||
nombredifferencefichier1=0                                                # ||
nombredifferencefichier2=0                                                # ||
nombredifferencedossier1=0                                                # ||
nombredifferencedossier2=0                                                # \/Définition des variables numériques




Sidossier ()
{
    if test -d $1                                                            # ||
    then                                                                     # ||
        echo -e "        \033[36m$n\033[0m\033[31m/6\033[0m passi riusciti"  # ||
    else                                                                     # ||
        echo  -e "\033[31merrore !\033[0m"                                   # ||
        echo "Il repertorio : " $1 " non esiste o è un file"                 # ||
        exit                                                                 # \/ Vérifie qu'un répertoire existe
    fi  
}
Sivide ()
{
    if test -r $1                                                            # ||
    then                                                                     # ||
        echo -e "        \033[36m$n\033[0m\033[31m/6\033[0m passi riusciti"  # ||
    else                                                                     # ||
        echo  -e "\033[31merrore !\033[0m"                                   # ||
        echo "Il repertorio : " $1 " non è accessibile in lettura"           # ||
        exit                                                                 # \/
    fi                                                                       #Vérifie qu'un répertoire à les droits de lecture
}
md5seul ()
{
    md5sum "$1" | cut -c1-33                                                #Ne renvoie que la partie qui correspond à l'empreinte md5 après un md5
}                                                            
md5deligne ()
{
    echo "$1" | cut -c1-33                                                  #Ne renvoie que la partie qui correspond à l'empreinte md5 pour une ligne
}
chemindeligne ()
{
    echo "$1" | cut -c33-                                                   #Ne renvoie que le chemin vers l'empreinte md5
}
lectureR ()
{
    ls -1Rf "$1" | tr ':' '\012' | sed -e '/^[.]$*/d' > $2                  #Renvoie la lecture récursive d'un répertoire dans un autre
}
supprLignesVides ()
{
    sed -i "/^[ \t]*$/d" "$1"                                               #Suppression lignes vides
}
supprEtoile ()
{
    sed -i s/'*'/''/g "$1"                                                  #Suppression du caractère '*'
}
trieparmd5 ()
{
    sort -k 1,33 "$1" > "$2"                                                #Trie les lignes des fichiers en ne prenant compte que des empreintes md5
}

définitionsvariable ()
{
    arbo=`mktemp tempListeArborescencearbo$i\XXX.txt`                              #Fichier temporaire qui liste le contenu de l'arborescence
    md5dossier=`mktemp tempListemd5Dossierarbo$i\XXX.txt`                          #Fichier temporaire qui liste les dossiers de l'arborescence et qui la convertit en md5
    md5dossierdiff=`mktemp tempListemd5dossierdiffarbo$i\XXX.txt`                  #Fichier temporaire qui liste les dossiers différents de l'arborescence et qui la convertit en md5
    md5fichier=`mktemp tempListemd5Fichierarbo$i\XXX.txt`                          #Fichier temporaire qui liste les fichiers de l'arborescence et qui la convertit en md5
    md5fichierdiff=`mktemp tempListemd5Fichierdiffarbo$i\XXX.txt`                  #Fichier temporaire qui liste les fichiers différents de l'arborescence et qui la convertit en md5
    sousdossier=`mktemp tempListeSousdossierarbo$i\XXX.txt`                        #Fichier temporaire comprenant les sous-dossiers et sous-fichiers d'un fichier
    md5sousdossier=`mktemp tempmd5ListeSousdossierarbo$i\XXX.txt`                  #Fichier temporaire comprenant les sous-dossiers et sous-fichiers d'un fichier avec leurs empreintes md5
    Dossier=`mktemp tempListeDossierXXXarbo$i\.txt`                                #Fichier temporaire comprenant les dossiers de l'arborescence
    listeFichier=listeFichierarbo$i\.txt                                           #Fichier qui liste les fichiers contenus dans l'arborescence (récursif)
    listeArbo=listeArborescencearbo$i\.txt                                         #Fichier qui liste les fichiers et dossiers contenus dans les deux arborescences (récursif)
    if test $i -eq 1
    then
        lectureR $arbo1 $arbo
    else
        lectureR $arbo2 $arbo
    fi
}

triedifferences ()
{
    occurence=""                                                                            # ||
    while read ligne                                                                        # ||
    do                                                                                      # ||
        line=`md5deligne "$ligne"`                                                          # ||
        chemin=`echo "$ligne" | cut -c34- `                                                 # ||
        nom=`basename "$chemin"`                                                            # ||
        if [[ $line == $occurence ]]                                                        # ||
            then                                                                            # ||
            echo -e "                                   \033[32m$chemin\033[0m"             # ||
            echo "
                                   <a>------------------------------------------------>$chemin<a><br>
                " >> projet-bash-site.html                                                  # ||
        else                                                                                # ||
            occurence="$line"                                                               # ||
            echo -e "\n\033[31m$line\033[0m": "\033[32m$nom\033[0m"                         # ||
            echo "
                                   <a><span class=\"rouge\">$line:</span> $chemin<a><br>
                " >> projet-bash-site.html                                                  # ||
        fi                                                                                  # ||
    done < $1                                                                               # \/ Indique à l'utilisateur les fichiers ou dossiers différents
}
    
TexteEntreDiffEtCorr () #Le texte à afficher entre les correspondances et les différences
{
    echo -e "\033[33mC'è dunque\033[0m\033[32m $3 \033[0m\033[33mdifferenze di $4 nell'albero $1 rispetto alla struttura ad albero $2\033[0m"

    echo -e "Elenco dei $4 dell'albero $1 e delle loro corrispondenze nell’albero $2 :" >> $md5
    echo -e "------------------------------------------------------------------------------------------\n\n" >> $md5
    if test $versionComplete -eq 1
    then
        echo -e "\033[31mElenco dei $4 dell'albero $1 e delle loro corrispondenze nell’albero $2 :\033[0m"
        echo -e "\033[31m------------------------------------------------------------------------------------------\033[0m\n\n"
    fi
}

TexteEntreCorrEtDiff () #Le texte à afficher entre les correspondances et les différences
{
    echo -e "Elenco dei $3 dell'albero $1 che non hanno alcuna corrispondenza nell’albero $2 :" >> $md5
    echo -e "------------------------------------------------------------------------------------------\n\n" >> $md5
    echo -e "\033[31mElenco dei $3 dell'albero $1 che non hanno alcuna corrispondenza nell’albero $2 :\033[0m"
    echo -e "\033[31m------------------------------------------------------------------------------------------\033[0m\n\n"
}

calculcorrespondance ()
{
    while read ligne                                                                                                                                  # ||
    do                                                                                                                                                # ||
        lignechemin=`chemindeligne "$ligne"`                                                                                                          # ||
        lignenom=`basename "$ligne"`                                                                                                                  # ||
        unefois=1                                                                                                                                     # ||
        while read line                                                                                                                               # ||
        do                                                                                                                                            # ||
            lignemd5=`md5deligne "$ligne" `                                                                                                           # ||
            linemd5=`md5deligne "$line"`                                                                                                              # ||
            if [[ $linemd5 == $lignemd5 ]]                                                                                                            # ||
            then                                                                                                                                      # ||
                if test $unefois == 1                                                                                                                 # ||
                then                                                                                                                                  # ||
                    if test $versionComplete -eq 1                                                                                                    # ||
                    then                                                                                                                              # ||
                        echo -e "\n\033[33mIl $3" $lignenom "a come Corrispondence : \033[0m\n"                                                        # ||
                        echo "
                            <tr><td class=\"rouge\" colspan=\"2\">$lignenom</td></tr>
                        " >> projet-bash-site.html                                                                                                    # ||
                    fi                                                                                                                                # ||
                    echo -e "\nIl $3" $lignenom "a come Corrispondence : \n" >> $md5                                                                   # ||
                fi                                                                                                                                    # ||
                unefois=0                                                                                                                             # ||
                linechemin=`chemindeligne "$line"`                                                                                                    # ||
                if test $versionComplete -eq 1                                                                                                        # ||
                then                                                                                                                                  # ||
                    echo -e "$linechemin"                                                                                                             # ||
                    echo "
                             <tr>
                                  <td colspan=\"2\">$linechemin</td>
                             </tr>
                        " >> projet-bash-site.html                                                                                                    # ||
                fi                                                                                                                                    # ||
                echo -e "$linechemin" >> $md5                                                                                                         # ||
            fi                                                                                                                                        # ||
        done < $2                                                                                                                                     # ||
        if test $unefois == 0                                                                                                                         # ||
        then                                                                                                                                          # ||
            if test $versionComplete -eq 1                                                                                                            # ||
            then                                                                                                                                      # ||
                echo -e "\n\033[33mPer informazione, si trova all’indirizzo:\033[0m $lignechemin"                                                    # ||
                echo -e "\n\033[33m------------------------------------------------------------------------------------------------------\033[0m"     # ||
            fi                                                                                                                                        # ||
            echo -e "\nPer informazione, si trova all’indirizzo: $lignechemin" >> $md5                                                               # ||
            echo -e "\n------------------------------------------------------------------------------------------------------" >> $md5                # ||
        fi                                                                                                                                            # ||
    done < $1                                                                                                                                         # \/ Met dans le fichier md5.txt la liste des dossiers ou fichiers identiques d'une arborescence par rapport à l'autre
}

calculdifference ()
{
    nbdifferences=0
    while read ligne                                                                                                                                                   # ||
    do                                                                                                                                                                 # ||
        verif=0                                                                                                                                                        # ||
        lignechemin=`chemindeligne "$ligne"`                                                                                                                           # ||
        lignenom=`basename "$ligne"`                                                                                                                                   # ||
        lignemd5=`md5deligne "$ligne"`                                                                                                                                 # ||
        while read line                                                                                                                                                # ||
        do                                                                                                                                                             # ||
            linemd5=`md5deligne "$line"`                                                                                                                               # ||
            if [[ $linemd5 == $lignemd5 ]]                                                                                                                             # ||
            then                                                                                                                                                       # ||
                verif=1                                                                                                                                                # ||
                linechemin=`chemindeligne "$line"`                                                                                                                     # ||
            fi                                                                                                                                                         # ||
        done < $2                                                                                                                                                      # ||
        if test $verif -eq 0                                                                                                                                           # ||
        then                                                                                                                                                           # ||
            echo "
                                            <tr>
                                                 <td>$lignemd5</td>
                                                 <td>$lignenom</td>
                                            </tr>
            " >> projet-bash-site.html                                                                                                                                 # ||
            echo -e "\n\033[33mimpronta md5:\033[0m $lignemd5 \n\033[33mpercorso completo del $4: \033[0m$lignechemin \n\033[33mnome del file:\033[0m $lignenom \n"      # ||
            echo -e "\nimpronta md5: $lignemd5 \npercorso completo del $4: $lignechemin \nnome del file: $lignenom \n" >> $md5                                           # ||
            nbdifferences=`expr $nbdifferences + 1`                                                                                                                    # ||
        fi                                                                                                                                                             # ||
    done < $1                                                                                                                                                          # \/ Met dans le fichier md5.txt la liste des dossiers ou fichiers différents d'une arborescence par rapport à l'autre
    case $3 in
        1) nombredifferencefichier1=$nbdifferences;;
        2) nombredifferencefichier2=$nbdifferences;;
        3) nombredifferencedossier1=$nbdifferences;;
        4) nombredifferencedossier2=$nbdifferences;;
    esac
}





clear






while [ $versionComplete -ne 0 ] && [ $versionComplete -ne 1 ]
do
    echo -e "\033[32mDesidera la versione completa del programma \033[0m\033[31m(1=SI/0=NO)\033[0m\033[32m?\033[0m"
    read versionComplete
done
while [ ! -d $cheminversmd5 ]
do
    cheminversmd5=$PWD
    while [ $Booldestination -ne 0 ] && [ $Booldestination -ne 1 ]
    do
       echo -e "\033[32mModificare la directory di destinazione di md5.txt :\033[0m\033[33m($PWD)\033[0m\033[31m(1=SI/0=NO)?\033[0m"
       read Booldestination
    done
    if test $Booldestination -eq 1
    then
        echo -e "\033[31mDove si desidera salvare md5.txt?\033[0m"
        read cheminversmd5
    fi
done
md5="md5.txt"

clear

    echo "Avvio del programma in :"                                     # ||
                                                                        # ||
                                                                        # ||
    echo -e "\033[31m\r 3 \c\033[0m"                                    # ||
    sleep 1                                                             # ||
    echo -e "\033[36m\r 2 \c\033[0m"                                    # ||
    sleep 1                                                             # ||
    echo -e "\033[32m\r 1 \c\033[0m"                                    # ||
    sleep 1                                                             # \/
    echo -e "\033[32m\r Andare \033[0m"                                 #Décompte à rebours (optionnel)


sleep 0.2
clear


echo -e "\nverifica dei \033[31merore\033[0m eventuali...\n\n"


if test $# -ne 2                                                            # ||                                                                         # ||
then                                                                        # ||                                                                         # ||
    echo -e "\033[32mInserisci il primo albero :\033[0m"                    # ||                                                                         # ||
    read arbo1                                                              # ||                                                                         # ||
    echo -e "\033[32mInserisci la seconda albero :\033[0m"                  # ||                                                                         # ||
    read arbo2                                                              # ||                                                                         # ||
    echo -e "        \033[36m1\033[0m\033[31m/6\033[0m passi riusciti"      # ||                                                                         # ||
else                                                                        # ||                                                                         # ||
    echo -e "        \033[36m1\033[0m\033[31m/6\033[0m passi riusciti"      # \/                                                                         # ||
fi                                                                          #Vérifie que il n'y as que 2 paramètres rentrés par l'utilisateur            # ||
                                                                                                                                                         # ||
sleep 0.2                                                                                                                                                # ||
n=2                                                                                                                                                      # ||
Sidossier "$arbo1"                                                                                                                                       # ||
                                                                                                                                                         # ||
sleep 0.2                                                                                                                                                # ||
n=3                                                                                                                                                      # ||
Sidossier "$arbo2"                                                                                                                                       # ||
                                                                                                                                                         # ||
sleep 0.2                                                                                                                                                # ||
n=4                                                                                                                                                      # ||
Sivide "$arbo1"                                                                                                                                          # ||
                                                                                                                                                         # ||
sleep 0.2                                                                                                                                                # ||
n=5                                                                                                                                                      # ||
Sivide "$arbo2"                                                                                                                                          # ||
                                                                                                                                                         # ||
sleep 0.2                                                                                                                                                # ||
                                                                                                                                                         # ||
if test ! -z $arbo1 && test ! -z $arbo2                                                 # ||                                                             # ||
then                                                                                    # ||                                                             # ||
    echo -e "        \033[36m6\033[0m\033[31m/6\033[0m passi riusciti\n"                # ||                                                             # ||
else                                                                                    # ||                                                             # ||
    echo -e "\033[31mErore ! \033[0m Arborescenza(i) vuoto(i) rilevato(i)"              # ||                                                             # ||
    exit                                                                                # \/                                                             # ||
fi                                                                                      #Vérifie qu'une des deux arborescence est rempli                 # \/ Vérification des erreurs éventuelles


sleep 0.1






echo -e "\033[32mIl programma può essere avviato correttamente.\033[0m"
echo -e "\033[31mInformazione\033[0m : Il programma supporta gli spazi\n" 

sleep 3
clear






for ((i=1 ; i <= 2 ; i++))                                                          #Boucle for qui permet de séparer le travail que l'on a avec 1 arborescence, du travail que l'on a avec l'autre
do

    définitionsvariable
    
    sed -i "/^[ \t]*$/d" $arbo                                                       #Suppression lignes vides de $arbo

    
    while read ligne                                                        # ||
    do                                                                      # ||
        if test -d "$ligne"                                                 # ||
        then                                                                # ||
            sousRep="$ligne"                                                # ||
        else                                                                # ||
            echo $sousRep"/"$ligne                                          # ||
        fi 2>log                                                            # \/
    done < $arbo > $listeArbo                                               #On créé des chemins complets pour chaque fichier dans l'arbo(Le fichier qui liste le contenue complet des arborescences est fini)
    
    
    arret=1
    arret=0
    echo "Lettura delle impronte md5 dei file dell’Arbo" $i
    
    
    while read ligne                                                        # ||
    do                                                                      # ||
        if test -f "$ligne"                                                 # ||
        then                                                                # ||
        echo "$ligne" >> $listeFichier                                      # ||
        fi                                                                  # ||
        if test ! -f "$ligne"                                               # ||
        then                                                                # ||
        echo "$ligne" >> $Dossier                                           # ||
        fi                                                                  # \/
    done < $listeArbo 2>log                                                 #Sépare les fichiers et les dossiers de listeArbo, dans des fichiers .txt différents (place les erreurs dans un fichier log)
    
    
    while read ligne                                                        # ||
    do                                                                      # ||
        Variablemd5fichier=`md5sum "$ligne"`                                # ||
        echo $Variablemd5fichier >> $md5fichier                             # \/
    done < $listeFichier                                                    #Pour chaque fichiers listés dans listeFichier, on convertit la ligne en md5 et on les place dans un fichier temporaire nommé md5fichier
    
    
    supprLignesVides $listeArbo                                             #Suppression lignes vides de listeArbo
    supprLignesVides $md5dossier                                            #Suppression lignes vides de md5dossier
    supprLignesVides $md5fichier                                            #Suppression lignes vides de md5fichier

    
    echo "Lettura delle impronte md5 dei fascicoli"


    sed -i "s/\/\//\n\//g" $Dossier                                         #Bug corrigé dans Dossier.txt
    sed -i s/' '/'\\ '/g $Dossier                                           #Rend lisible les espaces par le programme
    
    
    
    while read ligne                                                                                            # ||
    do                                                                                                          # ||
    truncate -s 0 $md5sousdossier                                                                               # ||
    find "$ligne" -type d -name "*" | sed -e '/^[.]$*/d' | sed '1d'> $sousdossier                               # ||
    find "$ligne" -type f -name "*" | sed -e '/^[.]$*/d' >> $sousdossier                                        # ||
    while read line                                                                                             # ||
    do                                                                                                          # ||
        Variablemd5fichier=`md5sum "$line"`                                                                     # ||
        fichiersanschemin=`basename "$line"`                                                                    # ||
        echo $Variablemd5fichier | sed -e "s|$md5sousdossier|$line|g" >> $md5sousdossier                        # ||
        sed -i s/"[A-Za-z0-9][ ].*"/""/g "$md5sousdossier"                                                      # ||
        echo "$fichiersanschemin" | sed -e s/' '/'\\ '/g >> $md5sousdossier                                     # ||
    done < $sousdossier 2>log                                                                                   # ||
    Variablemd5fichier=`md5sum "$md5sousdossier"`                                                               # ||
    echo $Variablemd5fichier | sed -e "s|$md5sousdossier|$ligne|g" >> $md5dossier                               # \/
    done < $Dossier                                                                                             #Calcul des empreintes md5 des dossiers pour les mettre dans le fichier temporaire md5dossier
    

    supprEtoile $md5dossier                                                                                     #Suppression des éventuelles "*" dans $md5 (Elles ne sont pas censées être là)
    supprEtoile $md5sousdossier                                                                                 #Suppression des éventuelles "*" dans $md5 (Elles ne sont pas censées être là)
    supprEtoile $md5fichier                                                                                     #Suppression des éventuelles "*" dans $md5 (Elles ne sont pas censées être là)
    
    if test $i -eq 1                                                     #######Si l'on travaille dans la première arborescence (Création de sauvegarde de fichiers temporaires)
    then
    cp "$md5fichier" TempSauvegardemd5fichier1.txt
    cp "$md5dossier" TempSauvegardemd5dossier1.txt
    fi
    if test $i -eq 2                                                     #######Si l'on travaille dans la deuxième arborescence (Création de sauvegarde de fichiers temporaires)
    then
    cp "$md5fichier" TempSauvegardemd5fichier2.txt
    cp "$md5dossier" TempSauvegardemd5dossier2.txt
    fi
    
    
done 





trieparmd5 TempSauvegardemd5fichier1.txt Sauvegardemd5fichier1.txt   # ||
trieparmd5 TempSauvegardemd5fichier2.txt Sauvegardemd5fichier2.txt   # ||
trieparmd5 TempSauvegardemd5dossier1.txt Sauvegardemd5dossier1.txt   # ||
trieparmd5 TempSauvegardemd5dossier2.txt Sauvegardemd5dossier2.txt   # \/ Tri les lignes des fichiers en ne prenant en compte que les empreintes md5

echo "
<!DOCTYPE html>
<html lang= \"fr\">
    <head>                   
        <meta charset=\"utf-8\"/>
        <link rel=\"stylesheet\" href=\"projet-bash-site.css\"/>
        <title>Sito Web Progetto Bash 2019</title>
    </head>
    
    <body>
        <div id=\"page\">
            <div id=\"header\">
                <h1>Sito Web Progetto Bash 2019</h1>
                <h2>Ecco il nostro sito web potete trovare la tabella dei risultati qui sotto</h2>
            </div>
            <div id=\"containment\">
                <div id=\"content\">
                    <div class=\"article\">
    " >> projet-bash-site.html                                                 ############ LE FICHIER HTML(DEBUT)

if test $versionComplete -eq 1                                                              # ||
then                                                                                        # ||
    echo -e "\n\033[33mElenco dei diversi file del primo albero:\033[0m\n"                  # ||
    echo "<h3>Elenco dei diversi file del primo albero:</h3>
    " >> projet-bash-site.html                                                              # ||
    triedifferences Sauvegardemd5fichier1.txt                                               # ||
    echo -e "\n\033[33mElenco dei diversi file del secondo albero:\033[0m\n"                # ||
    echo "<h3>Elenco dei diversi file del secondo albero:</h3>
    " >> projet-bash-site.html                                                              # ||
    triedifferences Sauvegardemd5fichier2.txt                                               # ||
    echo -e "\n\033[33mElenco delle cartelle diverse del primo albero:\033[0m\n"            # ||
    echo "<h3>Elenco delle cartelle diverse del primo albero:</h3>
    " >> projet-bash-site.html                                                              # ||
    triedifferences Sauvegardemd5dossier1.txt                                               # ||
    echo -e "\n\033[33mElenco delle cartelle diverse del secondo albero:\033[0m\n"          # ||
    echo "<h3>Elenco delle cartelle diverse del secondo albero:</h3>
    " >> projet-bash-site.html                                                              # ||
    triedifferences Sauvegardemd5dossier2.txt                                               # ||
fi                                                                                          # \/ Affiche le tri des fichiers et dossiers par leurs empreintes md5


echo -e "\n\n\n\033[33mCreare un file md5.txt...\033[0m(Questa operazione può richiedere alcuni minuti a seconda della dimensione degli alberi)"


echo "
                        <br><br><table>
                            <tr>
                                <th>Nome</th>
                                <th>md5</th>
                            </tr>
                            <tr><td colspan=\"2\" class=\"important\">Differenze tra i vari file (arbo1>arbo2)</td></tr>
    " >> projet-bash-site.html

TexteEntreCorrEtDiff 1 2 file                                                            # ||
                                                                                         # ||
calculdifference TempSauvegardemd5fichier1.txt TempSauvegardemd5fichier2.txt 1  file     # ||
                                                                                         # ||
TexteEntreDiffEtCorr 1 2 $nombredifferencefichier1 file                                  # ||
                                                                                         # ||
if test $versionComplete -eq 1                                                           # ||
then                                                                                     # ||
echo "
                            <tr><td colspan=\"2\" class=\"important\">Corrispondenze dei file (arbo1>arbo2)</td></tr>
    " >> projet-bash-site.html                                                           # ||
fi                                                                                       # ||
                                                                                         # ||
calculcorrespondance TempSauvegardemd5fichier1.txt TempSauvegardemd5fichier2.txt file    # ||
                                                                                         # ||
TexteEntreCorrEtDiff 2 1 file                                                            # ||
                                                                                         # ||
echo "
                            <tr><td colspan=\"2\" class=\"important\">Differenze tra i vari file (arbo2>arbo1)</td></tr>
    " >> projet-bash-site.html                                                           # ||
                                                                                         # ||
calculdifference TempSauvegardemd5fichier2.txt TempSauvegardemd5fichier1.txt 2 file      # ||
                                                                                         # ||
TexteEntreDiffEtCorr 2 1 $nombredifferencefichier2 file                                  # ||
                                                                                         # ||
if test $versionComplete -eq 1                                                           # ||
then                                                                                     # ||
echo "
                            <tr><td colspan=\"2\" class=\"important\">Corrispondenze dei file (arbo2>arbo1)</td></tr>
    " >> projet-bash-site.html                                                           # ||
fi                                                                                       # ||
                                                                                         # ||
calculcorrespondance TempSauvegardemd5fichier2.txt TempSauvegardemd5fichier1.txt file    # ||
                                                                                         # ||
TexteEntreCorrEtDiff 1 2 cartelle                                                        # ||
                                                                                         # ||
echo "
                            <tr><td colspan=\"2\" class=\"important\">Differenze tra le cartelle (arbo1>arbo2)</td></tr>
    " >> projet-bash-site.html                                                           # ||
                                                                                         # ||
calculdifference TempSauvegardemd5dossier1.txt TempSauvegardemd5dossier2.txt 3 cartelle  # ||
                                                                                         # ||
TexteEntreDiffEtCorr 1 2 $nombredifferencedossier1 cartelle                              # ||
                                                                                         # ||
if test $versionComplete -eq 1                                                           # ||
then                                                                                     # ||
echo "
                            <tr><td colspan=\"2\" class=\"important\">Correlazioni tra le cartelle (arbo1>arbo2)</td></tr>
    " >> projet-bash-site.html                                                           # ||
fi                                                                                       # ||
                                                                                          # ||
calculcorrespondance TempSauvegardemd5dossier1.txt TempSauvegardemd5dossier2.txt cartelle # ||
                                                                                          # ||
TexteEntreCorrEtDiff 2 1 cartelle                                                        # ||
                                                                                         # ||
echo "
                            <tr><td colspan=\"2\" class=\"important\">Differenze tra le cartelle (arbo2>arbo1)</td></tr>
    " >> projet-bash-site.html                                                           # ||
                                                                                         # ||
calculdifference TempSauvegardemd5dossier2.txt TempSauvegardemd5dossier1.txt 4 cartelle  # ||
                                                                                         # ||
TexteEntreDiffEtCorr 2 1 $nombredifferencedossier2 dcartelle                              # ||
                                                                                         # ||
if test $versionComplete -eq 1                                                           # ||
then                                                                                     # ||
echo "
                            <tr><td colspan=\"2\" class=\"important\">Correlazioni tra le cartelle (arbo2>arbo1)</td></tr>
    " >> projet-bash-site.html                                                           # ||
fi                                                                                       # ||
                                                                                         # ||
calculcorrespondance TempSauvegardemd5dossier2.txt TempSauvegardemd5dossier1.txt dossier # \/ Affiche à l'écran les correspondances et différences des deux arborescences





nombredifferencefichier=`expr $nombredifferencefichier1 + $nombredifferencefichier2`
nombredifferencedossier=`expr $nombredifferencedossier1 + $nombredifferencedossier2`
echo -e "\n\033[31m----------------------------------------------------------------------------------------------------------\033[0m\n\n"
echo -e "\n\033[36mC’è un sacco di roba\033[0m \033[32m$nombredifferencefichier\033[0m \033[36mfile diversi\033[0m\n"
echo -e "\033[36mC’è un sacco di roba\033[0m \033[32m$nombredifferencedossier\033[0m \033[36mcartelle diverse\033[0m\n"

echo "
                                         </table>
                                         <br><hr><br>
                                         <h2>Il y a $nombredifferencefichier file diversi e $nombredifferencedossier cartelle diverse</h2>
    " >> projet-bash-site.html
    
if [[ $nombredifferencefichier == 0 ]] && [[ $nombredifferencedossier == 0 ]] # ||
then                                                                          # ||
echo -e "\n\033[36mLe due directory sono identiche\033[0m"                    # ||
echo " <h2 class=\"rouge\">Le due directory sono dunque identiche</h2>
    " >> projet-bash-site.html                                                # ||
else                                                                          # ||
echo -e "\n\033[36mLe due directory nonsono identiche\033[0m\n\n"             # ||  
echo " <h2 class=\"rouge\">Le due directory sono dunque diverse</h2>
    " >> projet-bash-site.html                                                # ||                                
fi                                                                            # \/ Compare les empreintes md5 et indique si les deux arborescences sont identiques

mv $md5 $cheminversmd5 2>log                                                  #Déplace le fichier md5 là où on lui a demandé de le placer 

echo "
                                     </div>
                                 </div>
                             </div>
                            <div id=\"footer\">
                                &copy; Copyright 2019 Eliot Masset - Maxene Ikarionen - Hugo Di Piazza - Tutti i diritti riservati
                            </div>
                        </div>
                    </body>
                </html>
    " >> projet-bash-site.html                                                 ############ LE FICHIER HTML(FIN)
echo "
    body {
    font-family: Tahoma, Geneva, sans-serif;
    background-color: black;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
    margin: 0px;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

#page {
    width: 800px;
    margin: auto;
    flex-grow: 1;
}

#header {
    height: 120px;
}

#header h1 {
    font-size: 300%;
    color: white;
    margin-bottom: 0px;
    margin-left: 5px;
}

#header h2 {
    font-size: 120%;
    color: white;
    margin-top: 0px;
    margin-left: 5px;
}

#content {
    margin-left: 85px;
    margin-right: 85px;
}

.article {
    min-height: 155px;
    color: black;
    text-align: left;
    background-color: rgba(255, 255, 255, 0.5);
    margin-bottom: 1em;
    padding: 1em;
    border-radius: 25px;
}

table {
    text-align: center;
}

.rouge {
    color:red;
}
.important {
    color: white;
    font-size: 130%;
}
th {
    background-color: white;
}
td {
    width: 50%;
    text-align: center;
}

#footer {
    color: white;
    font-size: 0.8em;
    text-align: center;
    background-color: rgba(255, 255, 255, 0.2);
    margin-top: 50px;
    padding: 20px;
    clear: both;
}
" >> projet-bash-site.css                                                 ############ LE FICHIER CSS
rm -f tempListe*                                                          # ||
rm -f TempSauvegarde*                                                     # ||
rm -f tempmd5*                                                            # ||
rm -f listeArborescence*                                                  # ||
rm -f listeFichier*                                                       # ||
rm -f Sauvegarde*                                                         # \/ Suppression des fichiers temporaires
firefox "projet-bash-site.html" 2>log

rm -f projet-bash-site.html
rm -f projet-bash-site.css
