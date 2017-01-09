% Copyright (C) 2012  Nicola Fontana <ntd at entidi.it>
%
% This program can be redistributed and/or modified under
% the terms of the LaTeX Project Public License, either
% version 1.3 of this license or (at your option) any later
% version. The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all LaTeX distributions
% version 2005/12/01 or later.
%
% Based on the original idea by Alessandro Plasmati found at
% http://www.latextemplates.com/template/two-column-one-page-cv
%
% The most relevant changes from his work are:
%
% * this is a class, not a template document;
% * tccv is based on scrartcl (from Koma-script), not on article;
% * the fonts are selected from the PSNFSS collection, so no
%   custom font installation should be required;
% * heavily based the implementation on custom environments and
%   macros, so the document is much easier to read (and customize);
% * it is plain LaTeX/Koma-script, so the CV can be compiled
%   with the usual tools, latex and pdflatex included.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tccv}
              [2012/11/09 v1.0
 Two Column Curriculum Vitae]

\LoadClass[10pt]{scrartcl}

\setcounter{secnumdepth}{-1}
\RequirePackage{bookman,etoolbox,hyperref,marvosym,needspace,tabularx,xcolor}
\let\cvitem\item


% Capitalize words of at least a minimum length (default to 3 chars).
% The text is capitalized before being expanded.
%
% This macro uses Lua to do the job but fails gracefully (that is,
% return the text as is) if \directlua is not available.
%
% |[
% \ucwords[optional: miminum length]{text}
% ]|
\newcommand\ucwords[2][3]{%
    % Fails gracefully if not in LuaLaTeX
    \providecommand\directlua[1]{#2}%
    \directlua{%
	local minlen=tonumber("#1")
	local src="\luaescapestring{\unexpanded{#2}}"
	local dst={}
	for w in src:gmatch('[^\string\%s]+') do
	    if w:len() >= minlen then w = w:sub(1,1):upper()..w:sub(2) end
	    table.insert(dst, w)
	end
	tex.print(dst)}}

\pagestyle{empty}
\setlength\parindent{0pt}
\color[HTML]{303030} % Default foreground color
\definecolor{link}{HTML}{506060} % Hyperlinks
\hypersetup{colorlinks,breaklinks,urlcolor=link,linkcolor=link}
%\setkomafont{disposition}{\color[HTML]{801010}}
\definecolor{mybluegrey}{HTML}{101080}
\setkomafont{section}{\bodyfont\color[HTML]{101080}\scshape\Large\mdseries}

% Font 
\RequirePackage{fontawesome}
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir
\definecolor{awesome-skyblue}{HTML}{0395DE}

\fontdir[fonts/]
\colorlet{awesome}{awesome-skyblue}


\newcommand{\mission}[1]{\makebox[1.4cm][l]{\textbf{#1}}}



%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
% Awesome colors
\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}
\colorlet{awesome}{awesome-red}

% Awesome section color
\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        awesome\or%
        awesome\or%
        awesome\or%
        awesome\or%
        awesome\else%
        awesome\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}


%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
% Set font for header (default is Roboto)
\newfontfamily\headerfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}

% Set font for footer (default is Source Sans Pro)
\newfontfamily\footerfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-It,
  BoldFont=*-Bold
]{SourceSansPro}

% Set font for body (default is Source Sans Pro)
\newfontfamily\bodyfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-It,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldIt
]{SourceSansPro}

\newfontfamily\bodyfontlight[
  Path=\@fontdir,
  UprightFont=*-Light,
  ItalicFont=*-LightIt,
  BoldFont=*-Semibold,
  BoldItalicFont=*-SemiboldIt
]{SourceSansPro}

% Main roman font 
\setromanfont[
  Path=\@fontdir,
  UprightFont=*-Light,
  ItalicFont=*-LightIt,
  BoldFont=*-Semibold,
  BoldItalicFont=*-SemiboldIt,
]{SourceSansPro}


