\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myhw}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   PACKAGES AND OTHER DOCUMENT CONFIGURATIONS  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[l2tabu, orthodox]{nag}
\RequirePackage[utf8]{inputenc}
\RequirePackage{microtype}

%Math
\RequirePackage{mathtools}
  \DeclarePairedDelimiter\ceil{\lceil}{\rceil}
  \DeclarePairedDelimiter\floor{\lfloor}{\rfloor}
\RequirePackage{amssymb}
\RequirePackage{bm} %bold math symbols for vectors and so on
\RequirePackage{amsthm}
\RequirePackage{commath}
\RequirePackage{xfrac}

% Margin and Format
\RequirePackage[margin=1in]{geometry}
\headsep=0.25in 
% \textwidth=6.5in
% \textheight=9.0in

\RequirePackage{titling}
\RequirePackage{titlesec} %Define title formats
\RequirePackage{titletoc}

% To deal with titlesec overwriting \thetitle ... Just use a variable to save it before overwrited.
\let\oldtitle\title
\renewcommand{\title}[1]{\oldtitle{#1}\newcommand{\thistitle}{#1}}

\RequirePackage{fancyhdr} % Required for custom headers
  % Set up the header and footer
  \pagestyle{fancy}
    \lhead{\emph{\theauthor}} % Top left header
    \chead{\textbf{\thistitle}} % Top center header
    \rhead{} % Top right header
    \lfoot{\lastxmark} % Bottom left footer
    \cfoot{} % Bottom center footer
    \rfoot{--\ \thepage\ --} % Bottom right footer
    \renewcommand\headrulewidth{0.4pt} % Size of the header rule
    \renewcommand\footrulewidth{0.4pt} % Size of the footer rule

%Misc
\RequirePackage{extramarks} % Required for headers and footers
\RequirePackage{graphicx} % Required to insert images
\RequirePackage[space]{grffile} % deal with space in windows file path
\RequirePackage{xcolor} % Required for custom colors
\RequirePackage{booktabs} % Required for beautiful tables
\RequirePackage{siunitx}
\RequirePackage[en-US]{datetime2}
\RequirePackage[shortlabels,inline]{enumitem}


% Fonts
\RequirePackage[sc]{mathpazo} % Palatino with smallcaps
\RequirePackage[scaled]{helvet} % Helvetica, scaled 95%
%\RequirePackage{eulervm} % Euler math, no italic, sometimes hard to distinguish from body font...
\RequirePackage[T1]{fontenc}

% PDF Functions
\RequirePackage[pdftitle={Assignment},  pdfauthor={Hui Sun}]{hyperref}
\RequirePackage{bookmark}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DOCUMENT STRUCTURE COMMANDS  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\exname}{Problem\ } %Set the name of exercise to be Problem or Exercise or something else.
\newcommand{\solname}{Solution}
\newcommand{\excounter}{\arabic{homeworkProblemCounter}}
\newcommand{\subexcounter}{\alph{homeworkSectionCounter}.}

% Header and footer for when a page split occurs within a problem environment
\newcommand{\enterProblemHeader}[1]{
\nobreak\extramarks{#1}{#1 continued on next page\ldots}\nobreak
\nobreak\extramarks{#1 (continued)}{#1 continued on next page\ldots}\nobreak
}
% Header and footer for when a page split occurs between problem environments
\newcommand{\exitProblemHeader}[1]{
\nobreak\extramarks{#1 (continued)}{#1 continued on next page\ldots}\nobreak
\nobreak\extramarks{#1}{}\nobreak
}
\setcounter{secnumdepth}{0} % Removes default section numbers
\newcounter{homeworkProblemCounter} % Creates a counter to keep track of the number of problems
\newcounter{homeworkSectionCounter} % a counter for sections in one problem, refresh when enter a new problem

\newcommand{\homeworkProblemName}{}
\newenvironment{homeworkProblem}[1][\exname\excounter]{ % Makes a new environment called homeworkProblem which takes 1 argument (custom name) but the default is "Problem #"
\setcounter{homeworkSectionCounter}{0}
\stepcounter{homeworkProblemCounter} % Increase counter for number of problems
\renewcommand{\homeworkProblemName}{#1} % Assign \homeworkProblemName the name of the problem
\section{\homeworkProblemName} % Make a section in the document with the custom problem count
\enterProblemHeader{\homeworkProblemName} % Header and footer within the environment
}{
\exitProblemHeader{\homeworkProblemName} % Header and footer after the environment
}


\newcommand{\homeworkSectionName}{}
\newenvironment{homeworkSection}[1][\subexcounter]{ % New environment for sections within homework problems, takes 1 argument - the name of the section.
\stepcounter{homeworkSectionCounter}
\renewcommand{\homeworkSectionName}{#1} % Assign \homeworkSectionName to the name of the section from the environment argument
\subsection{\homeworkSectionName} % Make a subsection with the custom name of the subsection
\enterProblemHeader{\homeworkProblemName\ [\homeworkSectionName]} % Header and footer within the environment
}{
\enterProblemHeader{\homeworkProblemName} % Header and footer after the environment
}

% Solution env, the same format as proof in amsthm
\newenvironment{solution}{\par
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \itshape
    \solname\@addpunct{.}]\ignorespaces
}{%
  \endtrivlist\@endpefalse
}   

%%% TITLE STYLE 
\pretitle{\begin{center}\Huge \bfseries}
\posttitle{\par\end{center}\vskip 2in}

\preauthor{\begin{center}
       \Huge \usefont{OT1}{pzc}{m}{n} \lineskip 0.5em%
       \begin{tabular}[t]{c}}
\postauthor{\end{tabular}\par\end{center}}

\author{Hui Sun}

% date is so useless in title, delete it and its spacing by default!
\predate{}
\postdate{}
\date{} %Omit the date by leave it blank, the spacing will also be omitted 