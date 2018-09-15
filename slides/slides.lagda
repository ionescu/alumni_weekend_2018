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
\usepackage[font=small,labelfont=bf]{caption}
\usepackage{tikz}
\usetikzlibrary{positioning,decorations.pathreplacing,shapes}
%\usetikzlibrary{graphdrawing,graphdrawing.layered}
%\usetikzlibrary{graphs}
%\usegdlibrary{trees}

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
\includegraphics[width=0.9\linewidth]{ou.eps}  %{oudce.jpg}%
  \end{column}
  \begin{column}{0.7\textwidth}
    OU Alumni Weekend, 15th September 2018 \\
    \hspace{-.4cm}\small{\url{https://github.com/ionescu/alumni_weekend_2018}}
  \end{column}
\end{columns}
\vfill
\end{frame}


%% -------------------------------------------------------------------

\section{Program correctness}

\begin{frame}
\frametitle{Programming languages}
\vfill
\hspace{10cm} Idris, Agda
\vfill
\hspace{8.5cm}ML, Haskell
\vfill
\hspace{7cm}Python, R 
\vfill
\hspace{5.5cm}C++, Java
\vfill
\hspace{4cm}Algol, Pascal, C
\vfill
\hspace{2.5cm}assembly language
\vfill
\hspace{1cm}machine code
\vfill
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
\frametitle{Abstraction}
\vfill
Repeating  patterns in the lower levels were named, abstracted out, and made into building blocks of the higher levels.\pause
\vfill
Patterns of \emph{flow of control}:\pause
\begin{itemize}
\item subroutines with goto
  \vfill
\item procedure calls
  \vfill
\item objects
\end{itemize}
\vfill
Patterns of \emph{data}:\pause
\begin{itemize}
\item arrays
  \vfill
\item lists
  \vfill
\item trees
  \vfill
\item graphs
\end{itemize}
\vfill
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
\frametitle{Example: data structures and traversal}
\vfill
A list:
\vfill
\begin{tikzpicture}
  \def\h{0.5};
  \def\w{1};
  \def\o{1};
  \draw (0, 0) rectangle (\w, \h) node[pos=.5] (a) {A};
  \draw (\w+\o, 0) rectangle (\w+\o+\w, \h) node[pos=.5] (b) {B};
  \draw (\w+\o+\w+\o, 0) rectangle (\w+\o+\w+\o+\w, \h) node[pos=.5] (c) {C};
  \draw (\w+\o+\w+\o+\w+\o, 0) rectangle (\w+\o+\w+\o+\w+\o+\w, \h) node[pos=.5] (d) {D};
  %  \draw (\w+\o+\w+\o+\w+\o+\w+\o, 0) rectangle (\w+\o+\w+\o+\w+\o+\w+\o+\w, \h) node[pos=.5] (e) {E};
  \draw [thick, ->] (a) -- (b) ;
  \draw [thick, ->] (b) -- (c) ;
  \draw [thick, ->] (c) -- (d) ;
  % \draw [thick, ->] (d) -- (e) ;
\end{tikzpicture}
\vfill
A tree:

\begin{tikzpicture}
  \def\r{0.2cm}
  \draw (0, 0) circle (\r) node (a) {};
  \draw (2, 0.4) circle (\r) node (b) {};
  \draw (2, -0.4) circle (\r) node (c) {};
  \draw [thick, ->] (a) -- (b);
  \draw [thick, ->] (a) -- (c);
  \draw (4, 0.8) circle (\r) node (d) {};
  \draw (4, 0.2) circle (\r) node (e) {};
  \draw [thick, ->] (b) -- (d);
  \draw [thick, ->] (b) -- (e);
  \draw (4, -0.8) circle (\r) node (f) {};
  \draw [thick, ->] (c) -- (f);
  \draw (6, 1) circle (\r) node (g) {};
  \draw [thick, ->] (d) -- (g);
  \draw (6, 0.5) circle (\r) node (h) {};
  \draw (6, 0) circle (\r) node (i) {};
  \draw [thick, ->] (e) -- (h);
  \draw [thick, ->] (e) -- (i);
  \draw (6, -0.6) circle (\r) node (j) {};
  \draw (6, -1.1) circle (\r) node (k) {};
  \draw [thick, ->] (f) -- (j);
  \draw [thick, ->] (f) -- (k);
\end{tikzpicture}

A graph:

\begin{tikzpicture}
  \def\r{0.2cm}
  \draw (0, 0) circle (\r) node (a) {};
  \draw (2, 0.6) circle (\r) node (b) {};
  \draw (2, -0.6) circle (\r) node (c) {};
  \draw [thick, ->] (a) -- (b);
  \draw [thick, ->] (a) -- (c);
  \draw (4, 0.6) circle (\r) node (d) {};
  \draw [thick, ->] (b) -- (d);
  \draw [thick, ->] (c) -- (d);
  \draw (4, -0.6) circle (\r) node (f) {};
  \draw [thick, ->] (c) -- (f);
  \draw (6, 0) circle (\r) node (g) {};
  \draw [thick, ->] (d) -- (g);
  \draw [thick, ->] (f) -- (g);
\end{tikzpicture}
\vfill
\end{frame}


%% -------------------------------------------------------------------

\begin{frame}
\frametitle{Frameworks}
\vfill
Patterns of \emph{systems building}:
\vfill
\begin{itemize}
\item standard libraries (C standard library, Java APIs, C++ STL,  \ldots)
  \vfill
\item frameworks (Ruby on Rails, .Net Framework, TensorFlow, \ldots)
  \vfill
\item stacks (LAMP, Elastic Stack, \ldots)
\end{itemize}
\vfill
\end{frame}


%% -------------------------------------------------------------------


\begin{frame}
\frametitle{Law of conservation of errors}
\vfill
We have better programing languages, better tools, better training, better processes.
\vfill
However, the systems we build seem to have (at least) as many bugs as those of the past.
\vfill
\emph{Law of conservation of programming errors}: program complexity
increases faster than our ability to control complexity.
\vfill
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
\frametitle{Ad-hoc abstractions}
\vfill
Systems are built on towers of abstractions; correctness must be ensured at \textbf{each} level.
\vfill
Many abstractions had in the beginning an "ad-hoc" character
\vfill
Example: object-oriented programming.
\vfill
\end{frame}


%% -------------------------------------------------------------------

\begin{frame}
  \frametitle{Program correctness}

  \begin{minipage}{0.35\linewidth}
    \includegraphics[width=\linewidth]{dijkstra.jpg}
    \captionof*{figure}{Edsger Wybe Dijkstra}
    \tiny{Source: \url{https://en.wikipedia.org/wiki/File:Edsger_Wybe_Dijkstra.jpg}}
  \end{minipage}
  \begin{minipage}{0.6\linewidth}

    \emph{\small{Program testing can be used to show the presence of bugs, but never to show their absence!}}
    
    \hfill\small{Dijkstra (1970)}
    
    {\color<1>{white}   \ }

    {\color<1>{white}   \ }

    \emph{\small{Alas, by 1975 Dijkstra [\ldots] was no longer interested in
      programs that were too large to be proven mathematically
      correct. (This pretty much ruled out any program of more than a
      couple of pages).}}
    
    \hfill\small{Per Brinch Hansen (2004)}
  \end{minipage}
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
\frametitle{Mathematics for Computer Science}
\vfill
For safety-critical systems, we do require programs that are mathematically proven correct.
\vfill
This has led to investigating less ``ad-hoc'' and more mathematical abstractions.
\vfill
\emph{Category theory} and \emph{type theory} are the primary source of such abstractions.
They deal with very abstract forms of putting together simple things to make complex things.
\vfill
Example: type generic programming.
\vfill
Programming languages based on these theories make it easier to ensure program correctness.
\vfill
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
  \frametitle{Specifications of ``soft concepts''}
  \vfill
  However, in order to use these we need \emph{formal specifications}.
  \vfill
  We have informal requirements for systems such as loan approval
  assistants (fairness, non-discrimination, \ldots), self-driving cars
  (safety, respectful of other drivers, \ldots), autonomous weapons
  (ethical behaviour), and so on.
  \vfill
  It is not obvious that such requirements can be formalised.
  \vfill
\end{frame}

%% -------------------------------------------------------------------

\section{Vulnerability}

\begin{frame}
\frametitle{The Potsdam Institute for Climate Impact Research}
\vfill
\includegraphics[width=1.0\linewidth]{pik.jpg}  
\vfill
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
\frametitle{The Potsdam Institute for Climate Impact Research}
\vfill
\begin{tabular}{p{0.9\textwidth}}
PIK addresses crucial scientific questions in the fields of global
change, climate impacts and sustainable development.
\end{tabular}
\vfill
\begin{tabular}{p{0.9\textwidth}}
Researchers from the natural and social sciences work together to
generate {\color<1>{red}interdisciplinary insights} and to provide society with {\color<1>{red}sound
information for decision making}.
\end{tabular}
\vfill
\begin{tabular}{p{0.9\textwidth}}
The main methodologies are systems and scenarios analysis, modelling,
{\color<1>{red}computer simulation}, and data integration.
\end{tabular}
\vfill
\hfill PIK Mission, www.pik-potsdam.de, retrieved 2018-09-15
\vfill
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
\frametitle{The Potsdam Institute for Climate Impact Research}

\begin{figure}[h]
  \includegraphics[scale=0.4]{schellnhuber.pdf}
\end{figure}
\begin{tabular}{p{0.9\textwidth}}
``Die Rolle der Klimaforschung bleibt weiterhin, die Problemfakten auf
den Tisch zu knallen und Optionen f\"ur geeignete L\"osungswege zu
identifizieren.'' \\
\end{tabular}

\hfill H.-J. Schellnhuber in \emph{Frankfurter Allgemeine} from 2012-06-19 \\

\end{frame}


%% -------------------------------------------------------------------

\begin{frame}
\frametitle{The Potsdam Institute for Climate Impact Research}

\begin{figure}[h]
  \includegraphics[scale=0.4]{schellnhuber.pdf}
\end{figure}
\begin{tabular}{p{0.9\textwidth}}
``The role of the climate researcher continues to be to slam
the hard facts on the table and to indicate the possible solutions to
the problems''.\\ 
\end{tabular}

\hfill H.-J. Schellnhuber in \emph{Frankfurter Allgemeine} from 2012-06-19 \\

\end{frame}


%% -------------------------------------------------------------------

\begin{frame}
\frametitle{Interdisciplinary research}
\vfill
Different concerns: scientific, economic, political,
    ethical \ldots
\vfill
Different methodologies: empirical, simulations,
    Gedankenexperimente, stakeholder dialogues, participatory games
    \ldots
\vfill
Different specialized languages
\vfill
Common ground:  English,  Mathematics, popular culture (e.g., ``Lord of the Rings'').
\vfill
\textbf{Focal concepts}: can be intuitively understood by all and structure discourse.  Example: vulnerability.
\vfill
\end{frame}


%% -------------------------------------------------------------------


\begin{frame}
\frametitle{Vulnerability}
\vfill
\ldots The {\color<1>{red}complexity} of the climate, ecological, social and
economic systems that researchers are modelling means that the {\color<1>{red}validity}
of scenario results will inevitably be {\color<1>{red}subject to ongoing criticism.}

\vfill

\ldots What this criticism does, however, is emphasize the {\color<1>{red}need for
a strong foundation} upon which scenarios (\emph{i.e., modelling})
can be applied, a foundation that provides a basis for managing risk
despite uncertainties associated with future climate changes.

\vfill

{\color<1>{red}This foundation lies in the concept of vulnerability.}

\vfill

\hfill (from ``Climate Change Impacts and Adaptation'', 2004)

\vfill
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
\frametitle{Definitions of \emph{vulnerability}}

\vfill

``\ldots a human condition or process resulting from physical,
  social and environmental factors which determine the likelihood and
  damage from the impact of a given hazard'' (UNDP Annual Report,
  2004)

\vfill

``Vulnerability [\ldots] is a way of conceptualizing what may
  happen to an identifiable population under conditions of particular
  risk and hazards.'' (Cannon et al. 2004)

\vfill

``\ldots the degree to which a system is susceptible to and
  unable to cope with, adverse effects of climate change, including
  climate variability and extremes. '' (The Intergovernmental Panel on
  Climate Change, 2007)

  \vfill
  
  \ldots many, many others (e.g., Thywissen 2006 lists 32 more!)
  
  \vfill

\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
\frametitle{The OED definition}
\vfill
\emph{vulnerable} (adj.):
\vfill
\begin{enumerate}

    \item

    exposed to the possibility of being attacked or harmed,
    either physically or emotionally: \emph{we were in
    a vulnerable position} | || | \emph{small fish are
    vulnerable to predators}

    \vfill
    \item

    Bridge (of a partnership) liable to higher penalties,
    either by convention or through having won one game towards
    a rubber.

\end{enumerate}
\vfill
(Oxford English Dictionary, 2005)

\vfill
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
\frametitle{The practice of vulnerability assessment}
\vfill
\begin{enumerate}
\vfill
  \item run model a number of times under various scenarios
\vfill
  \item collect ``indicators'' of ``badness'' along the different
        trajectories (e.g.  GDP loss, average
        temperature increase, lost lives \ldots)
\vfill
  \item aggregate the collected data (in most cases by some sort of
        weighted average) into a vulnerability measure

\end{enumerate}
\vfill
\end{frame}


%% -------------------------------------------------------------------

\begin{frame}[fragile]
\frametitle{Example: scenarios}
\begin{tikzpicture}[%
    block/.style = {draw, fill=blue!30, align=center, anchor=west,
      minimum height=0.65cm, inner sep=0},
    % common options for the circles:
    ball/.style = {circle, draw, align=center, anchor=north, inner sep=0}]

  % initial situation
  \def\ix{6};
  \def\ih{2.4};
  
  \node[ball,text width=2.5cm] (initial) at (\ix,\ih) {}; % 4.75 to 7.25  2.4 to  -0.1
  % big fish
  \node[ball,text width=0.3cm, fill=blue] at (\ix-1,\ih-0.9) {};
  \node[ball,text width=0.3cm, fill=blue] at (\ix-0.1,\ih-0.4) {};
  \node[ball,text width=0.3cm, fill=blue] at (\ix+0.4,\ih-1.1) {};
  \node[ball,text width=0.3cm, fill=blue] at (\ix-0.4,\ih-1.6) {};
  % small fish
  \node[ball,text width=0.1cm, fill=red] at (\ix,2.3) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix-0.2,1.2) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+0.3,1.7) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix-0.6,1.4) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+1,1.1) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+0.6,0.8) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+0.1,0.5) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix-0.1,0.1) {};
  
  \pause
  % intermediate situation with predator
  \node[ball,text width=2.5cm] (predator) at (10,3.75) {};
  % offsets
  \def\hoff{4};
  \def\voff{1.35};
  \def\pheight{0.7}           
  \def\pwidth{1.2}
  % predator                   
  \fill[brown] (5.5+\hoff,2.15 + \voff) rectangle (5.5+\hoff+\pwidth,2.15+\voff-\pheight);
  % big fish
  \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.3+\hoff,2+\voff) {}; % moved because of predator
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8+\voff) {};
  % small fish
  % \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3+\voff) {}; % died of fright
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,1.2+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (5.4+\hoff,1.4+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (7+\hoff,1.1+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,0.5+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1+\voff) {};

  % intermediate situation without predator
  \node[ball,text width=2.5cm] (clean) at (10,1.05) {};
  % big fish
  \def\hoff{4};
  \def\voff{1.35};
  \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.9+\hoff,2-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8-\voff) {};
  % small fish
  \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,1.2-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.4+\hoff,1.4-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (7+\hoff,1.1-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,0.5-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1-\voff) {};


  \draw[red, ->, thick] (initial) -- (predator);
  \draw[red, ->, thick] (initial) -- (clean);

  \pause
  % end state with predator, bleak
  \node[ball,text width=2.5cm] (bleak) at (14,5) {};
  % offsets
  \def\hoff{8}; % |4 + 4| over intermediate state
  \def\voff{2.6}; % 2.4 initial 3.75 intermediat, 5 bleak
  % predator
  \fill[brown] (5.5+\hoff,2.15 + \voff) rectangle (5.5+\hoff+\pwidth,2.15+\voff-\pheight);
  % big fish  
  % \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5+\voff) {}; % died of natural causes
  \node[ball,text width=0.3cm, fill=blue] at (5.3+\hoff,2+\voff) {}; % moved because of predator
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8+\voff) {};
  % small fish
  % \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3+\voff) {}; % died of fright
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,2+\voff) {}; % gobbled up
  % \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7+\voff) {}; % gobbled up already
  \node[ball,text width=0.1cm, fill=red] at (5.6+\hoff,1.6+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (6.4+\hoff,2.1+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (6+\hoff,1.9+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,1.6+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1+\voff) {};

  \draw[red, ->, thick] (predator) -- (bleak);
  
  % end state with predator, bad
  \node[ball,text width=2.5cm] (bad) at (14,2.4) {};
  % offsets
  % hoff same as before
  \def\voff{0}
  % predator
  \fill[brown] (5.5+\hoff,2.15 + \voff) rectangle (5.5+\hoff+\pwidth,2.15+\voff-\pheight);
  % big fish  
  \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.3+\hoff,2+\voff) {}; % moved because of predator
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8+\voff) {};
  % small fish
  % \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3+\voff) {}; % died of fright
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,2+\voff) {}; % gobbled up
  % \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7+\voff) {}; % gobbled up already
  \node[ball,text width=0.1cm, fill=red] at (5.6+\hoff,1.6+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (7+\hoff,1.1+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,0.5+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1+\voff) {};

  \draw[red, ->, thick] (predator) -- (bad);
  
  % end state with no predator, rosy
  \node[ball,text width=2.5cm] (rosy) at (14,-0.2) {};
  % offsets    6 -> 14, 2.4 -> -0.2
  % \def\hoff{8}; % same as before
  \def\voff{2.6};
  % big fish
  \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.9+\hoff,2-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8-\voff) {};
  % small fish
  \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,1.2-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.4+\hoff,1.4-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (7+\hoff,1.1-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,0.5-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1-\voff) {};

  \draw[red, ->, thick] (clean) -- (rosy);

  \pause
  % harm value for bleak
  \node at (15.5, 3.75) {|6|};
  
  % harm value for bad
  \node at (15.5, 1.15) {|3|};

  % harm value for rosy
  \node at (15.5, -1.45) {|0|};

  \pause
  % curly brace for aggregating the harm values
  \draw [decorate,decoration={brace,amplitude=10pt,raise=4pt},yshift=0pt]
  (15.9,4) -- (15.9,-1.7) node [black,midway,xshift=0.8cm] {};

  \pause
  % vulnerability value (average)
  \node at (16.8, 1.15) {|3?|};

  \pause
  % vulnerability value (max)
  \fill[white] (16.5, 1.3) rectangle (17.1, 0.7);
  \pause
  \node at (16.8, 1.15) {|6?|};

  \pause
  % vulnerability value (min)
  \fill[white] (16.5, 1.3) rectangle (17.1, 0.7);
  \pause
  \node at (16.8, 1.15) {|0?|};

