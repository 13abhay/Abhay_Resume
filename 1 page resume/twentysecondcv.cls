\ProvidesClass{twentysecondcv}[2017/01/08 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\renewcommand{\bfseries}{\color{gray}} % Make \textbf produce coloured text instead

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{5cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newlength{\TotalSectionLength} % Define a new length to hold the remaining line width after the section title is printed
\newlength{\SectionTitleLength} % Define a new length to hold the width of the section title
\newcommand{\profilesection}[1]{%
	\setlength\TotalSectionLength{\linewidth}% Set the total line width
	\settowidth{\SectionTitleLength}{\huge #1 }% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-2.22221pt}% Modifier to remove overfull box warning
	\vspace{8pt}% Whitespace before the section title
	{\color{black!80} \huge #1 \rule[0.15\baselineskip]{\TotalSectionLength}{1pt}}% Print the title and auto-width rule
}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}

% Command for printing skill progress bars
\newcommand\skills[1]{ 
	\renewcommand{\skills}{
		\begin{tikzpicture}
			\foreach [count=\i,evaluate={\k=\i*0.5}] \x/\y in {#1}
			{
			%	\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
			%	\draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
			%\pgfmathsetmacro\result{\i-0.4}
				\node [above right] at (0,\k+0.4) {$\bullet$\x};
			}
		\end{tikzpicture}
	}
}

\newcommand\iskills[1]{ 
	\renewcommand{\iskills}{
		\begin{tikzpicture}
		\foreach [count=\i,evaluate={\k=\i*0.5}] \x/\y in {#1}{
			%\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
			%\draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
			\node [above right] at (0,\k+0.4) {$\bullet$\x};
		}
		\end{tikzpicture}
	}
}

\newcommand\oskills[1]{ 
	\renewcommand{\oskills}{
		\begin{tikzpicture}
		\foreach [count=\i,evaluate={\k=\i*0.5}] \x/\y in {#1}{
			%\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
			%\draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
			\node [above right] at (0,\k+0.4) {$\bullet$\x};
		}
		\end{tikzpicture}
	}
}

% Command for printing skills text
\newcommand\skillstext[1]{ 
	\renewcommand{\skillstext}{
		\begin{flushleft}
			\foreach [count=\i] \x in {#1}{ 
			%	\x$ \star $\y
			%}
			{$\bullet$ \x\newline}
		}
		\end{flushleft}
	}
}

\newcommand\oskillstext[1]{ 
	\renewcommand{\oskillstext}{
		\begin{flushleft}
			\foreach [count=\i] \x in {#1}{ 
				%	\x$ \star $\y
				%}
				{$\bullet$ \x\newline}
			}
		\end{flushleft}
	}
}

\newcommand\iskillstext[1]{ 
	\renewcommand{\iskillstext}{
		\begin{flushleft}
			\foreach [count=\i] \x in {#1}{ 
				%	\x$ \star $\y
				%}
				{$\bullet$ \x\newline}
			}
		\end{flushleft}
	}
}


\newcommand\currentprojects[1]{ 
	\renewcommand{\currentprojects}{
		\begin{flushleft}
			\foreach [count=\i] \x in {#1}{ 
				\ifnum\i=2%
				{$\bullet$\x}%
				\else%
				{$\bullet$\x\newline\newline}%
				\fi%
			}
		\end{flushleft}
	}
}
%----------------------------------------------------------------------------------------
%	 SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
	\end{tikzpicture}

	%------------------------------------------------

	\begin{textblock}{6}(0.5, 0.2)
			
		%------------------------------------------------
		
		\ifthenelse{\equal{\profilepic}{}}{}{
			\begin{center}
				\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
					\clip (600/2, 567/2) circle (567/2);
					\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\profilepic}};
				\end{tikzpicture}
			\end{center}
		}

		%------------------------------------------------

		{\Huge\color{mainblue}\cvname}

		%------------------------------------------------

		{\Large\color{black!80}\cvjobtitle}

		%------------------------------------------------

		\renewcommand{\arraystretch}{1.6}
		\begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
			\ifthenelse{\equal{\cvdate}{}}{}{\textsc{\Large\icon{\Info}} & \cvdate\\}
			\ifthenelse{\equal{\cvaddress}{}}{}{\textsc{\Large\icon{\Letter}} & \cvaddress\\}
			\ifthenelse{\equal{\cvnumberphone}{}}{}{\textsc{\Large\icon{\Telefon}} & \cvnumberphone\\}
			\ifthenelse{\equal{\cvsite}{}}{}{\textsc{\Large\icon{\Mundus}} & \cvsite\\}
			\ifthenelse{\equal{\cvmail}{}}{}{\textsc{\large\icon{@}} & \href{mailto:\cvmail}{\cvmail}}
		\end{tabular}

		%------------------------------------------------
		
		\ifthenelse{\equal{\aboutme}{}}{}{
			\profilesection{Objective}
			\begin{flushleft}
				\aboutme
			\end{flushleft}
		}

		%------------------------------------------------
		\hrulefill
		
		\profilesection{Current Projects}
		\currentprojects
		
		\hrulefill

		\profilesection{Techincal Skills}
		\newline\newline
		\centering\emph \textbf{\underline{Programming Languages}}
		
		\skillstext
		
		\emph \textbf{\underline{Industry Skills}}
		
		\iskillstext 
		
		\emph \textbf{\underline{Other Skills}}
		
		\oskillstext
		 
		
		\scriptsize
		%(*)[The skill scale is from 0 (Fundamental Awareness) to 6 (Expert).]
			
		%------------------------------------------------
			
	\end{textblock}
}

