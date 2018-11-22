\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{HTNotes}[2018/07/16 v1.0 An Notes class for mine]

\RequirePackage{xkeyval}
\RequirePackage{etoolbox}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
% 关于图片 graphicx
 % 如果图片没有指定后缀, 依次按下列顺序搜索
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png}
 % 设置图表搜索路径, 可以给图表文件夹取如下名字
\graphicspath{{figures/}{figure/}{pictures/}{picture/}{fig/}{figs/}{image/}{images/}}

% color of the cover
\define@choicekey{HTNotes.cls}{cvcolor}[\val\ar]{green,orange,violet,blue}[blue]{
  \ifcase\ar\relax
    \definecolor{themecolor}{HTML}{92D14F}
    \definecolor{cvtext}{HTML}{92909B}
  \or
    \definecolor{themecolor}{RGB}{230,140,20}
    \definecolor{cvtext}{RGB}{100,100,100}
  \or
    \definecolor{themecolor}{RGB}{178,10,142}
    \definecolor{cvtext}{RGB}{100,100,100}
  \or
    \definecolor{themecolor}{RGB}{0,164,215}
    \definecolor{cvtext}{RGB}{100,100,100}
  \fi
}

% customfont
\define@boolkey{HTNotes.cls}[Font]{customfont}[false]{}

% answer
\define@boolkey{HTNotes.cls}[Book]{answer}[false]{}

% logo
\newsavebox{\Mylogo}
\define@choicekey{HTNotes.cls}{logo}[\val\nr]{Lion,Mine,user1,user2}[Lion]{
  \ifcase\nr\relax
    \sbox{\Mylogo}{\includegraphics[width=2cm]{Lion}}
  \or
    \sbox{\Mylogo}{\includegraphics[width=2cm]{Mine}}
  \or
    \sbox{\Mylogo}{\includegraphics[width=2cm]{User1}}
  \or
    \sbox{\Mylogo}{\includegraphics[width=2cm]{User2}}
  \fi
}

% Information of the PDF
\define@cmdkeys{HTNotes.cls}[PDF@]{
  Subject,      % Set the document information Subject field
  Producer,     % Set the document information Producer field
  Keywords,     % Set the document information Keywords field
}

% Element of the cover
\define@cmdkeys{HTNotes.cls}[Book@]{
  Series,       % Set the book information Series field on cover
  SubTitle,     % Set the book information SubTitle field on cover
  Introduction, % Set the book information Introduction field on cover
  Edition,      % Set the book information Edition field on cover
  Publisher,    % Set the book information Publisher field on cover
}

% Element of the copyright page
\define@cmdkeys{HTNotes.cls}[Book@]{
  Words,        % Set the book information Words field on copyright page
  Email,        % Set the book information Email field on copyright page
  Website,      % Set the book information Website field on copyright page
}

% Extra Page, between the flypage and the preface, often is uesed to give the editorial committee
\define@cmdkeys{HTNotes.cls}[Book@]{
  ExtraPage,    % Give the content of the editorial committee
}

% Preface of the book
\define@cmdkeys{HTNotes.cls}[Book@]{
  Preface,      % Set the book information Preface field on Preface page
  Writer,       % Set the book information Writer field on Preface page
}

% Element of the back cover
\define@cmdkeys{HTNotes.cls}[Book@]{
  Summary,      % Set the book information Summary field on back cover
  Editor,       % Set the book information Editor field on back cover
  Designer,     % Set the book information Designer field on back cover
  Price,        % Set the book information Price field on back cover
  ISBN,         % Set the book information ISBN field on back cover
}