\end{tikzpicture}


\end{frame}

%% -------------------------------------------------------------------

\begin{frame}[fragile]
  \frametitle{Example: stochastic system}

\begin{tikzpicture}[%
    block/.style = {draw, fill=blue!30, align=center, anchor=west,
      minimum height=0.65cm, inner sep=0},
    % common options for the circles:
    ball/.style = {circle, draw, align=center, anchor=north, inner sep=0}]

  % initial situation
  \def\ix{6};
  \def\ih{2.4};
  
  \node[ball,text width=2.5cm] (initial) at (\ix,\ih) {}; % 4.75 to 7.25  2.4 to  -0.1
  % big fish
  \node[ball,text width=0.3cm, fill=blue] at (\ix-1,\ih-0.9) {};
  \node[ball,text width=0.3cm, fill=blue] at (\ix-0.1,\ih-0.4) {};
  \node[ball,text width=0.3cm, fill=blue] at (\ix+0.4,\ih-1.1) {};
  \node[ball,text width=0.3cm, fill=blue] at (\ix-0.4,\ih-1.6) {};
  % small fish
  \node[ball,text width=0.1cm, fill=red] at (\ix,2.3) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix-0.2,1.2) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+0.3,1.7) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix-0.6,1.4) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+1,1.1) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+0.6,0.8) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+0.1,0.5) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix-0.1,0.1) {};
  
  \pause
  % intermediate situation with predator
  \node[ball,text width=2.5cm] (predator) at (10,3.75) {};
  % offsets
  \def\hoff{4};
  \def\voff{1.35};
  \def\pheight{0.7}           
  \def\pwidth{1.2}
  % predator                   
  \fill[brown] (5.5+\hoff,2.15 + \voff) rectangle (5.5+\hoff+\pwidth,2.15+\voff-\pheight);
  % big fish
  \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.3+\hoff,2+\voff) {}; % moved because of predator
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8+\voff) {};
  % small fish
  % \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3+\voff) {}; % died of fright
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,1.2+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (5.4+\hoff,1.4+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (7+\hoff,1.1+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,0.5+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1+\voff) {};

  % intermediate situation without predator
  \node[ball,text width=2.5cm] (clean) at (10,1.05) {};
  % big fish
  \def\hoff{4};
  \def\voff{1.35};
  \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.9+\hoff,2-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8-\voff) {};
  % small fish
  \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,1.2-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.4+\hoff,1.4-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (7+\hoff,1.1-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,0.5-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1-\voff) {};


  \draw[red, ->, thick] (initial) -- (predator) node[midway, black, above] {|0.8|};
  \draw[red, ->, thick] (initial) -- (clean) node[midway, black, above] {|0.2|};

  \pause
  % end state with predator, bleak
  \node[ball,text width=2.5cm] (bleak) at (14,5) {};
  % offsets
  \def\hoff{8}; % |4 + 4| over intermediate state
  \def\voff{2.6}; % 2.4 initial 3.75 intermediat, 5 bleak
  % predator
  \fill[brown] (5.5+\hoff,2.15 + \voff) rectangle (5.5+\hoff+\pwidth,2.15+\voff-\pheight);
  % big fish  
  % \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5+\voff) {}; % died of natural causes
  \node[ball,text width=0.3cm, fill=blue] at (5.3+\hoff,2+\voff) {}; % moved because of predator
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8+\voff) {};
  % small fish
  % \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3+\voff) {}; % died of fright
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,2+\voff) {}; % gobbled up
  % \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7+\voff) {}; % gobbled up already
  \node[ball,text width=0.1cm, fill=red] at (5.6+\hoff,1.6+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (6.4+\hoff,2.1+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (6+\hoff,1.9+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,1.6+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1+\voff) {};

  \draw[red, ->, thick] (predator) -- (bleak) node[midway, black, above] {|0.6|};
  
  % end state with predator, bad
  \node[ball,text width=2.5cm] (bad) at (14,2.4) {};
  % offsets
  % hoff same as before
  \def\voff{0}
  % predator
  \fill[brown] (5.5+\hoff,2.15 + \voff) rectangle (5.5+\hoff+\pwidth,2.15+\voff-\pheight);
  % big fish  
  \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.3+\hoff,2+\voff) {}; % moved because of predator
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8+\voff) {};
  % small fish
  % \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3+\voff) {}; % died of fright
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,2+\voff) {}; % gobbled up
  % \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7+\voff) {}; % gobbled up already
  \node[ball,text width=0.1cm, fill=red] at (5.6+\hoff,1.6+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (7+\hoff,1.1+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,0.5+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1+\voff) {};

  \draw[red, ->, thick] (predator) -- (bad) node[midway, black, above] {|0.4|};
  
  % end state with no predator, rosy
  \node[ball,text width=2.5cm] (rosy) at (14,-0.2) {};
  % offsets    6 -> 14, 2.4 -> -0.2
  % \def\hoff{8}; % same as before
  \def\voff{2.6};
  % big fish
  \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.9+\hoff,2-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8-\voff) {};
  % small fish
  \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,1.2-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.4+\hoff,1.4-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (7+\hoff,1.1-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,0.5-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1-\voff) {};

  \draw[red, ->, thick] (clean) -- (rosy) node[midway, black, above] {|1.0|};

  \pause
  % harm value for bleak
  \node at (15.5, 3.75) {|6|};
  % probability for bleak
  \node at (15.5, 3.4) {|.48|};
  
  % harm value for bad
  \node at (15.5, 1.15) {|3|};
  % probability for bad
  \node at (15.5, 0.8) {|.32|};

  % harm value for rosy
  \node at (15.5, -1.45) {|0|};
  % probability for rosy
  \node at (15.5, -1.8) {|.2|};


  \pause
  % curly brace for aggregating the harm values
  \draw [decorate,decoration={brace,amplitude=10pt,raise=4pt},yshift=0pt]
  (15.7,4) -- (15.7,-1.7) node [black,midway,xshift=0.8cm] {};

  \pause
  % vulnerability value (expected value)
  \node at (16.6, 1.15) {{\small \emph{3.84?}}};

  \pause
  % vulnerability value (max, most probable)
  \fill[white] (16.2, 1.3) rectangle (17.1, 0.8);
  \pause
  \node at (16.6, 1.15) {{\small \emph{6?}}};

  \pause
  % vulnerability value (min)
  \fill[white] (16.2, 1.3) rectangle (17.1, 0.8);
  \pause
  \node at (16.6, 1.15) {{\small \emph{0?}}};

