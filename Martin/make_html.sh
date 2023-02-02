#!/usr/bin/env bash

a_in=(
  martin_tourneboeuf_cv_english
  martin_tourneboeuf_cv_french
  martin_tourneboeuf_cv_spanish
)

a_in=(
  martin_tourneboeuf_cv_english
)

mypdf() {
  for f in "${a_in[@]}"; do
    xelatex $f.tex
  done
}

myhtml() {
  for f in "${a_in[@]}"; do
	  TEXINPUTS="../Cmd:" htxelatex $f.tex "to_html.cfg,html,css-in,charset=utf-8" " -cunihtf -utf8"
  done
}

myconfigure() {
  for f in "${a_in[@]}"; do

    # Remove doctype
    perl -0777 -pe ' s/\<!DOCTYPE.*?\>//s' -i.bak $f.html
    # Fix de merde to remove prefix sapce and avoid <pre> inserted by pandoc
    perl -0777 -pe ' s:\s*(\</?(td|ul|li|span|div)):$1:gs' -i.bak $f.html
    # Fix de merde avoid: <p class="noindent">
    perl -0777 -pe ' s:<p class="noindent">::gs' -i.bak $f.html

    cat $f.html \
      | pandoc --no-highlight --standalone --self-contained --title "CV Martin Tourneboeuf"-o $f.html
  done
}

mycopy(){
  for f in "${a_in[@]}"; do
    cp $f.html ~/Software/Html/Page/cv/
  done
}

make_html(){
  echo -e "\n\nCompile"
  myhtml

  echo -e "\n\nConfigure"
  myconfigure

  echo -e "\n\nDeploy"
  mycopy
}

if ! (return 0 2>/dev/null); then
  make_html
fi
