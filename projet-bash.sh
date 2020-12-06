echo -e "\033[31m\nLanguage :\n\033[0m"
echo -e "\033[32mEnglish - En\033[0m"
echo -e "\033[33mFrançais - Fr\033[0m"
echo -e "\033[32mLatin - La\033[0m"
echo -e "\033[33mChinese - Ch\033[0m"
echo -e "\033[32mItalian - It\033[0m"
echo -e "\033[33mEspañol - Es\033[0m"
echo -e "\033[32mDeutsch - De\033[0m"
reponse="Null"


while test "$reponse" != "En" || test "$reponse" != "Fr" || test "$reponse" != "La" || test "$reponse" != "Ch" || test "$reponse" != "It" || test "$reponse" != "Es" || test "$reponse" != "De"  # ||
do                                                                                                                                                                                               # ||
	read reponse                                                                                                                                                                                 # ||
	case $reponse in                                                                                                                                                                             # ||
		En) cd projet-en                                                                                                                                                                         # ||
			bash projet-bash.sh $1 $2                                                                                                                                                            # ||
			exit;;                                                                                                                                                                               # ||
		Fr) cd projet-fr                                                                                                                                                                         # ||
			bash projet-bash.sh $1 $2                                                                                                                                                            # ||
			exit;;                                                                                                                                                                               # ||
		La) cd projet-la                                                                                                                                                                         # ||
			bash projet-bash.sh $1 $2                                                                                                                                                            # ||
			exit;;                                                                                                                                                                               # ||
		Ch) cd projet-ch                                                                                                                                                                         # ||
			bash projet-bash.sh $1 $2                                                                                                                                                            # ||
			exit;;                                                                                                                                                                               # ||
		It) cd projet-it                                                                                                                                                                         # ||
			bash projet-bash.sh $1 $2                                                                                                                                                            # ||
			exit;;                                                                                                                                                                               # ||
		Es) cd projet-es                                                                                                                                                                         # ||
			bash projet-bash.sh $1 $2                                                                                                                                                            # ||
			exit;;                                                                                                                                                                               # ||
		De) cd projet-de                                                                                                                                                                         # ||
			bash projet-bash.sh $1 $2                                                                                                                                                            # ||
			exit;;                                                                                                                                                                               # ||
		*) echo -e "\033[31mEnter (It, Fr, Ch, La, En, Es, De)\033[0m"                                                                                                                           # ||
	esac                                                                                                                                                                                         # ||
done                                                                                                                                                                                             # \/ Choix du language