\end{tikzpicture}


\end{frame}

%% -------------------------------------------------------------------

\begin{frame}[fragile]
\frametitle{Example: deterministic system}
\begin{tikzpicture}[%
    block/.style = {draw, fill=blue!30, align=center, anchor=west,
      minimum height=0.65cm, inner sep=0},
    % common options for the circles:
    ball/.style = {circle, draw, align=center, anchor=north, inner sep=0}]

  % initial situation
  \def\ix{6};
  \def\ih{2.4};
  
  \node[ball,text width=2.5cm] (initial) at (\ix,\ih) {}; % 4.75 to 7.25  2.4 to  -0.1
  % big fish
  \node[ball,text width=0.3cm, fill=blue] at (\ix-1,\ih-0.9) {};
  \node[ball,text width=0.3cm, fill=blue] at (\ix-0.1,\ih-0.4) {};
  \node[ball,text width=0.3cm, fill=blue] at (\ix+0.4,\ih-1.1) {};
  \node[ball,text width=0.3cm, fill=blue] at (\ix-0.4,\ih-1.6) {};
  % small fish
  \node[ball,text width=0.1cm, fill=red] at (\ix,2.3) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix-0.2,1.2) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+0.3,1.7) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix-0.6,1.4) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+1,1.1) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+0.6,0.8) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+0.1,0.5) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix-0.1,0.1) {};
  
  \pause
  % intermediate situation with predator
  \node[ball,text width=2.5cm] (predator) at (10,\ih) {};
  % offsets
  \def\hoff{4};
  \def\voff{0};
  \def\pheight{0.7}           
  \def\pwidth{1.2}
  % predator                   
  \fill[brown] (5.5+\hoff,2.15 + \voff) rectangle (5.5+\hoff+\pwidth,2.15+\voff-\pheight);
  % big fish
  \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.3+\hoff,2+\voff) {}; % moved because of predator
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8+\voff) {};
  % small fish
  % \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3+\voff) {}; % died of fright
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,1.2+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (5.4+\hoff,1.4+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (7+\hoff,1.1+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,0.5+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1+\voff) {};

  \draw[red, ->, thick] (initial) -- (predator);

  \pause
  
  % end state with predator, bad
  \node[ball,text width=2.5cm] (bad) at (14,2.4) {};
  % offsets
  \def\hoff{8}
  \def\voff{0}
  % predator
  \fill[brown] (5.5+\hoff,2.15 + \voff) rectangle (5.5+\hoff+\pwidth,2.15+\voff-\pheight);
  % big fish  
  % \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5+\voff) {}; % old age
  \node[ball,text width=0.3cm, fill=blue] at (5.3+\hoff,2+\voff) {}; % moved because of predator
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8+\voff) {};
  % small fish
  % \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3+\voff) {}; % died of fright
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,2+\voff) {}; % gobbled up
  % \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7+\voff) {}; % gobbled up already
  \node[ball,text width=0.1cm, fill=red] at (5.6+\hoff,1.6+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (7+\hoff,1.1+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,0.5+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1+\voff) {};

  \draw[red, ->, thick] (predator) -- (bad);
  
  \pause
  % harm value for bad
  \node at (15.5, 1.15) {|3|};

  \pause
  % curly brace for aggregating the harm values
  \draw [decorate,decoration={brace,amplitude=10pt,raise=4pt},yshift=0pt]
  (15.7,2.1) -- (15.7,0.1) node [black,midway,xshift=0.8cm] {};

  % vulnerability value (average)
  \node at (16.8, 1.15) {|3?|};

\end{tikzpicture}


\end{frame}

%-------------------------------------------------------------------

\begin{frame}
  \frametitle{Formalisation}

> States : Set

E.g.: |States = {(nsmall, nbig, npred); nsmall, nbig, npred `elem` Nat}|
\pause
> Trajectory : List States

E.g., | trj = [(ns0, nb0, np0), (ns1, nb1, np1), ...] |

\pause
> scenarios : State -> List Trajectory

E.g., |scenarios (ns0, nb0, np0) = [trj0, trj1, trj2]|
\pause
> stochastic : State -> Prob Trajectory

E.g., |stochastic (ns0, nb0, np0) = [(trj0, p0), (trj1, p1), (trj2, p2)]|
\pause
> deterministic : State -> Trajectory

E.g., |deterministic (ns0, nb0, np0) = trj|
    
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
  \frametitle{Formalisation}

> States : Set

E.g.: |States = {(nsmall, nbig, npred); nsmall, nbig, npred `elem` Nat}|

> Trajectory : List States

E.g., | trj = [(ns0, nb0, np0), (ns1, nb1, np1), ...] |

\color<1>{red}{ }

> scenarios : State -> List Trajectory

\color<1>{black}{}E.g., |scenarios (ns0, nb0, np0) = [trj0, trj1, trj2]|

\color<1>{red}{ }
> stochastic : State -> Prob Trajectory

\color<1>{black}{}E.g., |stochastic (ns0, nb0, np0) = [(trj0, p0), (trj1, p1), (trj2, p2)]|

\color<1>{red}{ }
> deterministic : State -> Trajectory

\color<1>{black}{}E.g., |deterministic (ns0, nb0, np0) = trj|
    
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
  \frametitle{Formalisation}

> States : Set

E.g.: |States = {(nsmall, nbig, npred); nsmall, nbig, npred `elem` Nat}|

> Trajectory : List States

E.g., | trj = [(ns0, nb0, np0), (ns1, nb1, np1), ...] |

\color<1>{white}{ }

> scenarios : State -> List Trajectory

\color<1>{white}{}E.g., |scenarios (ns0, nb0, np0) = [trj0, trj1, trj2]|

\color<1>{red}{ }
> possible : State -> F Trajectory

\color<1>{white}{}E.g., |stochastic (ns0, nb0, np0) = [(trj0, p0), (trj1, p1), (trj2, p2)]|

\color<1>{white}{ }
> deterministic : State -> Trajectory

\color<1>{white}{}E.g., |deterministic (ns0, nb0, np0) = trj|
    
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
  \frametitle{Formalisation}

> harm : Trajectory -> V

\pause
E.g., for scenarios:

>  [harm trj0, harm trj1, harm trj2]

\pause
E.g., for stochastic:

> [harm (trj0, p0), harm (trj1, p1), harm (trj2, p2)]

\pause
E.g., for deterministic:

> harm trj
    
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
  \frametitle{Formalisation}

\vfill
> possible : State -> F Trajectory
\vfill
> harm : Trajectory -> V

\pause
\vfill
|F| \textbf{functor}, i.e., we can \emph{map} |harm| inside the structure:
\vfill
> fmap harm . possible : State -> F V
\vfill    
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
  \frametitle{Formalisation}

> possible : State -> F Trajectory

> harm : Trajectory -> V

> fmap harm . possible : State -> F V

\pause
We need to ``measure'' the resulting structure of harm values

> measure : F V -> W

> measure . fmap harm . possible
    
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
  \frametitle{Formalisation}

> possible : State -> F Trajectory

> harm : Trajectory -> V

> fmap harm . possible : State -> F V

> measure : F V -> W

> redvuln = measure . fmap harm . possible
    
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
  \frametitle{Formalisation}
\vfill
> vulnerability = measure . fmap harm . possible
\vfill
How is this useful?
\vfill
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
  \frametitle{Formalisation}
\vfill
> vulnerability = measure . fmap harm . possible
\vfill
How is this useful?
\vfill
All definitions in, e.g., Thywissen 2006, are special cases.
\vfill
Therefore, we have a principled way of comparing them.
\vfill
If we can find agreed upon conditions to impose on the components, we have a way of checking them.
\vfill
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
  \frametitle{Formalisation}
\vfill
> vulnerability = measure . fmap harm . possible
\vfill
An agreed upon condition on |measure|: if in all trajectories the harm increases, the vulnerability must not decrease.
\vfill
\end{frame}

%% %% -------------------------------------------------------------------

\begin{frame}[fragile]
  \frametitle{Example: monotonicity condition}

\begin{tikzpicture}[%
    block/.style = {draw, fill=blue!30, align=center, anchor=west,
      minimum height=0.65cm, inner sep=0},
    % common options for the circles:
    ball/.style = {circle, draw, align=center, anchor=north, inner sep=0}]

  % initial situation
  \def\ix{6};
  \def\ih{2.4};
  
  \node[ball,text width=2.5cm] (initial) at (\ix,\ih) {}; % 4.75 to 7.25  2.4 to  -0.1
  % big fish
  \node[ball,text width=0.3cm, fill=blue] at (\ix-1,\ih-0.9) {};
  \node[ball,text width=0.3cm, fill=blue] at (\ix-0.1,\ih-0.4) {};
  \node[ball,text width=0.3cm, fill=blue] at (\ix+0.4,\ih-1.1) {};
  \node[ball,text width=0.3cm, fill=blue] at (\ix-0.4,\ih-1.6) {};
  % small fish
  \node[ball,text width=0.1cm, fill=red] at (\ix,2.3) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix-0.2,1.2) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+0.3,1.7) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix-0.6,1.4) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+1,1.1) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+0.6,0.8) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+0.1,0.5) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix-0.1,0.1) {};
  
  % intermediate situation with predator
  \node[ball,text width=2.5cm] (predator) at (10,3.75) {};
  % offsets
  \def\hoff{4};
  \def\voff{1.35};
  \def\pheight{0.7}           
  \def\pwidth{1.2}
  % predator                   
  \fill[brown] (5.5+\hoff,2.15 + \voff) rectangle (5.5+\hoff+\pwidth,2.15+\voff-\pheight);
  % big fish
  \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.3+\hoff,2+\voff) {}; % moved because of predator
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8+\voff) {};
  % small fish
  % \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3+\voff) {}; % died of fright
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,1.2+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (5.4+\hoff,1.4+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (7+\hoff,1.1+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,0.5+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1+\voff) {};

  % intermediate situation without predator
  \node[ball,text width=2.5cm] (clean) at (10,1.05) {};
  % big fish
  \def\hoff{4};
  \def\voff{1.35};
  \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.9+\hoff,2-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8-\voff) {};
  % small fish
  \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,1.2-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.4+\hoff,1.4-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (7+\hoff,1.1-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,0.5-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1-\voff) {};


  \draw[red, ->, thick] (initial) -- (predator) node[midway, black, above] {|0.8|};
  \draw[red, ->, thick] (initial) -- (clean) node[midway, black, above] {|0.2|};

  % end state with predator, bleak
  \node[ball,text width=2.5cm] (bleak) at (14,5) {};
  % offsets
  \def\hoff{8}; % |4 + 4| over intermediate state
  \def\voff{2.6}; % 2.4 initial 3.75 intermediat, 5 bleak
  % predator
  \fill[brown] (5.5+\hoff,2.15 + \voff) rectangle (5.5+\hoff+\pwidth,2.15+\voff-\pheight);
  % big fish  
  % \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5+\voff) {}; % died of natural causes
  \node[ball,text width=0.3cm, fill=blue] at (5.3+\hoff,2+\voff) {}; % moved because of predator
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8+\voff) {};
  % small fish
  % \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3+\voff) {}; % died of fright
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,2+\voff) {}; % gobbled up
  % \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7+\voff) {}; % gobbled up already
  \node[ball,text width=0.1cm, fill=red] at (5.6+\hoff,1.6+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (6.4+\hoff,2.1+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (6+\hoff,1.9+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,1.6+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1+\voff) {};

  \draw[red, ->, thick] (predator) -- (bleak) node[midway, black, above] {|0.6|};
  
  % end state with predator, bad
  \node[ball,text width=2.5cm] (bad) at (14,2.4) {};
  % offsets
  % hoff same as before
  \def\voff{0}
  % predator
  \fill[brown] (5.5+\hoff,2.15 + \voff) rectangle (5.5+\hoff+\pwidth,2.15+\voff-\pheight);
  % big fish  
  \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.3+\hoff,2+\voff) {}; % moved because of predator
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8+\voff) {};
  % small fish
  % \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3+\voff) {}; % died of fright
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,2+\voff) {}; % gobbled up
  % \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7+\voff) {}; % gobbled up already
  \node[ball,text width=0.1cm, fill=red] at (5.6+\hoff,1.6+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (7+\hoff,1.1+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,0.5+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1+\voff) {};

  \draw[red, ->, thick] (predator) -- (bad) node[midway, black, above] {|0.4|};
  
  % end state with no predator, rosy
  \node[ball,text width=2.5cm] (rosy) at (14,-0.2) {};
  % offsets    6 -> 14, 2.4 -> -0.2
  % \def\hoff{8}; % same as before
  \def\voff{2.6};
  % big fish
  \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.9+\hoff,2-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8-\voff) {};
  % small fish
  \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,1.2-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.4+\hoff,1.4-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (7+\hoff,1.1-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,0.5-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1-\voff) {};

  \draw[red, ->, thick] (clean) -- (rosy) node[midway, black, above] {|1.0|};

  % harm value for bleak
  \node at (15.5, 3.75) {|6|};
  % probability for bleak
  \node at (15.5, 3.4) {|.48|};
  
  % harm value for bad
  \node at (15.5, 1.15) {|3|};
  % probability for bad
  \node at (15.5, 0.8) {|.32|};

  % harm value for rosy
  \node at (15.5, -1.45) {|0|};
  % probability for rosy
  \node at (15.5, -1.8) {|.2|};


  % curly brace for aggregating the harm values
  \draw [decorate,decoration={brace,amplitude=10pt,raise=4pt},yshift=0pt]
  (15.7,4) -- (15.7,-1.7) node [black,midway,xshift=0.8cm] {};

  % vulnerability value (max, most probable)
  \node at (16.6, 1.15) {{\small \emph{6}}};

