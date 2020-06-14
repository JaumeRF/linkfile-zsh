###########################################################
#							  #
#                   LINKFILE PLUGIN   			  #
#							  #
#	      CREATED BY: Jaume Ros Fuster		  #
#                      15/06/2020			  #
#							  #
#             https://github.com/JaumeRF		  #
#							  #
###########################################################

##########################
#       Settings         #
##########################

default var_prefix "§"

if [ -f "${HOME}/.linkfile/.indexfile" ]
then
    default index_file "${HOME}/.linkfile/.indexfile";

else

    mkdir ${HOME}/.linkfile;
    touch ${HOME}/.linkfile/.indexfile;
    default index_file "${HOME}/.linkfile/.indexfile";

fi


##########################
#       Link a path      #
##########################

function linkfile () {

    test "$2" || 2="."
    file=$2:A

    test "$1" || 1="$(basename "$file")"
    name=$(echo "$1" | tr " " "_")

    if  grep -q "<·> "$1" ->" "${index_file}" 
    then

        echo "The name is already in use";

    elif grep -q "$file" "${index_file}"
    then
        echo "This file or directory has another shortcut. Do you wish to continue?";
	select yn in "Yes" "No"; do
            case $yn in
           	Yes ) echo "<·> "$name" -> "$(echo "$file")"" >> "${index_file}"; break;;
           	No ) exit;;
            esac
   	done
    
    else
    
   
        echo "<·> "$name" -> "$(echo "$file")"" >> "${index_file}"

    fi
}

##############################
#         Get a path         #
##############################

function "${var_prefix}" () {
 
    if  grep -q "<·> "$1" ->" "${index_file}" 
    then
        linkpath=$(grep -w "$1" "${index_file}")
        cleanpath=$(echo "$linkpath" | sed 's/\<\·\>[ ][^ ]*[ ][-]\>[ ]//')
#       echo "$linkpath" | sed 's/$1//'
        cd "$cleanpath"
    else
        echo "This link doesn't exist"
    fi

}

##############################
#      List the links        #
##############################

function linkfile_list () {

    echo "------------------------------------"
    echo ""
    cat "${index_file}"
    echo ""
    echo "------------------------------------"
}

##############################
#      Remove one link       #
##############################

function linkfile_remove () {
    mv "${HOME}/.linkfile/.indexfile" "${HOME}/.linkfile/.indexfile-old";
    grep -vwE "$1" "${HOME}/.linkfile/.indexfile-old" > "${HOME}/.linkfile/.indexfile"
    rm "${HOME}/.linkfile/.indexfile-old"

}

##############################
#      Delete all links      #
##############################

function linkfile_delete () {

    echo "Do you wish to delete all your links?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) rm "${index_file}";touch ${HOME}/.linkfile/.indexfile;    
		default index_file "${HOME}/.linkfile/.indexfile"; break;;
            No ) exit;;
        esac
    done
}
##############################
#         Shortcuts          #
##############################

alias lf=linkfile
alias lfls=linkfile_list
alias lfrm=linkfile_remove

# to go to a file or directory
# write '§' (you can change this key in default var_prefix) and the name of your link

##############################
