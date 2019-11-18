
mcompile() {
    htxelatex martin_tourneboeuf_cv_english.tex "to_html.cfg,html,css-in,charset=utf-8" " -cunihtf -utf8"
}

mconfigure() {
    perl -0777 -pe ' s/\<!DOCTYPE.*?\>//s' -i.bak martin_tourneboeuf_cv_english.html
    # Fix de merde
    perl -0777 -pe ' s:\s*(\</?(td|ul|li)):$1:gs' -i.bak martin_tourneboeuf_cv_english.html
    cp martin_tourneboeuf_cv_english.html martin_tourneboeuf_cv_english_1.html

    cat martin_tourneboeuf_cv_english.html \
        | pandoc --no-highlight --standalone --self-contained -o martin_tourneboeuf_cv_english.html
}

mmove(){
    cp martin_tourneboeuf_cv_english.html ~/Software/Html/Page/cv/
}