%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
}

\newcounter{colorCounter}
\newcommand{\sectioncolor}[1]{%
	{%
		\round{#1}{
			\ifcase\value{colorCounter}%
			mainblue\or%
			mainblue\or%
			mainblue\or%
			mainblue\or%
			mainblue\or%
			mainblue\or%
			mainblue\or%
			mainblue\or%
 			mainblue\or%
			mainblue\else%
			mainblue\fi%
		}%
	}%
	\stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
	{%
		\color{gray}%
		\Large\sectioncolor{#1}%
	}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\large\color{gray} #1%
	}
	\par\vspace{.25\parskip}%
}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitem}[4]{%
	\parbox[t]{\textwidth}{%
		#1
		\hfill%
		\textbf{#2}%
		\\
		#4%
		\hfill
		\textbf{#3}
		\vspace{\parsep}
	}\\
}

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	#1&\parbox[t]{0.78\textwidth}{%
		\textbf{#2}%
		\vspace{5pt}
	}\\
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=.1cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}

\RequirePackage{hyperref}

\newenvironment{rSection}[1]{
	\sectionskip
	\MakeUppercase{\bf #1}
	\sectionlineskip
	\begin{list}{}{
			\setlength{\leftmargin}{1.5em}
		}
		\item[]
	}{
	\end{list}
}

% Used to format job listing
\newenvironment{rSubsection}[4]{
	%%%%%%%%%%%%%%%%%%%%%% Default Layout: %%%%%%%%%%%%%%%%%%%%%%%%
	%%    Employer (bold)                     Dates (regular)    %%
	%%    Title (emphasis)                Location (emphasis)    %%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	{\bf #1}                 \hfill                  {    #2}% Stop a space
	\ifthenelse{\equal{#3}{}}{}{
		\\
		{\em #3}                 \hfill                  {\em #4}% Stop a space
	}\smallskip
	% \cdot used for bullets, items non-indented
	\begin{list}{$\cdot$}{\leftmargin=0em}
		\itemsep -0.5em \vspace{-0.5em}
	}{
	\end{list}
	\vspace{0.5em}
}

\def\namesize{\huge}
\def\nameskip{\medskip}
\def\addressskip{\smallskip}
\def\sectionskip{\bigskip}
\def\sectionlineskip{\medskip}