\newcommand*{\descriptionstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text} #1}}		% Description
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{32pt}{1em}\headerfontlight\color{graytext} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{32pt}{1em}\headerfont\bfseries\color{text} #1}}
\newenvironment{descriptionenvironement}{\descriptionstyle}{\par}
\usepackage{color, hyperref}
\newcommand{\Myhref}[2]{\href{#1}{\color{mybluegrey}{#2}}}					% ici la pona choisit la couleur pour la fonction "Myhref"


% Overrides the \section command to capitalize every
% word for cosmetic purposes and draws a rule under it.
\makeatletter
\let\old@section\section
\renewcommand\section[2][]{%
    \old@section[#1]{\ucwords{#2}}%
    \newdimen\raising%
    \raising=\dimexpr-0.7\baselineskip\relax%
    \vskip\raising\hrule height 0.4pt\vskip-\raising}
\makeatother

% Allow conditionals based on the job name. This can usually be set
% from a command-line argument: check fausto.en.tex for an example.
%
% |[
% \ifjob{jobname}{content if matches}{content if does not match}
% ]|
\newcommand\ifjob[3]{%
    \edef\JOBNAME{\jobname}%
    \edef\PIVOT{\detokenize{#1}}%
    \ifdefstrequal{\JOBNAME}{\PIVOT}{#2}{#3}%
}

% Renders a personal data box:
%
% |[
% \personal[optional: web site without scheme (no http:// prefix)]
%          {address}{phone number}{email}
% ]|
\newcommand\personal[4][]{%
    \needspace{0.5\textheight}%
    \newdimen\boxwidth%
    \boxwidth=\dimexpr\linewidth-2\fboxsep\relax%
    \begin{tabularx}{\boxwidth}{c|X}
    \Writinghand & \normalsize  \bodyfont{#2}\smallskip\\   %ADDR 
    \Telefon     & \normalsize  \bodyfont{#3}\smallskip\\	% TEL 
    \Letter      & \normalsize  \bodyfont{#4}	% EMAIL 
    \ifstrempty{#1}{}{\smallskip\\ \Lightning & \href{http://#1}{#1}}
    \end{tabularx}}

% Every \item can be followed by one or more paragraphs
% of description:
%
% |[
% \item{date range}{company}{role}
%
% Description of what achieved during this application.
% ]|
\newenvironment{eventlist}{%
   % \setlength\itemsep{0cm}
    \renewcommand\item[3]{%
	{\raggedleft\sc{\bodyfont{##1}}\\[1pt]}                 % YEAR 
	\sc\bfseries{\bodyfont{##3}}\\[1pt]             	% POSTE 
	\sc\bodyfont{##2}\\[1pt]		                % COMPANY
    }
}

% Use only \item inside this environment: no other macros
% are allowed:
%
% |[
% \item[optional: what has been achieved]{years}{subject}{notes}
% ]|
\newenvironment{yearlist}{%
    \renewcommand\item[4][]{%
	\sc{\bodyfont{##2}} \hspace{0.2cm} \bfseries{\bodyfont{##3}} \\[1pt]
	\sc{\bodyfont{##1}} \\[4pt]						
	\it{\descriptionstyle{##4}} \\
    }  
}

\newenvironment{education}
{
    \mdfsetup{
      middlelinecolor=mybluegrey,
      middlelinewidth=1pt,
      backgroundcolor=white!0,
      roundcorner=10pt,
      skipabove=30,
      fontcolor=black,
      innertopmargin=-10pt,
      innerrightmargin=17pt,
    }

    \begin{textblock}{9}(1,4)
    \begin{mdframed}
    \section{Éducation}
    \begin{yearlist}
}
{
    \end{yearlist}
    \end{mdframed}
    \end{textblock}
}

\newenvironment{competence}
{
    \mdfsetup{
      middlelinecolor=mybluegrey,
      middlelinewidth=1pt,
      backgroundcolor=white!0,
      roundcorner=10pt,
      skipabove=30,
      fontcolor=black,
      innertopmargin=-10pt,
      innerrightmargin=17pt,
    }
    
    \begin{textblock}{9}(1,19)
    \begin{mdframed}
}
{
     
    \end{mdframed}
    \end{textblock}
}

\newenvironment{aptitude}
{
    \mdfsetup{
      middlelinecolor=mybluegrey,
      middlelinewidth=1pt,
      backgroundcolor=white!0,
      roundcorner=10pt,
      skipabove=30,
      fontcolor=black,
      innertopmargin=-10pt,
      innerrightmargin=17pt,
    }
    
    \begin{textblock}{11}(10,17)
    \begin{mdframed}
}
{
     
    \end{mdframed}
    \end{textblock}
}

\newenvironment{experience}
{


    \mdfsetup{
      middlelinecolor=mybluegrey,
      middlelinewidth=1pt,
      backgroundcolor=white!0,
      roundcorner=10pt,
      skipabove=30,
      fontcolor=black,
      innertopmargin=-10pt,
      innerrightmargin=17pt,
      middlelinecolor=white!0
    }
    

    \begin{textblock}{11}(10,4)
    \begin{mdframed}
    \section{Expérience Professionnelle}
    \begin{eventlist}
}
{
    \end{eventlist}
    \end{mdframed}
    \end{textblock}
}



% Use only \item inside this environment: no other macros
% are allowed:
%
% |[
% \item{fact}{description}
% ]|
\newenvironment{factlist}{%
    \newdimen\unbaseline
    \unbaseline=\dimexpr-\baselinestretch\baselineskip\relax
    \renewcommand\item[2]{%
	\raggedleft\textsc{\bodyfont{##1}} & {\raggedleft\descriptionstyle{##2}}\\
    }
    \tabularx{\linewidth}{ll}}
    {\endtabularx}
    
\newenvironment{softwarelist}{%
    \newdimen\unbaseline
    \unbaseline=\dimexpr-\baselinestretch\baselineskip\relax
    \renewcommand\item[1]{%
	\raggedleft{\bodyfont{##1}}\\
    }
    \tabularx{\linewidth}{r}}
    {\endtabularx}

    

    
    
%%
%% End of file `tccv.cls'.
