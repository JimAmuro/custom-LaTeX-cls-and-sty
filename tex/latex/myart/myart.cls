\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myart}


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

% Margin and Format
\RequirePackage[margin=1in]{geometry}
\headsep=0.25in 
% \textwidth=6.5in
% \textheight=9.0in

\RequirePackage{titling}
\RequirePackage{titlesec} %Define title formats
    %\newcommand{\sectionbreak}{\clearpage} % make new section begin a newpage
\RequirePackage{titletoc}

% To deal with titlesec overwriting \thetitle ... Just a varible saves it.
\let\oldtitle\title
\renewcommand{\title}[1]{\oldtitle{#1}\newcommand{\thistitle}{#1}}

\RequirePackage{fancyhdr} % Required for custom headers
  \pagestyle{fancy}
      % Set up the header and footer
      \lhead{\emph{\theauthor}} % Top left header
      \chead{\textbf{\thistitle}} % Top center header
      \rhead{\leftmark} % Top right header
      \lfoot{} % Bottom left footer
      \cfoot{--\ \thepage\ --} % Bottom center footer
      \rfoot{} % Bottom right footer
      % \renewcommand\footrulewidth{0.4pt} % Size of the footer rule


%Misc
\RequirePackage{extramarks} % Required for headers and footers
\RequirePackage{graphicx} % Required to insert images
\RequirePackage[space]{grffile} % deal with space in windows file path
\RequirePackage{xcolor} % Required for custom colors
\RequirePackage{booktabs} % Required for beautiful tables
\RequirePackage{siunitx}
\RequirePackage[us]{datetime}
\RequirePackage[shortlabels,inline]{enumitem}
    \setlist{leftmargin=*}
    \setlist[enumerate]{{\bf A.}}

\RequirePackage[pdfauthor={Hui Sun},
            % pdftitle={Assignment}
            ]{hyperref}
\RequirePackage{bookmark}

% Fonts
\RequirePackage[sc]{mathpazo} % Palatino with smallcaps
\RequirePackage[scaled]{helvet} % Helvetica, scaled 95%
%\RequirePackage{eulervm} % Euler math, no italic, sometimes hard to distinguish from body font...
\RequirePackage[T1]{fontenc}

%TITLE STYLE
\pretitle{\begin{center}\LARGE \bfseries}
\posttitle{\par\end{center}\vskip 0.5em}

\author{Hui Sun}

% date is so useless in title, delete it and its spacing by default!
\predate{}
\postdate{}
\date{} %Omit the date by leave it blank, the spacing will also be omitted 
