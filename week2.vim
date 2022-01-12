# BASH
# YASSIN

cd ~/Documents/assignments

files=(*.jpeg)
total=${#files[@]}
test_tijd=$(date -d 'now - 1 day' +%s)
zeven_dagen=$(date -d 'now - 7 days' +%s)
dertig_dagen=$(date -d 'now - 30 days' +%s)
huidige_data=$(date -r "$files" +%s)

for f in "${files[@]}";
do
        if [[ -n $files ]];
        then
                echo "Het fotobestand is gevonden."
                echo "Hoe oud mogen de files zijn?"
                echo "U heeft de keuze uit week [w/W] of maand [m/M]."
                read ans
                echo "U heeft gekozen voor $ans."

                if [[ $ans == "w" || $ans == "W" ]];
		then
                        if (( huidige_data <= zeven_dagen ));
                        then
                                echo "Er is een bestand gevonden dat ouder is dan zeven dagen."
                                mkdir $(date +%V)
                                cp $files $(date +%V)
                                echo "Het in week "$(date +%V)" geopende bestand is verplaatst."

                        else
                                echo "Er is geen bestand gevonden dat ouder is dan zeven dagen.."
                        fi

                elif [[ $ans == "m" || $ans == "M" ]];
                then
                        if (( huidige_data <= dertig_dagen ));
                        then
                                echo "Er is een bestand gevonden dat ouder is dan dertig dagen."
                                mkdir $(date +%B)
                                cp $files $(date +%B)
                                echo "Het in "$(date +%B)" geopende bestand is verplaatst."
                        else
                                echo "Er is geen bestand gevonden dat ouder is dan dertig dagen.."
                        fi
                fi

        else
                echo "Geen fotobestand gevonden.."
        fi
done
