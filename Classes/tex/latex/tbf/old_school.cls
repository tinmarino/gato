\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{old_school}
              [2017/04/00 v0.0
 Old style curriculum vitae]

\LoadClass[10pt]{scrartcl}




\newenvironment{yearlist}{%
    \renewcommand\item[4][]{
	\noindent \textbf{##1} \hfill 					% Study
	\colorbox{Black}{\color{White}##2} \par			% Duration
	\noindent \textit{##3} \par						% School
	\noindent\hangindent=2em\hangafter=0 \small ##4 	% Description
	\normalsize \par
	}
}


\newenvironment{joblist}{
    \renewcommand\item[4][]{
	\noindent \textbf{##1} \hfill 					% Jobname
	\colorbox{Black}{\color{White}##2} \par			% Duration
	\noindent \textit{##3} \par						% Company
	\noindent\hangindent=2em\hangafter=0 \small ##4 % Description
	\normalsize \par
	}
}


\newenvironment{languagelist}{
	\vspace{-\baselineskip}
	\renewcommand\item[2]{
	\noindent\hangindent=5.5em\hangafter=0
	\parbox\spacebox{#1}
	\hspace{4.5em} #2 \par
	}
}


\newcommand\tbfskill[1]{
	\noindent\spacebox{\textit{#1}}
	\hspace{1em}
}

\newcommand{\PersonalEntry}[2]{
		\noindent\hangindent=1em\hangafter=0 		% Indentation
		\parbox{\spacebox}{						% Box to align text
		   \textit{#1}}								% Entry name (birth, address, etc.)
		 #2 \par
}

% Alias

\newcommand\tbfbirth[1]{
	\PersonalEntry{Né le :}{#1}
}
\newcommand\tbfmail[1]{
	\PersonalEntry{Email :}{#1}
}
\newcommand\tbftel[1]{
	\PersonalEntry{Tel :}{#1}
}
\newcommand\tbfaddr[1]{
	\PersonalEntry{Addr :}{#1}
}
\newcommand\tbfvoidpersonal[1]{
	\PersonalEntry{}{#1}
}

		




