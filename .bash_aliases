alias vim='nvim'
alias cdw='cd /mnt/c/Users/Flori/Workspace'
alias py='python3'
alias removetmp='cd .. && rm -r tmp'

#strings
pstring="def main():
    print(\"Hello World\")

if __name__ == \"__main__\":
    main()
"

cstring="#include <iostream>

int main() {

	std::cout << \"Hello World\" << std::endl;
	return 0;
}"

compile="g++ main.cpp -o main -std=c++2a"

run="clear

echo -e \"\e[1;34mStart compiling.. \e[0m\"

if ./compile; then
	echo -e \"\e[1;32mFinished compiling.. \e[0m\"
	echo -e \"\"
	echo -e \"\e[1;34mShow compiled.. \e[0m\"
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
		vim +5 main.cpp
	elif [ "$2" = "python" ]; then
		mkdir -p -- "$1" && cd -P -- "$1" && touch main.py
		touch main.py
		echo "$pstring" >> main.py
		vim +2 main.py
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

function projects() {
    local projects_dir="/home/flo/testmk"
    local selected_dir
    selected_dir=$(
        find "$projects_dir"/* -maxdepth 1 -type d -printf "%f\n" | fzf-tmux -p 50%,50% \
            --prompt 'Projects > '
    )
    if [ -n "$selected_dir" ]; then
        cd "$projects_dir/$selected_dir" || return 1
    fi
}

function test() {
    RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
    INITIAL_QUERY="${*:-}"
    : | fzf-tmux -p 90%,90% --disabled --query "$INITIAL_QUERY" \
        --bind "start:reload:$RG_PREFIX {q}" \
        --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
        --ansi \
        --color "hl:-1:underline,hl+:-1:underline:reverse" \
        --prompt 'All> ' \
        --delimiter : \
        --header 'CTRL-D: Directories / CTRL-F: Files' \
        --preview 'bat --color=always {1} --highlight-line {2} --style=numbers --line-range=:500' \
        --preview-window 'right,60%,+{2}+3/3,~3' \
        --pointer '▶' \
        --marker '⇒' \
        --bind 'enter:execute(code {1} -g {2})'
}

function fzf() {
    local selected_file
    selected_file=$(find * | fzf-tmux -p 90%,90% \
        --prompt 'All> ' \
        --header 'CTRL-D: Directories / CTRL-F: Files' \
        --preview 'bat --color=always --style=numbers --line-range=:500 {}' \
        --preview-window 'right,60%' \
        --bind 'ctrl-d:change-prompt(Directories> )+reload(find * -type d)+toggle-preview' \
        --bind 'ctrl-f:change-prompt(Files> )+reload(find * -type f)+toggle-preview' \
        --pointer '▶' \
        --marker '⇒')

    if [ -n "$selected_file" ]; then
        code "$selected_file"
    fi
}

function kill() {
    (
        date
        ps -ef
    ) |
        fzf-tmux -p 90%,90% --bind="ctrl-r:reload(date; ps -ef)" \
            --header=$'Press CTRL-R to reload\n\n' --header-lines=2 \
            --preview="echo {}" --preview-window=down,3,wrap \
            --layout=reverse --height=80% | awk '{print $2}' | xargs kill -9
}

function be() {
    RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
    INITIAL_QUERY="${*:-}"
    : | fzf --ansi --disabled --query "$INITIAL_QUERY" \
        --bind "start:reload:$RG_PREFIX {q}" \
        --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
        --delimiter : \
        --preview 'bat --color=always {1} --highlight-line {2}' \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
        --bind 'enter:become(vim {1} +{2})'
}
