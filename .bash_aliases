alias vim='nvim'
alias cdw='cd /mnt/c/User/Flori/Workspace'

#strings
cstring="#include <iostream>

int main() {

	std::cout << \"Hello World\" << std::endl;
	return 0;
}"

compile="g++ main.cpp -o main"

run="clear

echo -e \"\e[1;34mStart compiling.. \e[0m\"

if ./compile; then
	echo -e \"\e[1;32mFinished compiling.. \e[0m\"
	echo -e \"\"
	echo -e \"\e[1;34mShowing compiling.. \e[0m\"
	echo -e \"\"
	if test -e ./main; then
		./main
	elif test -e ./main.exe; then
		./main.exe
	fi
	echo -e \"\"
else
	echo -e \"\e[1;31mFailed compiling.. \e[0m\"
fi
"

mkcdir () {
	mkdir -p -- "$1" &&
	cd -P -- "$1"
}

mkwdir () {
	if [ "$2" = "c++" ]; then
		mkdir -p -- "$1" && cd -P -- "$1" && touch main.cpp
		echo "$cstring" >> main.cpp
		echo "$compile" >> compile
		echo "$run" >> run
		chmod +x compile
		chmod +x run
		vim main.cpp
	elif [ "$2" = "python" ]; then
		mkdir -p -- "$1" && cd -P -- "$1" && touch main.py
		touch main.py
		echo "print(\"Hello World\")" >> main.py
		vim main.py
	fi
}

updategit() {
	echo "
#Für Florian
compile
run" >> .gitignore
}

openeis() {
	xdg-open https://luna.informatik.uni-mainz.de/eis20/
}
