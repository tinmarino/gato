
compile() {
    htxelatex martin_tourneboeuf_cv_english.tex "to_html.cfg,html,css-in,charset=utf-8" " -cunihtf -utf8"
}

configure() {
    cat martin_tourneboeuf_cv_english.html \
        | perl -0777 -pe 's/\<!DOCTYPE.*?\>//s' \
        | pandoc --self-contained -o martin_tourneboeuf_cv_english.html
}

#         | iconv -t utf-8  \
# <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 plus MathML 2.0//EN" 
# "http://www.w3.org/Math/DTD/mathml2/xhtml-math11-f.dtd" > 
