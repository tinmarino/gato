myfiles="martin_tourneboeuf_cv_english martin_tourneboeuf_cv_french martin_tourneboeuf_cv_spanish"

mypdf() {
    for f in $myfiles; do
        xelatex $f.tex
    done
}

myhtml() {
    for f in $myfiles; do
        htxelatex $f.tex "to_html.cfg,html,css-in,charset=utf-8" " -cunihtf -utf8"
    done
}

myconfigure() {
    for f in $myfiles; do

        perl -0777 -pe ' s/\<!DOCTYPE.*?\>//s' -i.bak $f.html
        # Fix de merde for table
        perl -0777 -pe ' s:\s*(\</?(td|ul|li)):$1:gs' -i.bak $f.html
        cp $f.html $f_1.html

        cat $f.html \
            | pandoc --no-highlight --standalone --self-contained -o $f.html
    done
}

mycopy(){
    for f in $myfiles; do
        cp $f.html ~/Software/Html/Page/cv/
    done
}
