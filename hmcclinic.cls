% \iffalse meta-comment
% 
% clinic.cls -- Harvey Mudd College Clinic Report LaTeX Class File
%
% $Id$
%
% Copyright (C) 2003
%
% Claire Connelly <cmc@math.hmc.edu>
%              and 
% Melissa O'Neill <oneill@cs.hmc.edu>
%
% Written for Harvey Mudd College's
%
%   Department of Computer Science
%   Department of Mathematics
%
% License:
% 
%   This program is free software; you can redistribute it and/or
%   modify it under the terms of the GNU General Public License as
%   published by the Free Software Foundation; either version 2 of the
%   License, or (at your option) any later version.
%
%   This program is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details. 
%
%   You should have received a copy of the GNU General Public License
%   along with this program; if not, write to the Free Software
%   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
%   02111-1307  USA 
%
% \fi
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{newclinic}[2003/04/30 HMC Clinic Report class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax %% <-- Change this if we decide to declare some
                      %%     options for this class!
\LoadClass[11pt,openright]{book}

%%% Get some useful information when errors occur.
\setcounter{errorcontextlines}{25}


%%% Load some required/very useful packages.
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{bbold}
\RequirePackage{xspace}
\RequirePackage{verbatim}
\RequirePackage{booktabs}
\RequirePackage{ifthen}
\RequirePackage{graphics}
\RequirePackage{fancyhdr}


%%% Set the default typeface via a package.
\RequirePackage{palatino}

%%% Define some environments.
\newenvironment{abstract}{\chapter*{Abstract}%
\addcontentsline{toc}{chapter}{Abstract}}{}

\newenvironment{acknowledgments}{\chapter*{Acknowledgments}%
\addcontentsline{toc}{chapter}{Acknowledgments}}{}


%%% Set the headers and footers.

\pagestyle{fancy}{%
  \fancyhf{} %% Clear all headers and footers.
  \fancyhead[LE]{\textbf{\thepage{}}\hspace{1em}\nouppercase\leftmark}
  \fancyhead[RE]{\chaptername\ \thechapter}
  \fancyhead[LO]{Section \thesection}
  \fancyhead[RO]{\nouppercase\rightmark\hspace{1em}\textbf{\thepage}}
  \fancyfoot{}
}

%%% Redefine the \chaptermark and \sectionmark commands.  Note that
%%%  this redefinition must occur after setting pagestyle to fancy.
\renewcommand{\chaptermark}[1]{%
  \markboth{#1}{}}
\renewcommand{\sectionmark}[1]{%
  \markright{#1}{}}

\addtolength{\headwidth}{.5\marginparsep}
\addtolength{\headwidth}{.5\marginparwidth}

\fancypagestyle{plain}{%
  \fancyhf{} %% Clear all headers and footers.
%  \fancyfoot[LE,RO]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{empty}{%
  \fancyhf{} %% Clear all headers and footers.
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{front}{%
  \fancyhf{} %% Clear all headers and footers.
  \fancyhead[LE]{\textbf{\thepage{}}\hspace{1em}\nouppercase\leftmark}
  \fancyhead[RO]{\nouppercase\rightmark\hspace{1em}\textbf{\thepage}}
}



%%% Define the layout of the title page.

\newlength{\ignored@length}
\newcommand{\set@ess}[1]{%
  \renewcommand{\and}{%
    \global\def\@ess{s}%
  }%
  \global\def\@ess{}%
  \settowidth{\ignored@length}{#1}
}

  \renewcommand{\maketitle}{%
    \thispagestyle{empty}
    \begin{titlepage}%
      \let\footnotesize\small
      \let\footnoterule\relax
                                %  \let \footnote \thanks
      \let\thanks\ignoreit
      \parindent0pt
      \null\vfil
      {\large \scalebox{0.55}{\includegraphics{hmclogo-color}} \\[0.5ex]%
                                % Harvey Mudd College\\[0.5ex]%
        \@department\par}%
      \vskip 60\p@
      {\large \@reporttype{} for \\[0.5ex]%
        \emph{\@sponsor}}
      \vskip 60\p@
                                %\begin{center}%
      {\LARGE \noindent\@title \par}%
      \vskip 3em%
      {\large \@date \par}%       % Set date in \large size.
      \vskip 3em%
      {\large
        \lineskip .75em%
        \let\and\par
        \set@ess{\@author}%
        \textbf{Team Member\@ess} \\[0.5ex]
        \begin{tabular}[t]{l}%
          \global\let\and\\%
          \@author
        \end{tabular}%
        \par}%
      \vskip 1.5em%
      {\large
        \lineskip .75em%
        \set@ess{\@advisor}
        \textbf{Advisor\@ess} \\[0.5ex]
      \begin{tabular}[t]{c}%
        \@advisor
      \end{tabular}\par}%
    \vskip 1.5em%
    {\large
      \lineskip .75em%
      \set@ess{\@liaison}
      \textbf{Liaison\@ess} \\[0.5ex]
      \begin{tabular}[t]{c}%
        \@liaison
      \end{tabular}\par}%
    \vskip 1.5em%
                                %\end{center}
                                %\par
    \@thanks
    \vfil\eject
    \cleardoublepage
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

%%% Define some commands for specifying information for the title page
%%%  (and other parts of the document).

\def\department#1{\gdef\@department{#1}}
\def\@department{\@latex@warning@no@line{No \noexpand\department given}}
\def\sponsor#1{\gdef\@sponsor{#1}}
\def\@sponsor{\@latex@warning@no@line{No \noexpand\sponsor given}}
\def\liaison#1{\gdef\@liaison{#1}}
\def\@liaison{\@latex@warning@no@line{No \noexpand\liaison given}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\@advisor{\@latex@warning@no@line{No \noexpand\advisor given}}
\def\consultant#1{\gdef\@consultant{#1}}
\def\@consultant{}
\newcommand{\reporttype}{WOW}
\def\reporttype#1{\gdef\@reporttype{#1}}
\def\@reporttype{\@latex@warning@no@line{No \noexpand\reporttype given}}


%%% Specify some details about the appearance of the table of contents.


\renewcommand{\tableofcontents}{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{%
           \contentsname}{\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }




%%% Print only the chapter and section number in the Table of Contents.

\setcounter{tocdepth}{1}


%%% metafont font.  If logo not available, use the second form
%%%
%%% \font\mffont=logosl10 scaled\magstep1
\let\mffont=\sf

\renewcommand{\frontmatter}{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}
  \pagestyle{front}}

\renewcommand{\mainmatter}{%
    \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}%
\pagestyle{fancy}}



\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname
        \@mkboth{\bibname}{\bibname}
      \addcontentsline{toc}{chapter}{\bibname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\renewcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

\renewenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\indexname}%
                        {\indexname}%
                        \addcontentsline{toc}{chapter}{\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}


%%% Fix \cleardoublepage so it doesn't put headers on pages that are
%%% supposed to be blank.

\renewcommand*{\cleardoublepage}{%
% original definition, see latex.ltx
  \clearpage
  \if@twoside
     \ifodd\c@page
  \else
     \thispagestyle{empty}% added
     \hbox{}\newpage
     \if@twocolumn
        \hbox{}\newpage
     \fi
     \fi
  \fi
}