\ExecuteOptionsX{
  cvcolor = {blue},
  logo = {Lion},
  customfont = {false},
  answer = {false},
  Subject = {},
  Producer = {XeLaTeX+TeXLive 2018},
  Keywords = {},
  Series = {计算机应用技术丛书},
  SubTitle = {这里可以放一个副标题},
  Introduction = {这个图书模板是在群主网站上的一个封面模板的基础上改写而成的，设定了一些图书出版要素，设计了封面、扉页及版权页和封底的样式，修改了chapter的样式，并提供了几个选项可切换色彩风格，其余则维持book基本文档类的设定，并将选项用xkeyval进行重新设定，提供了键值对的设置模式。\\ 图书模板部分代码的完成得到了林莲枝大神、夜神的帮助，在此表示感谢。由于作者水平有限，模板代码编写不恰当之处还请用户提出批评和指正。\\ 感谢造字工坊提供了刻宋、郎宋和黄金时代三种非商业可免费下载使用的字体。\\ 感谢谷歌提供自由使用的思源宋体、思源黑体。\\ 感谢文泉驿提供的开源的文泉驿等宽微米黑字体。},
  Edition = {1},
  Publisher = {\LaTeX Studio 出版社},
  Words = {666千字},
  Email = {htharoldht@Gmail.com},
  Website = {https://htharoldht.com},
  ExtraPage = {},
  Preface = {\zhlipsum[2,5][name=zhufu]},
  Writer = {},
  Summary = {\zhlipsum[2]},
  Editor = {张三},
  Designer = {李四},
  Price = {806},
  ISBN = {978-7-302-11622-6},
}
\def\@title{一个中文书籍的\LaTeX{}模板}
\def\@author{王五}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptionsX\relax
\LoadClass[twoside,11pt]{book}
\newcommand{\HTset}[1]{\setkeys{HTNotes.cls}{#1}}

\RequirePackage[heading=true]{ctex}
\ifFontcustomfont
  \setCJKmainfont[BoldFont={Noto Serif CJK SC Bold},ItalicFont={AdobeFangsongStd-Regular}]{Noto Serif CJK SC ExtraLight}
  \setCJKsansfont[BoldFont={Noto Sans S Chinese Medium}]{Noto Sans S Chinese DemiLight}
  \setCJKmonofont{WenQuanYi Micro Hei Mono Light}
  \setCJKfamilyfont{zhkesong}{MF KeSong (Noncommercial)}
  \newcommand{\KeSong}{\CJKfamily{zhkesong}}
  \setCJKfamilyfont{zhhjsd}{MF TheGoldenEra (Noncommercial)}
  \newcommand{\hjsd}{\CJKfamily{zhhjsd}}
  \setCJKfamilyfont{zhlangsong}{MF LangSong (Noncommercial)}
  \newcommand{\langsong}{\CJKfamily{zhlangsong}}
  \newfontfamily\SourceCodePro[Mapping=tex-text]{Source Code Pro}
  \newfontfamily\KeSongf[Mapping=tex-text]{MF KeSong (Noncommercial)}
  \newfontfamily\hjsdf[Mapping=tex-text]{MF TheGoldenEra (Noncommercial)}
  \newfontfamily\langsongf[Mapping=tex-text]{MF LangSong (Noncommercial)}
\else
  \newcommand{\KeSong}{\songti}
  \newcommand{\hjsd}{\songti}
  \newcommand{\langsong}{\songti}
  \newcommand{\KeSongf}{\rmfamily}
  \newcommand{\hjsdf}{\rmfamily}
  \newcommand{\langsongf}{\rmfamily}
\fi

\RequirePackage[a4paper,hmargin={20mm,25mm},vmargin={25mm,25mm}]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{pifont,calc}
\RequirePackage{multicol}
\RequirePackage{amsmath,amssymb,bm,extarrows}
\RequirePackage[amsmath,thmmarks]{ntheorem}
\RequirePackage{caption}
\RequirePackage[font=footnotesize]{subcaption}
\RequirePackage{varwidth}
\RequirePackage[shortlabels]{enumitem}
  % \AddEnumerateCounter{\chinese}{\chinese}{}
\RequirePackage[perpage]{footmisc}% 脚注编号每页清零
\RequirePackage{ean13isbn} % ean13isbn 宏包支持，输出isbn条形码。
  \newcommand{\drawbarcode}[1]{\EANisbn[SC5a,ISBN=#1]}
\RequirePackage{fancybox}
\RequirePackage{tcolorbox}
  \tcbuselibrary{skins,breakable}
  \usetikzlibrary{patterns,shadows}
\RequirePackage{titletoc}
\RequirePackage{tabu,booktabs}
\RequirePackage{CJKnumb}
\RequirePackage{ocgx2}
\RequirePackage[colorlinks,hidelinks]{hyperref}
\RequirePackage{mdframed}
\AtBeginDocument{
  \hypersetup{
    pdfinfo={
      Title   = {\@title},
      Author  = {\@author},
      Subject = {\PDF@Subject},
      Producer = {\PDF@Producer},
      Keywords = {\PDF@Keywords},
    }
  }
  \ifBookanswer{
    \setcounter{answer}{1}
  }\else{
    \setcounter{answer}{0}
  }\fi
}

% 设置边注
\definecolor{tcolor}{RGB}{255,127,  0} % 旁注所标注的文本颜色 default: 0,124,53
\definecolor{lcolor}{RGB}{255,178,102} % 线条颜色 default: 153,255,153
\definecolor{pcolor}{RGB}{251,204,231} % 旁注内容文本颜色 default: 216,255,216
\setlength{\marginparwidth}{15mm}
\setlength{\marginparsep}{5mm}
\newcommand{\note}[2]{
  \begin{tikzpicture}[remember picture, baseline=-0.75ex]
    \node[coordinate] (outText) {};
  \end{tikzpicture}
  \textcolor{tcolor}{\hspace*{-0.55em}$\bm\langle{}\!{}$#1${}\!{}\bm\rangle$\hspace*{-0.55em}}
  \begin{tikzpicture}[remember picture, baseline=-0.75ex]
    \node[coordinate] (inText) {};
  \end{tikzpicture}
  \marginpar{
    \renewcommand{\baselinestretch}{1.0}
    \begin{tikzpicture}[remember picture]
      \draw node[fill= pcolor, rounded corners, text width=\marginparwidth] (inNote){\footnotesize #2};
    \end{tikzpicture}
  }
  \begin{tikzpicture}[remember picture, overlay]
    \ifthenelse{\isodd{\thepage}}{
      \draw[draw = lcolor, thick]
        ([yshift=-0.55em] inText.west)
        -| ([xshift=-0.55em] inNote.west)
        -| (inNote.west);
      }{
      \draw[draw = lcolor, thick]
        ([yshift=-0.55em] outText.east)
        -| ([xshift=+0.5em] inNote.east)
        -| (inNote.east);
      }
  \end{tikzpicture}
}

% 增加注意环境
\newtcolorbox{marker}[1][]{enhanced,
  before skip=2mm,after skip=3mm,
  boxrule=0.4pt,left=5mm,right=2mm,top=1mm,bottom=1mm,
  colback=yellow!40,
  colframe=yellow!10!black,
  sharp corners,rounded corners=southeast,arc is angular,arc=3mm,
  underlay={%
    \path[fill=tcbcol@back!80!black] ([yshift=3mm]interior.south east)--++(-0.4,-0.1)--++(0.1,-0.2);
    \path[draw=tcbcol@frame,shorten <=-0.05mm,shorten >=-0.05mm] ([yshift=3mm]interior.south east)--++(-0.4,-0.1)--++(0.1,-0.2);
    \path[fill=yellow!50!black,draw=none] (interior.south west) rectangle node[white]{\Huge\bfseries !} ([xshift=4mm]interior.north west);
    },
  drop fuzzy shadow,#1}

\definecolor{cvprimary}{RGB}{0,164,215}
\definecolor{zhanqing}{RGB}{0,51,113}

\newcommand{\fancyNum}[1]{
  \sffamily\textcolor{cvprimary}{\zihao{5}{#1}}
}
% \fancypagestyle{plain}{%
%   % \fancyhf{} % clear all header and footer fields
%   \fancyfoot[C]{-\ \fancyNum{\thepage}\ -} % except the center
%   \renewcommand{\headrulewidth}{0pt}
% }
\pagestyle{fancy}
\fancyhf{}
\fancyhead[RE,LO]{\color{cvprimary}\textrm{\@title}} %奇数页眉的左边, 偶数页眉的右边
\fancyhead[RO]{\color{cvprimary}\zihao{5} \rightmark}
\fancyhead[LE]{\color{cvprimary}\zihao{5} \leftmark} %偶数页眉的左边
\fancyfoot[RO,LE]{\fancyNum{\thepage}}
\fancyfoot[RE,LO]{\fancyNum{\Book@Series}}

\renewcommand\frontmatter{
  \cleardoublepage
  \pagestyle{plain}
}
\renewcommand\mainmatter{
  \ifthenelse{\isodd{\thepage}}{}{
    \mbox{}
    \thispagestyle{empty}
    \newpage
  }
  \pagenumbering{arabic}
  \pagestyle{fancy}
}

\renewcommand\backmatter{
  \ifthenelse{\isodd{\thepage}}{
    \mbox{}
    \newpage
    \thispagestyle{empty}
  }{}
}

\tcbset{
  chapter/.style={
    enhanced,
    segmentation style=solid,
    halign=center,halign lower=center,arc is angular,sharp corners=uphill,breakable,parbox=true,
    boxrule=1mm,width=.8\textwidth,lefthand width=3cm,leftrule=0mm,sidebyside,rightrule=0mm,boxsep=0mm,arc=3mm,outer arc=3mm,
    left=3mm,right=3mm,top=5mm,bottom=5mm,toptitle=1mm,bottomtitle=1mm
  }
}
\tcbset{
  section/.style={
    halign=center,halign lower=left,arc is angular,sharp corners,breakable,parbox=false,
    boxrule=0mm,width=\textwidth,lefthand width=2cm,leftrule=0mm,sidebyside,rightrule=0.5pt,bottomrule=1pt,toprule=0.5pt,boxsep=0mm,arc=3mm,outer arc=3mm,
    left=2mm,middle=1mm,right=1mm,top=2mm,bottom=2mm,toptitle=1mm,bottomtitle=1mm
  }
}
\tcbset{
  subsection/.style={
    enhanced,
    segmentation style=solid,
    halign=center,halign lower=left,arc is angular,sharp corners,rounded corners=northwest,breakable,parbox=true,
    boxrule=1mm,width=\textwidth,lefthand width=3\ccwd,leftrule=0mm,sidebyside,rightrule=0mm,boxsep=0mm,arc=3mm,outer arc=3mm,
    left=5mm,right=3mm,top=2mm,bottom=2mm,toptitle=1mm,bottomtitle=1mm
  }
}
\tcbset{
  tocs/.style={
    enhanced,breakable,
    halign=center,arc is angular,sharp corners=uphill,parbox=true,
    boxrule=1mm,width=\textwidth,leftrule=0.2mm,rightrule=0.2mm,boxsep=0mm,arc=3mm,outer arc=3mm,
    left=3cm,right=3mm,top=5mm,bottom=5mm,toptitle=1mm,bottomtitle=1mm,
    overlay={\begin{tcbclipinterior}
      \draw[zhanqing,line width=0.5pt] ([xshift=2.8cm]frame.north west)--([xshift=2.8cm]frame.south west);
      \node[anchor=west] at ([xshift=1cm]frame.west) {\color{zhanqing}{\zihao{3}\KeSong\KeSongf \parbox{1em}{~\vfill~\\目~\vfill~\\录~\vfill~}}};
    \end{tcbclipinterior}},
    % overlay={\begin{tcbclipinterior}\draw[zhanqing,line width=1pt] ([xshift=2.8cm]frame.north west)
    % --([xshift=2.8cm]frame.south west);\end{tcbclipinterior} },
    % overlay={\begin{tcbclipinterior}\draw[zhanqing,line width=1pt] ([xshift=2.8cm]frame.north west)
    % --([xshift=2.8cm]frame.south west);\end{tcbclipinterior}},
  }
}
\newtcolorbox{mtoc}{tocs,width=1\textwidth,colframe=zhanqing,colback=white,coltext=zhanqing!80}
\newtcolorbox{mchapter}{chapter,colframe=cvprimary!80,colback=white}
\newtcolorbox{msection}{section,bicolor,colback=cvprimary!80,colbacklower=white,colframe=cvprimary!80}
\newtcolorbox{msubsection}{subsection,colback=cvprimary!80,colframe=white}
\newcommand{\mybox}[1]{
  \noindent\tikz[every shadow/.style={opacity=.8,fill=cvprimary}]
  \filldraw [drop shadow,fill=white,draw=cvprimary] (0,0) rectangle (1em,1em);
  \textcolor{cvprimary}{\sffamily#1}\vspace*{2mm}
}

\def\thepart{\arabic{part}}
\def\thesection{\arabic{section}}
\def\thesubsection{\arabic{chapter}.\arabic{section}.\arabic{subsection}}

\ctexset{
  part = {
    beforeskip = 0pt,
    name = {\quad\\第,篇\\},
    nameformat = \mbox{}\hfill\heiti\color{cvprimary}\partnamebox,
    titleformat = \heiti\color{cvprimary}\parttitlebox,
    aftertitle = \vspace*{\stretch{1}}\begin{mtoc}\color{zhanqing!80}\printcontents[parts]{}{0}{\setcounter{tocdepth}{0}}\end{mtoc}\vspace*{\stretch{2}},
    tocline = \CTEXifname{\protect\numberline{\thepart}}{}#2,
  },
  chapter = {
    beforeskip = 0pt,
    fixskip = true,
    number = {},
    name = {},
    aftertitle = \par,
    titleformat = \zihao{3}\heiti\chaptertitleformat,
    tocline = \CTEXifname{\protect\numberline{\thechapter}}{}#2,
    pagestyle = plain,
  },
  section = {
    fixskip = true,
    number = {},
    name = {},
    titleformat = \zihao{4}\heiti\sectiontitleformat,
    tocline = \CTEXifname{\protect\numberline{\thesection}}{}#2,
  },
  subsection = {
    fixskip = true,
    beforeskip = 0pt,
    number = {},
    name = {},
    titleformat = \zihao{-4}\heiti\subsectiontitleformat,
    tocline = \CTEXifname{\protect\numberline{\thesubsection}}{}#2,
  },
}

% \newcounter{type}[chapter]
\newcommand{\type}[1]{{
    \stepcounter{section}
    \bigskip
    \zihao{4} \mybox{题型\CJKnumber{\thesection}} \; \textcolor{cvprimary}{\sffamily#1}\bigskip
    \addcontentsline{toc}{section}{题型\CJKnumber{\thesection} \; {#1}}
  }
}

\newcommand{\partnamebox}[1]{\shadowbox{\parbox{\ccwd}{\zihao{-2}\textcolor{gray}{#1}}}}
\newcommand{\parttitlebox}[1]{
  \begin{minipage}{\textwidth}
    {\centering\zihao{2}#1}
    \startcontents[parts]
  \end{minipage}
}
\newcommand\chaptertitleformat[1]{%% 以标题内容为参数
\par
\begin{mchapter}\color{cvprimary!80} \CTEXifname{第 \CJKnumber{\thechapter} 章}{} \tcblower\color{cvprimary!80}#1\end{mchapter}}
\newcommand\sectiontitleformat[1]{%% 以标题内容为参数
\par
\begin{msection}\color{white} \CTEXifname{第 \CJKnumber{\thesection} 节}{} \tcblower\color{cvprimary}#1\end{msection}}
\newcommand\subsectiontitleformat[1]{%% 以标题内容为参数
\par
\begin{msubsection}\color{white} \CTEXifname{\thesubsection}{} \tcblower\color{white}#1\end{msubsection}}

% Contents
\renewcommand\tableofcontents{
  \pagestyle{fancy}
  \ifodd
    \c@page
  \else
    \thispagestyle{empty}
    \mbox{}
    \newpage
  \fi
  \newgeometry{margin=25mm}
  \pagenumbering{arabic}
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
   \fi
    \@mkboth{
      \MakeUppercase\contentsname}{\MakeUppercase\contentsname}
      \begin{mtoc}\color{zhanqing!80}\@starttoc{toc}\vfill\end{mtoc}
      \if@restonecol\twocolumn\fi
  \restoregeometry
}

\titlecontents{part}[0pt]{\addvspace{.4\baselineskip} \heiti \zihao{4}}
  {第\CJKnumber{\thecontentslabel}{篇}\quad}{}
  {\hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}
\titlecontents{chapter}[1em]{\addvspace{0.25\baselineskip} \songti \zihao{-4}}
  {第\CJKnumber{\thecontentslabel}{章}\quad}{}
  {\hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}
\titlecontents{section}[2em]{\songti \zihao{5}}
  {第\CJKnumber{\thecontentslabel}节\quad}{}
  {\hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}
\titlecontents{subsection}[3em]{\songti \zihao{5}}
  {\thecontentslabel\quad}{}
  {\hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}

% 脚注带圈符号
\ifFontcustomfont
  \RequirePackage{osno}
  \RenewDocumentCommand{\thefootnote}{}{\owhite{\value{footnote}}}
\else
  \RenewDocumentCommand{\thefootnote}{}{\ding{\numexpr171+\value{footnote}}}% 脚注为带圈符
\fi

\newcommand{\ROMAN}[1]{\expandafter\@slowromancap\romannumeral #1@}

\def\maketitle{
\begin{titlepage}
\thispagestyle{empty}
\begin{tikzpicture}[remember picture,overlay]
  %----- 竖条幅
  \fill[themecolor] (current page.north west) rectangle ([xshift=4.5cm]current page.south west);
  %----- 横条幅
  \fill[themecolor!30] ([yshift=-4cm]current page.north west) rectangle ([yshift=-9cm]current page.north east);
  %----- logo
  \node at ([yshift=-2.6cm,xshift=2.5cm]current page.north west) {\usebox{\Mylogo}};
  %----- 丛书名称
  \ifdefempty{\Book@Series}{}{
  \node[above right] at ([xshift=5cm,yshift=-3cm]current page.north west){\LARGE\hjsd\hjsdf\Book@Series};}
  %----- 书名与副标题
  \ifdefempty{\Book@SubTitle}{
    \node[cvtext,text width=17cm,inner sep=0.3cm] at ([yshift=-6.5cm]current page.north) {\centerline{\fontsize{40pt}{48pt}\selectfont\langsong\langsongf\@title}};
  }{
    \node[cvtext,right,text width=17cm,inner sep=0.3cm] at ([xshift=1cm,yshift=-6cm]current page.north west) {\fontsize{40pt}{48pt}\selectfont\langsong\langsongf\@title};
    \node[cvtext,above left] at ([xshift=-1cm,yshift=-8.5cm]current page.north east) {\LARGE \sffamily ------~\Book@SubTitle};
  }
  %----- 右下角的版本号
  \ifdefempty{\Book@Edition}{}{
  \fill[themecolor]([xshift=-2.5cm]current page.south east)-- ++(-5,0)-- ++(7.5,7.5)-- ++(0,-5)--cycle;
  \node [white] at([xshift=-2.8cm,yshift=2.8cm]current page.south east)[rotate=45]{\bfseries\sffamily\LARGE 第\CJKnumber{\Book@Edition}版};
  \node [white] at([xshift=-2.2cm,yshift=2.2cm]current page.south east)[rotate=45]{\bfseries\LARGE Edition \ROMAN{\Book@Edition}};
  \draw[white,thick] ([xshift=-4cm,yshift=1cm]current page.south east)--([xshift=-1cm,yshift=4cm]current page.south east);
  \path[fill=blue!75!white,draw=blue,double=white!85!blue,
      preaction={opacity=0.6,fill=blue!75!white},
      line width=0.1mm,double distance=0.2mm,
      pattern=fivepointed stars,pattern color=white!75!blue]
    ([xshift=-3cm]current page.south east)-- ++(-0.5,0) -- ++(3.5,3.5) -- ++(0,-0.5) -- cycle;
  \path[fill=blue!75!white,draw=blue,double=white!85!blue,
      preaction={opacity=0.6,fill=blue!75!white},
      line width=0.1mm,double distance=0.2mm,
      pattern=fivepointed stars,pattern color=white!75!blue]
    ([xshift=-6.5cm]current page.south east)-- ++(-0.5,0) -- ++(7,7) -- ++(0,-0.5) -- cycle;}
  \node[right] at ([xshift=6.5cm,yshift=2cm]current page.south west){\LARGE\KeSong\KeSongf\Book@Publisher};
  %----- 简介与作者
  \ifdefempty{\Book@Introduction}
  {\node (image) at ([xshift=-1.5cm,yshift=-3cm]current page.center){
  \rule{8cm}{3cm}};
  \draw[white,line width=1mm](image.east)-- ++(4,0) node[above left,text=black]{\LARGE\itshape\makebox[3em][s]{\LARGE\itshape\@author}\hspace{0.5em}编著};}
  {\node[inner sep=0pt] (image) at ([xshift=-1.5cm,yshift=-3cm]current page.center){
  \begin{tcolorbox}[sharp corners=west,text width =8cm,colframe=cvtext,leftrule=0pt,arc =10pt,toprule=3mm,bottomrule=3mm]
  \large\Book@Introduction
  \end{tcolorbox}};
  \draw[cvtext,line width=1mm](image.east)-- ++(5.5,0) node[above left,text=black]{\LARGE\itshape\makebox[3em][s]{\LARGE\itshape\@author}\hspace{0.5em}编著};}
\end{tikzpicture}
\end{titlepage}
\if@twoside
\newpage\thispagestyle{empty}\mbox{}
\else\fi
%----- 避免多次使用，执行一次后就更改定义。
\global\let\maketitle\relax
}

\def\makebackcover{
\clearpage
%----- 若为双面排版，确保封底在偶数页。
\ifodd\c@page
  \thispagestyle{empty}
  \mbox{}
  \newpage
\else
  \thispagestyle{empty}
  \mbox{}
  \newpage
  \thispagestyle{empty}
  \mbox{}
  \newpage
\fi
\thispagestyle{empty}
%------ 封底图形
\begin{tikzpicture}[remember picture,overlay]
%------ 竖条纹
\fill[themecolor] (current page.north east) rectangle ([xshift=-4.5cm]current page.south east);
\fill[themecolor] ([xshift=-4.7cm]current page.north east) rectangle ([xshift=-4.85cm]current page.south east);
\fill[themecolor] ([xshift=-4.95cm]current page.north east) rectangle ([xshift=-5.05cm]current page.south east);
\fill[themecolor] ([xshift=-5.15cm]current page.north east) rectangle ([xshift=-5.2cm]current page.south east);
%------ 横条纹
\fill[themecolor!30] ([yshift=-4cm]current page.north west) rectangle ([yshift=-9cm]current page.north east);
%------ 致谢
\node[below] at ([xshift=-13cm,yshift=-10cm] current page.north east) {
  \ifdefempty{\Book@Summary}{}{
  \begin{tcolorbox}[
  enhanced jigsaw,colframe=themecolor!70,interior hidden,
  breakable,before skip=10pt,after skip=10pt,text width=10cm
  ]
    \Book@Summary
  \end{tcolorbox}}
};
%------ 编辑与封面设计
\node[right] at ([xshift=1.5cm,yshift=-2.5cm]current page.north west) {\large\itshape 封面设计：\makebox[3em][s]{\large\itshape\Book@Designer}};
\node[right] at ([xshift=1.5cm,yshift=-3cm]current page.north west) {\large\itshape 责任编辑：\makebox[3em][s]{\large\itshape\Book@Editor}};
%------ ISBN条码及定价
\node at ([xshift=4cm,yshift=4cm]current page.south west){\expandafter\drawbarcode\expandafter{\Book@ISBN}};%978-80-7340-097-2
\node at ([xshift=4cm,yshift=1.8cm]current page.south west){\sffamily\Large 定价：\Book@Price 元};
\end{tikzpicture}
%----- 避免多次使用，执行一次后就更改定义。
\global\let\makebackcover\relax
}

\RequirePackage{printlen}
\uselengthunit{mm}
\def\makeflypage{
  \begin{titlepage}
    \thispagestyle{empty}
    \vspace*{\stretch{1}}
    \begin{center}
    {\huge\bfseries\@title}\\
    \vspace{2cm}
    {\LARGE\itshape\makebox[3em][s]{\LARGE\itshape\@author}\hspace{0.5em}编著}
    \end{center}
    \vspace{\stretch{1.5}}
    \newpage\thispagestyle{empty}

    \begin{flushleft}
       {\zihao{5}\heiti 图书在版编目（CIP）数据}

      {\zihao{5} \@title /\@author 编著.---\Book@Edition ---北京：\Book@Publisher，\the\year.\the\month

      \bigskip
      ISBN \Book@ISBN

      \bigskip

      \ROMAN{1}. \textsc{0811}$\cdots$\hspace*{10.5bp} \ROMAN{2}.\@author$\cdots$\hspace*{10.5bp} \ROMAN{3}. 书籍---模板---\LaTeX{Studio}\hspace*{10.5bp} \ROMAN{4}.I213

      \bigskip
      中国版本图书馆CIP数据核字(\the\year)第 666666 号
      }
    \end{flushleft}
    \vfill
    \begin{center}
      {\large\sffamily \@title}\\
      {\itshape\normalsize \makebox[3em][s]{\itshape\@author}\hspace{0.5em}编著}\\[5pt]
      \makebox[2cm][s]{$\ast$ $\ast$ $\ast$}\\[8pt]
      {\Large\KeSong\KeSongf\Book@Publisher}\\[-2pt]
      {\normalsize\texttt{\Book@Website}}\\
      {\normalsize\texttt{\Book@Email}}\\
      {\footnotesize {\heiti 开本}：\rndprintlength{\paperwidth}$\times$\rndprintlength{\paperheight} \hspace{0.5em} {\heiti 字数}：\Book@Words}\\[0pt]
      \ifdefempty{\Book@Edition}{}{{\small \the\year 年\the\month 月 第 \Book@Edition\ 版~第 1 次印刷}\\[-5pt]}
      {\small {\heiti 印数}：001 $\sim$ 100 册 \hspace*{0.5em} {\heiti 定价}：\Book@Price 元}\\[5pt]
      \hrule
      \vskip5pt
      {\small 本书如有缺页、倒页、脱页，请自行处理一下}
    \end{center}
  \end{titlepage}
  \ifdefempty{\Book@ExtraPage}{}{
    \pagestyle{empty}
    \ifodd
      \c@page
    \else
      \thispagestyle{empty}
      \mbox{}
      \newpage
    \fi
    \Book@ExtraPage
  }
  \ifdefempty{\Book@Preface}{}{{
    \pagestyle{empty}
    \clearpage
    \ifodd
      \c@page
    \else
      \thispagestyle{empty}
      \mbox{}
      \newpage
    \fi
    \kaishu
    \vspace*{1cm}
    {\centerline{\Large \heiti 前 \quad 言}}

    \vspace*{1cm}

    \Book@Preface

    \vspace*{2cm}

    \begin{flushright}
      \ifdefempty{\Book@Writer}{\@author}{\Book@Writer}

      \the\year 年 \the\month 月
    \end{flushright}
    \clearpage
    \pagestyle{fancy}
  }}
}

\renewcommand{\cleardoublepage}{
  \clearpage
  \if@twoside
    \ifodd
      \c@page
    \else
      \if@openright
        \thispagestyle{empty}
        \mbox{}
        \newpage
        \if@twocolumn
          \mbox{}\newpage
        \fi
      \fi
    \fi
  \fi
}

% 图表标题
\renewcommand \thefigure
  {\ifnum \c@chapter>\z@ \thechapter-\fi \@arabic\c@figure}
\DeclareCaptionFont{song}{\songti}
% \DeclareCaptionFont{minusfour}{small}
\captionsetup[figure]{%
  format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
  labelsep=quad, % 分隔符是一个空格
  font={song,small}, % 图的字体, 宋体小四
  position=bottom % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}
\captionsetup[table]{%
  format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
  labelsep=quad, % 分隔符是一个空格
  font={song,small}, % 表的字体, 宋体小四
  position=top % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}

\def\equationautorefname~#1\null{式(#1)\null~}%
\def\footnoteautorefname{脚注}%
\def\itemautorefname~#1\null{第#1项\null}%
\def\figureautorefname~#1\null{图#1\null~}%
\def\tableautorefname~#1\null{表#1\null~}%
\def\partautorefname~#1\null{第#1部分\null}%
\def\appendixautorefname{附录}%
\def\chapterautorefname~#1\null{第#1章\null}%
\def\sectionautorefname~#1\null{第#1节\null}%
\def\subsectionautorefname~#1\null{第#1小节\null}%
\def\subsubsectionautorefname~#1\null{第#1小小节\null}%
\def\paragraphautorefname~#1\null{第#1段\null}%
\def\subparagraphautorefname~#1\null{第#1小段\null}%
\def\theoremautorefname{定理}%
% \def\pageautorefname~#1\null{第~#1~页\null}%
\def\HyRef@autopageref#1{%
  \hyperref[{#1}]{第~\pageref*{#1} 页}%
}

\newcommand{\answer}[1]{
  \begin{ocg}{}{Exam\thesection\theMyExample}{\theanswer}
    #1
  \end{ocg}
  % \ifBookanswer{#1}\else\hphantom{#1}\fi
}
\newcommand{\fillin}[1]{
  \underline{
    \begin{ocg}{}{Exam\thesection\theMyExample}{\theanswer}
      #1
    \end{ocg}
    % \hspace{1em}\answer{#1}\hspace{1em}
  }
}
\newcommand{\pickout}[1]{
  \hfill(\makebox[2em]{\answer{#1}})
}
\newcommand{\pickin}[1]{
  (\makebox[2em]{\answer{#1}})
}

\newcommand{\ignorepars}{\@ifnextchar\par{\expandafter\ignorepars\@gobble}{}}

\newcounter{answer}

\newcounter{MyExample}[section]
\newenvironment{MyExample}[1][]{%
 \stepcounter{MyExample}%
  \ifstrempty{#1}%
  {\mdfsetup{%
    frametitle={%
       \tikz[baseline=(current bounding box.east),outer sep=0pt]
        \node[anchor=east,rectangle,fill=blue!20]{
        \ifBookanswer
          \switchocg{Exam\thesection\theMyExample}{\strut \heiti 例\thesection-\theMyExample}
        \else
          \strut \heiti 例\thesection-\theMyExample
        \fi
        };
      }
    }
  }%
  {\mdfsetup{%
     frametitle={%
       \tikz[baseline=(current bounding box.east),outer sep=0pt]
        \node[anchor=east,rectangle,fill=blue!20]{
        \ifBookanswer
          \switchocg{Exam\thesection\theMyExample}{\strut \heiti 例\thesection-\theMyExample~(\ignorespaces~#1)}
        \else
          \strut \heiti 例\thesection-\theMyExample~(\ignorespaces~#1)
        \fi
        };
      }
    }%
   }%
   \mdfsetup{innertopmargin=10pt,linecolor=blue!20,%
             linewidth=2pt,topline=true,
             frametitleaboveskip=\dimexpr-\ht\strutbox\relax,}
   \begin{mdframed}[]\relax%
   }{\end{mdframed}}

\newcounter{MyExercise}[section]
\newenvironment{MyExercise}[1][]{%
 \stepcounter{MyExercise}%
  \ifstrempty{#1}%
  {\mdfsetup{%
    frametitle={%
       \tikz[baseline=(current bounding box.east),outer sep=0pt]
        \node[anchor=east,rectangle,fill=blue!20]{
        \ifBookanswer
          \switchocg{Exer\thesection\theMyExercise}{\strut \heiti 习题\thesection-\theMyExercise}
        \else
          \strut \heiti 习题\thesection-\theMyExercise
        \fi
        };
      }
    }
  }%
  {\mdfsetup{%
     frametitle={%
       \tikz[baseline=(current bounding box.east),outer sep=0pt]
        \node[anchor=east,rectangle,fill=blue!20]{
        \ifBookanswer
          \switchocg{Exer\thesection\theMyExercise}{\strut \heiti 习题\thesection-\theMyExercise~(\ignorespaces~#1)}
        \else
          \strut \heiti 习题\thesection-\theMyExercise~(\ignorespaces~#1)
        \fi
        };
      }
    }%
   }%
   \mdfsetup{innertopmargin=10pt,linecolor=blue!20,%
             linewidth=2pt,topline=true,
             frametitleaboveskip=\dimexpr-\ht\strutbox\relax,}
   \begin{mdframed}[]\relax%
   }{\end{mdframed}}


\newlength{\xxla}
\newlength{\xxlb}
\newlength{\xxlc}
\newlength{\xxld}
\newlength{\lhalf}
\newlength{\lquarter}
\newlength{\lmax}

\newcommand{\options}[4]{
  \par
  \settowidth{\xxla}{(A)~#1~~~}
  \settowidth{\xxlb}{(B)~#2~~~}
  \settowidth{\xxlc}{(C)~#3~~~}
  \settowidth{\xxld}{(D)~#4~~~}

  \ifthenelse{\lengthtest{\xxla>\xxlb}}{\setlength{\lmax}{\xxla}}{\setlength{\lmax}{\xxlb}}
  \ifthenelse{\lengthtest{\xxlc>\lmax}}{\setlength{\lmax}{\xxlc}}{}
  \ifthenelse{\lengthtest{\xxld>\lmax}}{\setlength{\lmax}{\xxld}}{}
  \setlength{\lhalf}{0.5\linewidth}
  \setlength{\lquarter}{0.25\linewidth}
  \ifthenelse{\lengthtest{\lmax>\lhalf}}
  {
    \begin{enumerate}[label=(\Alph*),parsep=0ex,itemsep=0ex,leftmargin=2em, topsep=0ex]
      \item #1
      \item #2
      \item #3
      \item #4
    \end{enumerate}
    \ignorepars\ignorespaces
  }
  {
      \ifthenelse{\lengthtest{\lmax>\lquarter}}
      {
        \makebox[\lhalf][l]{(A)~#1~~~}%
        \makebox[\lhalf][l]{(B)~#2~~~}%

        \makebox[\lhalf][l]{(C)~#3~~~}%
        \makebox[\lhalf][l]{(D)~#4~~~}%
        \ignorepars\ignorespaces
      }
      {
        \makebox[\lquarter][l]{(A)~#1~~~}%
        \makebox[\lquarter][l]{(B)~#2~~~}%
        \makebox[\lquarter][l]{(C)~#3~~~}%
        \makebox[\lquarter][l]{(D)~#4~~~}%
        \ignorepars\ignorespaces
      }
  }
}

{
  \theorembodyfont{\normalfont}
  \newtheorem{thm}{定理}[section]
  \newtheorem{defn}{定义}[section]
  {\theoremstyle{nonumberplain}
  \newtheorem{cor}{推论}}
  {\theoremstyle{nonumberplain}
  \theoremsymbol{\mbox{$\Box$}}
  \newtheorem{proof}{证明}}
}

\newcommand{\Example}[4]{
  \begin{MyExample}[#1]
    #2
  \end{MyExample}
  \smallskip
  \ifBookanswer
    \begin{ocg}{}{Exam\thesection\theMyExample}{\theanswer}
      \ifstrempty{#3}{}{%
        {\heiti 答案}\quad #3%
        \ifstrempty{#4}{\hfill\ensuremath{\square}}{}
      }

      \ifstrempty{#4}{}{%
        {\heiti 解析}\quad #4%
        \hfill\ensuremath{\square}
      }
    \end{ocg}
  \else\fi
}
\newcommand{\Exercise}[4]{
  \begin{MyExercise}[#1]
    #2
  \end{MyExercise}
  \smallskip
  \ifBookanswer
    \begin{ocg}{}{Exer\thesection\theMyExercise}{\theanswer}
      \ifstrempty{#3}{}{%
        {\heiti 答案}\quad #3%
        \ifstrempty{#4}{\hfill\ensuremath{\square}}{}
      }

      \ifstrempty{#3}{}{%
        {\heiti 解析}\quad #4%
        \hfill\ensuremath{\square}
      }
    \end{ocg}
  \else\fi
}

\IfFileExists{settings.tex}{\input{settings.tex}}{}

\DeclareMathOperator{\rd}{\mathop{}\!\mathrm{d}}
\DeclareMathOperator{\re}{\operatorname{e}}
\DeclareMathOperator{\sgn}{\operatorname{sgn}}
\DeclareMathOperator{\grad}{\operatorname{grad}}
\DeclareMathOperator{\ri}{\operatorname{i}}
\newcommand{\abs}[1]{\left| #1 \right|}
\renewcommand{\le}{\leqslant}
\renewcommand{\leq}{\leqslant}
\renewcommand{\ge}{\geqslant}
\renewcommand{\geq}{\geqslant}

\newcommand{\underspace}[1]{\underline{\hspace*{#1}}}

\endinput