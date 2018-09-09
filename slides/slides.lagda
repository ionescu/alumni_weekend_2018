% --*-Latex-*--

\documentclass[colorhighlight,coloremph]{beamer}
\usetheme{boxes}
\usetheme{Madrid} % Lots of space (good), but no section headings
%\usetheme{Hannover}% Sections heading but too much wasted space
%\usetheme{Dresden}
%\usetheme{Warsaw}

\usepackage{natbib}
\usepackage{xcolor,soul}
\usepackage{graphicx}
\usepackage{hyperref} %% for run: links

%include dslmagda.fmt
%include slides.format

%%\input{macros.TeX}

% Changing the way code blocks are presented:
% \renewcommand\hscodestyle{%
%    \setlength\leftskip{-1cm}%
%    \small
% }

\newenvironment{myquote}
  {\begin{exampleblock}{}}
  {\end{exampleblock}}

\addheadbox{section}{\quad \tiny Oxford, 2018-09-01}
\title[Software Models in the Social Sciences]{Soft Concepts vs Hard Facts: software models in the social sciences}

\author[C. Ionescu]
       {Cezar Ionescu \\
        cezar.ionescu@@conted.ox.ac.uk}

\date{15th of September 2018}
\usepackage{tikz}
\usetikzlibrary{shapes.callouts} 

\pgfkeys{%
    /calloutquote/.cd,
    width/.code                   =  {\def\calloutquotewidth{#1}},
    position/.code                =  {\def\calloutquotepos{#1}}, 
    author/.code                  =  {\def\calloutquoteauthor{#1}},
    /calloutquote/.unknown/.code   =
    {\let\searchname=\pgfkeyscurrentname
                                 \pgfkeysalso{\searchname/.try=#1,                                
    /tikz/\searchname/.retry=#1},\pgfkeysalso{\searchname/.try=#1,
                                  /pgf/\searchname/.retry=#1}}
                            }  


\newcommand\calloutquote[2][]{%
       \pgfkeys{/calloutquote/.cd,
         width               = 5cm,
         position            = {(0,-1)},
         author              = {}}
  \pgfqkeys{/calloutquote}{#1}                   
  \node [rectangle callout,callout relative
    pointer={\calloutquotepos},text
    width=\calloutquotewidth,/calloutquote/.cd,
     #1] (tmpcall) at (0,0) {#2};
  \node at (tmpcall.pointer){\calloutquoteauthor};    
}  

\begin{document}
\setbeamertemplate{navigation symbols}{}
\date{}

\def\commentbegin{\quad\{\ }
\def\commentend{\}}

\begin{frame}

\maketitle

%% \begin{exampleblock}{Style example}
%% \begin{spec}
%% Forall (eps elemOf Real) ((eps > 0)  =>  (Exists (a elemOf A) ((abs(a - sup A)) < eps)))
%% \end{spec}
%% \end{exampleblock}

\begin{columns}
  \begin{column}{0.3\textwidth}
\includegraphics[width=.8\linewidth]{ou.eps}  
  \end{column}
  \begin{column}{0.7\textwidth}
    OU Alumni Weekend, 15th September 2018 \\
    \small{\url{https://github.com/ionescu/alumni_weekend_2018}}
  \end{column}
\end{columns}
\vfill
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
  \frametitle{Natural numbers}
  \vfill
>  Nat = {0, 1, 2, 3, ...}
  \vfill
  \begin{quote}
     \emph{God created the natural numbers. Everything else is the work of man.}
  \end{quote}
  \rightline{--- Leopold Kronecker (1823-1891)}
  \vfill

\end{frame}

%% -------------------------------------------------------------------

\end{document}