\end{tikzpicture}


\end{frame}

%% %% -------------------------------------------------------------------

\begin{frame}[fragile]
  \frametitle{Example: monotonicity condition}

\begin{tikzpicture}[%
    block/.style = {draw, fill=blue!30, align=center, anchor=west,
      minimum height=0.65cm, inner sep=0},
    % common options for the circles:
    ball/.style = {circle, draw, align=center, anchor=north, inner sep=0}]

  % initial situation
  \def\ix{6};
  \def\ih{2.4};
  
  \node[ball,text width=2.5cm] (initial) at (\ix,\ih) {}; % 4.75 to 7.25  2.4 to  -0.1
  % big fish
  \node[ball,text width=0.3cm, fill=blue] at (\ix-1,\ih-0.9) {};
  \node[ball,text width=0.3cm, fill=blue] at (\ix-0.1,\ih-0.4) {};
  \node[ball,text width=0.3cm, fill=blue] at (\ix+0.4,\ih-1.1) {};
  \node[ball,text width=0.3cm, fill=blue] at (\ix-0.4,\ih-1.6) {};
  % small fish
  \node[ball,text width=0.1cm, fill=red] at (\ix,2.3) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix-0.2,1.2) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+0.3,1.7) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix-0.6,1.4) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+1,1.1) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+0.6,0.8) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix+0.1,0.5) {};
  \node[ball,text width=0.1cm, fill=red] at (\ix-0.1,0.1) {};
  
  % intermediate situation with predator
  \node[ball,text width=2.5cm] (predator) at (10,3.75) {};
  % offsets
  \def\hoff{4};
  \def\voff{1.35};
  \def\pheight{0.7}           
  \def\pwidth{1.2}
  % predator                   
  \fill[brown] (5.5+\hoff,2.15 + \voff) rectangle (5.5+\hoff+\pwidth,2.15+\voff-\pheight);
  % big fish
  \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.3+\hoff,2+\voff) {}; % moved because of predator
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8+\voff) {};
  % small fish
  % \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3+\voff) {}; % died of fright
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,1.2+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (5.4+\hoff,1.4+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (7+\hoff,1.1+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,0.5+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1+\voff) {};

  % intermediate situation also with predator
  \node[ball,text width=2.5cm] (clean) at (10,1.05) {};
  % offsets
  \def\hoff{4};
  \def\voff{1.35};
  \def\pheight{0.7}           
  \def\pwidth{1.2}
  % predator                   
  \fill[brown] (5.5+\hoff,2.15 -\voff) rectangle (5.5+\hoff+\pwidth,2.15-\voff-\pheight);
  % big fish
  \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.3+\hoff,2-\voff) {}; % moved because of predator
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8-\voff) {};
  % small fish
  % \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3-\voff) {}; % died of fright
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,1.2-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7-\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (5.4+\hoff,1.4-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (7+\hoff,1.1-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,0.5-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1-\voff) {};


  \draw[red, ->, thick] (initial) -- (predator) node[midway, black, above] {|0.8|};
  \draw[red, ->, thick] (initial) -- (clean) node[midway, black, above] {|0.2|};

  % end state with predator, bleak
  \node[ball,text width=2.5cm] (bleak) at (14,5) {};
  % offsets
  \def\hoff{8}; % |4 + 4| over intermediate state
  \def\voff{2.6}; % 2.4 initial 3.75 intermediat, 5 bleak
  % predator
  \fill[brown] (5.5+\hoff,2.15 + \voff) rectangle (5.5+\hoff+\pwidth,2.15+\voff-\pheight);
  % big fish  
  % \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5+\voff) {}; % died of natural causes
  \node[ball,text width=0.3cm, fill=blue] at (5.3+\hoff,2+\voff) {}; % moved because of predator
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8+\voff) {};
  % small fish
  % \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3+\voff) {}; % died of fright
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,2+\voff) {}; % gobbled up
  % \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7+\voff) {}; % gobbled up already
  \node[ball,text width=0.1cm, fill=red] at (5.6+\hoff,1.6+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (6.4+\hoff,2.1+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (6+\hoff,1.9+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,1.6+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,1.6+\voff) {}; % gobbled up

  \draw[red, ->, thick] (predator) -- (bleak) node[midway, black, above] {|0.6|};
  
  % end state with predator, bad
  \node[ball,text width=2.5cm] (bad) at (14,2.4) {};
  % offsets
  % hoff same as before
  \def\voff{0}
  % predator
  \fill[brown] (5.5+\hoff,2.15 + \voff) rectangle (5.5+\hoff+\pwidth,2.15+\voff-\pheight);
  % big fish  
  \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.3+\hoff,2+\voff) {}; % moved because of predator
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3+\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8+\voff) {};
  % small fish
  % \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3+\voff) {}; % died of fright
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,2+\voff) {}; % gobbled up
  % \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7+\voff) {}; % gobbled up already
  \node[ball,text width=0.1cm, fill=red] at (5.6+\hoff,1.6+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (7+\hoff,1.1+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8+\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,1.6+\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1+\voff) {};

  \draw[red, ->, thick] (predator) -- (bad) node[midway, black, above] {|0.4|};
  
  % end state with no predator, rosy
  \node[ball,text width=2.5cm] (rosy) at (14,-0.2) {};
  % offsets    6 -> 14, 2.4 -> -0.2
  % \def\hoff{8}; % same as before
  \def\voff{2.6};
  % predator
  \fill[brown] (5.5+\hoff,2.15 -\voff) rectangle (5.5+\hoff+\pwidth,2.15-\voff-\pheight);
  % big fish  
  \node[ball,text width=0.3cm, fill=blue] at (5+\hoff,1.5-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.3+\hoff,2-\voff) {}; % moved because of predator
  \node[ball,text width=0.3cm, fill=blue] at (6.4+\hoff,1.3-\voff) {};
  \node[ball,text width=0.3cm, fill=blue] at (5.6+\hoff,0.8-\voff) {};
  % small fish
  % \node[ball,text width=0.1cm, fill=red] at (6+\hoff,2.3-\voff) {}; % died of fright
  \node[ball,text width=0.1cm, fill=red] at (5.8+\hoff,2-\voff) {}; % gobbled up
  % \node[ball,text width=0.1cm, fill=red] at (6.3+\hoff,1.7-\voff) {}; % gobbled up already
  \node[ball,text width=0.1cm, fill=red] at (5.6+\hoff,1.6-\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (6.4+\hoff,2.1-\voff) {}; % gobbled up
  \node[ball,text width=0.1cm, fill=red] at (6.6+\hoff,0.8-\voff) {};
  \node[ball,text width=0.1cm, fill=red] at (6.1+\hoff,0.5-\voff) {}; 
  \node[ball,text width=0.1cm, fill=red] at (5.9+\hoff,0.1-\voff) {};

  \draw[red, ->, thick] (clean) -- (rosy) node[midway, black, above] {|1.0|};

  % harm value for bleak
  \node at (15.5, 3.75) {|7|};
  % probability for bleak
  \node at (15.5, 3.4) {|.48|};
  
  % harm value for bad
  \node at (15.5, 1.15) {|4|};
  % probability for bad
  \node at (15.5, 0.8) {|.32|};

  % harm value for rosy
  \node at (15.5, -1.45) {|4|};
  % probability for rosy
  \node at (15.5, -1.8) {|.2|};


  % curly brace for aggregating the harm values
  \draw [decorate,decoration={brace,amplitude=10pt,raise=4pt},yshift=0pt]
  (15.7,4) -- (15.7,-1.7) node [black,midway,xshift=0.8cm] {};

  % vulnerability value (max, most probable)
  \node at (16.6, 1.15) {{\small \emph{?}}};
  \pause
  \fill[white] (16.2, 1.3) rectangle (17.1, 0.8);
  \node at (16.6, 1.15) {|vier|}; % {{\small \color<1>{red}{\emph{4}}}};
\end{tikzpicture}


\end{frame}


%% -------------------------------------------------------------------

\begin{frame}
\frametitle{Models of vulnerability}
\vfill
$V = \int (\frac{\partial W / \partial X}{W / W_0}) P_X dX$
\vfill
where $W$ ``is a parabolic function of an independent variable $X$''
\vfill
\emph{``Although it is impossible to determine the precise functional
relationships [\ldots] analysis based on simple theoretical models and multivariate
regressions from empirical data can provide valuable information about
critical relationships that can be applied in this measure.''}
\vfill
Luers et al., Glob. Env. Change 2003
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
\frametitle{Models vs formalisation}
\vfill
The vast majority of models are like this: find a simple mathematical or computational system that is somehow similar to the ``real'' system.
\vfill
Analyse the model and transfer the conclusions,  \emph{by analogy}, to the real system.
\vfill
\emph{Analogy} is the essence of modelling (and of applied mathematics).
\vfill
What we have tried to do was to identify ``ground rules'' for analogies in the field of vulnerability to climate change.
\vfill
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
\frametitle{Formalisation}
\vfill
Identifying ``ground rules'' for analogies in a field has much in common with grammatical investigations.
\vfill
The aim is a description of current usage, making explicit, in mathematical terms, norms implied by this usage.  
\vfill
There are many sources of examples of ``current usage'', due to ubiquity of computer simulations in the social sciences. (``Simulation is a third way of doing science'', Robert Axelrod, \emph{Advancing the Art of Simulation in the Social Sciences}, 2003).
\vfill
\end{frame}

%% -------------------------------------------------------------------

\begin{frame}
\frametitle{The future}
\vfill
\begin{itemize}
\item Systematically explore software models and reverse engineer specifications.
  \vfill
\item Pay attention to recurring concepts, such as \emph{preference, belief, fairness, trust, \ldots}
  \vfill
\item Possible candidates: migration waves; relations of trust; responsibility in the context of automation; \ldots
\end{itemize}
\vfill
\end{frame}

%% -------------------------------------------------------------------


\end{document}


\begin{frame}
\frametitle{Better tools}
\vfill
Usually, this involves the introduction of new types and new functions

Example:
\begin{itemize}
\item neural network (feed-forward, deep, convolutional, recurrent, etc.)
\item functions that query the state of the network and give us the output for given inputs
\item functions that "train" the network
\end{itemize}

\vfill
\end{frame}

%% -------------------------------------------------------------------

Alas, by 1975 Dijkstra had already formed the dogmatic opinion that
programming is a mathematical discipline in which there is no place
for concise informal reasoning supported by other means of
documentation, such as pictures, ``operational'' explanations (as he
called them), and systematic test cases. He was no longer interested
in programs that were too large to be proven mathematically
correct. (This pretty much ruled out any program of more than a couple
of pages).

``Notes On Structured Programming'' (EWD249)}

   ``A Programmer's Story: The Life of a Computer Pioneer''}

    





Although it is impossible to determine the precise functional
relationships that include all of the stressors and variables of
concern, analysis based on simple theoretical models and multivariate
regressions from empirical data can provide valuable information about
critical relationships that can be applied in this measure.


%% -------------------------------------------------------------------

\begin{frame}
\frametitle{Further work}
\vfill
resilience, avoidability, reachability

\vfill

key concept: monadic dynamical system

\vfill
generic representation of sequential decision problems
\vfill
\end{frame}

\section{Conclusions}

\begin{frame}
\frametitle{Previous examples}
\vfill
\begin{itemize}
\item Andr\'e Weil
\item Joseph Goguen
\item Noah Chomsky
\end{itemize}
\vfill
\end{frame}

%% -------------------------------------------------------------------

