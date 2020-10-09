\NeedsTeXFormat{LaTeX2e}[2020/02/02]
\ProvidesClass{my-cv}[2020/08/19 - v1.1.0 - CV Latex Class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OPTIONS                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% cvroundpic option (v1.0.0) %%%%%
\newif\if@cvroundpic
\DeclareOption{cvroundpic}{\@cvroundpictrue}

%%%%% cvnorules option (v1.0.0) %%%%%
\newif\if@cvnorules
\DeclareOption{cvnorules}{\@cvnorulestrue}

%%%%% cvsitesatleft option (v1.1.0) %%%%%
\newif\if@cvsitesatleft
\DeclareOption{cvsitesatleft}{\@cvsitesatlefttrue}

%%%%% article class options %%%%%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PACKAGES                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xcolor}
\RequirePackage[margin=2cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{xparse}
\RequirePackage{dashrule}

\usepackage{hyperref}
\usepackage{fontspec}
\usepackage{fontawesome5}
\usepackage{tikz}
\usepackage{enumitem}
\usepackage{etoolbox}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLORS                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%% Default %%%%%%%%%%%%%%%%%%%%%

\colorlet{CVDefaultColor}{black}


%%%%%%%%%%%%%%%%%%%%% Header %%%%%%%%%%%%%%%%%%%%%

\colorlet{CVFirstNameColor}{black}
\colorlet{CVLastNameColor}{black}
\colorlet{CVEmailTextColor}{black}
\colorlet{CVEmailIconColor}{black}
\colorlet{CVPhoneTextColor}{black}
\colorlet{CVPhoneIconColor}{black}
\colorlet{CVSitesTextColor}{black}
\colorlet{CVSitesIconColor}{black}
\colorlet{CVHeaderRuleColor}{black}


%%%%%%%%%%%%%%%%%%%% Body %%%%%%%%%%%%%%%%%%%%%%

%%%%% Sections %%%%%

\colorlet{CVSectionHeaderTitleColor}{black}
\colorlet{CVSectionHeaderSecondaryColor}{black}
\colorlet{CVSectionHeaderRuleColor}{black}

%%%%%% Elements %%%%%%

\colorlet{CVItemMainColor}{black}
\colorlet{CVItemSeparatorColor}{black}
\colorlet{CVItemSecondaryColor}{black}
\colorlet{CVItemCalendarIconColor}{black}
\colorlet{CVItemCalendarTextColor}{black}
\colorlet{CVItemLocationIconColor}{black}
\colorlet{CVItemLocationTextColor}{black}
\colorlet{CVItemRuleDividerColor}{black}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FONTS                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%% Default %%%%%%%%%%%%%%%%%%%%%

\def\CV@BodyFont{\normalsize}
\newcommand\CVBodyFont[1]{
  \def\CV@BodyFont{#1}
}


%%%%%%%%%%%%%%%%%%%%% Header %%%%%%%%%%%%%%%%%%%%%

\def\CV@Header@Main@FirstNameFont{\normalsize}
\newcommand\CVFirstNameFont[1]{
	\def\CV@Header@Main@FirstNameFont{#1}
}

\def\CV@Header@Main@LastNameFont{\normalsize}
\newcommand\CVLastNameFont[1]{
	\def\CV@Header@Main@LastNameFont{#1}
}

\def\CV@Header@Main@Extras@PhoneFont{\normalsize}
\newcommand\CVPhoneFont[1]{
  \def\CV@Header@Main@Extras@PhoneFont{#1}
}

\def\CV@Header@Main@Extras@EmailFont{\normalsize}
\newcommand\CVEmailFont[1]{
	\def\CV@Header@Main@Extras@EmailFont{#1}
}

\def\CV@Header@SitesFont{\normalsize}
\newcommand\CVSitesFont[1]{
	\def\CV@Header@SitesFont{#1}
}


%%%%%%%%%%%%%%%%%%%%%% Body %%%%%%%%%%%%%%%%%%%%%%

%%%%% Sections %%%%%

\def\CV@Body@Section@Header@TitleFont{\normalsize}
\newcommand\CVSectionHeaderTitleFont[1]{
	\def\CV@Body@Section@Header@TitleFont{#1}
}

\def\CV@Body@Section@Header@SecondaryFont{\normalsize}
\newcommand\CVSectionHeaderSecondaryFont[1]{
	\def\CV@Body@Section@Header@SecondaryFont{#1}
}


%%%%%% Items %%%%%%

\def\CV@Body@Section@Item@MainFont{\normalsize}
\newcommand\CVItemMainFont[1]{
	\def\CV@Body@Section@Item@MainFont{#1}
}

\def\CV@Body@Section@Item@SeparatorFont{\normalsize}
\newcommand\CVItemSeparatorFont[1]{
	\def\CV@Body@Section@Item@SeparatorFont{#1}
}

\def\CV@Body@Section@Item@SecondaryFont{\normalsize}
\newcommand\CVItemSecondaryFont[1]{
	\def\CV@Body@Section@Item@SecondaryFont{#1}
}

\def\CV@Body@Section@Item@TertiaryFont{\normalsize}
\newcommand\CVItemTertiaryFont[1]{
	\def\CV@Body@Section@Item@TertiaryFont{#1}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% header commands                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%% Picture %%%%%%%%%%%%%%%%%%%%%

\def\CV@Header@PictureWidth{0cm}
\def\CV@Header@Picture@RoundedOptions@Scale{1}
\def\CV@Header@Picture@RoundedOptions@XShift{0cm}
\def\CV@Header@Picture@RoundedOptions@YShift{0cm}
\def\CV@Header@Picture@RoundedOptions@Opacity{1}
\def\CV@Header@Picture@RoundedOptions@Border{}
\def\CV@Header@Picture@RoundedOptions@Border@Dashed{}
\def\CV@Header@Picture@RoundedOptions@Border@Double{}
\def\CV@Header@Picture@RoundedOptions@Border@Width{0.4pt}
\def\CV@Header@Picture@RoundedOptions@Border@Color{black}

\newcommand\make@CV@Header@Picture@Rounded{
  \begin{tikzpicture}
    \node [circle, minimum width = \linewidth, \CV@Header@Picture@RoundedOptions@Border,
    \CV@Header@Picture@RoundedOptions@Border@Dashed, color = \CV@Header@Picture@RoundedOptions@Border@Color,
    line width = \CV@Header@Picture@RoundedOptions@Border@Width, \CV@Header@Picture@RoundedOptions@Border@Double,
    opacity = \CV@Header@Picture@RoundedOptions@Opacity, path picture = {
      \node [xshift=\CV@Header@Picture@RoundedOptions@XShift,yshift=\CV@Header@Picture@RoundedOptions@YShift]
      at (path picture bounding box.center) {
        \includegraphics[scale=\CV@Header@Picture@RoundedOptions@Scale]{\CV@Header@Picture}
      };
    }]{};
  \end{tikzpicture}
}

\newcommand\make@CV@Header@Picture@Normal{
  \includegraphics[width=\linewidth]{\CV@Header@Picture}
}

\newcommand\make@CV@Header@Picture{
  \@ifundefined{CV@Header@Picture}{\hspace{\CV@Header@PictureWidth}}{
    \begin{minipage}{\CV@Header@PictureWidth}
      \if@cvroundpic
        \make@CV@Header@Picture@Rounded
      \else
        \make@CV@Header@Picture@Normal
      \fi
    \end{minipage}
  }
}


%%%%%%%%%%%%%%%%%%%%%% Main %%%%%%%%%%%%%%%%%%%%%%

\def\make@CV@Header@Main@FirstName{
  {
    \CV@Header@Main@FirstNameFont
    \color{CVFirstNameColor}
    \MakeUppercase{\CV@Header@Main@FirstName}
  }
}

\def\make@CV@Header@Main@LastName{
  {
    \CV@Header@Main@LastNameFont
    \color{CVLastNameColor}
    \MakeUppercase{\CV@Header@Main@LastName}
  }
}

\def\make@CV@Header@Main@Extras@Phone{
  {
    \CV@Header@Main@Extras@PhoneFont
    \color{CVPhoneIconColor}{\faPhone}
    \hspace{0pt}
    \color{CVPhoneTextColor}{\CV@Header@Main@Phone}
  }
}

\def\make@CV@Header@Main@Extras@Email{
  {
    \CV@Header@Main@Extras@EmailFont
    \color{CVEmailIconColor}{\faEnvelope}
    \hspace{-3pt}
    \color{CVEmailTextColor}{
      \href{mailto:\CV@Header@Main@Email}{\CV@Header@Main@Email}
    }
  }
}

\newcommand\make@CV@Header@Main{
  \begin{minipage}{\dimexpr\linewidth - \CV@Header@PictureWidth - \CV@Header@SitesWidth}
    \centering
    \make@CV@Header@Main@FirstName
    \par\medskip
    \make@CV@Header@Main@LastName
    \par\bigskip
    \@ifundefined{make@CV@Header@Main@FirstExtra}{}{
      \make@CV@Header@Main@FirstExtra
      \par\medskip
    }
    \@ifundefined{make@CV@Header@Main@SecondExtra}{}{
      \make@CV@Header@Main@SecondExtra
      \par\medskip
    }
    \smallskip
  \end{minipage}
}


%%%%%%%%%%%%%%%%%%%%% Sites %%%%%%%%%%%%%%%%%%%%%%

\def\CV@Header@SitesWidth{0cm}

\newcommand\CV@Header@Sites@Item[3]{
  \color{CVSitesIconsColor}{#1}
  \hspace{-2pt}
  \color{CVSitesTextColor}{\href{#2}{#3}}
  \par
}

\def\CV@Header@Sites@WebPage@URL{https://}
\newcommand\CV@Header@Sites@WebPage[1]{
  \CV@Header@Sites@Item{\faHome}{\CV@Header@Sites@WebPage@URL#1}{#1}
}

\def\CV@Header@Sites@LinkedIn@URL{https://linkedin.com/in/}
\newcommand\CV@Header@Sites@LinkedIn[1]{
  \CV@Header@Sites@Item{\faLinkedin}{\CV@Header@Sites@LinkedIn@URL#1}{#1}
}

\def\CV@Header@Sites@GitHub@URL{https://github.com/}
\newcommand\CV@Header@Sites@GitHub[1]{
  \CV@Header@Sites@Item{\faGithub}{\CV@Header@Sites@GitHub@URL#1}{#1}
}

\def\CV@Header@Sites@Twitter@URL{https://twitter.com/}
\newcommand\CV@Header@Sites@Twitter[1]{
  \CV@Header@Sites@Item{\faTwitter}{\CV@Header@Sites@Twitter@URL#1}{#1}
}

\def\CV@Header@Sites@Orcid@URL{https://orcid.org/}
\newcommand\CV@Header@Sites@Orcid[1]{
  \CV@Header@Sites@Item{\faOrcid}{\CV@Header@Sites@Orcid@URL#1}{#1}
}

\newcommand\make@CV@Header@Sites{
  \@ifundefined{CV@Header@Sites}{\hspace{\CV@Header@SitesWidth}}{
    \begin{minipage}{\CV@Header@SitesWidth}
      \CV@Header@SitesFont
      \CV@Header@Sites
    \end{minipage}
  }
}


%%%%%%%%%%%%%%%%%%%%%% Rule %%%%%%%%%%%%%%%%%%%%%%

\def\CV@Header@Rule@Separation{0ex}
\newcommand\CVHeaderRuleSeparation[1]{
  \def\CV@Header@Rule@Separation{#1}
}

\def\CV@Header@Rule@Width{3pt}
\newcommand\CVHeaderRuleWidth[1]{
  \def\CV@Header@Rule@Width{#1}
}

\newcommand\make@CV@Header@Rule{
  \if@cvnorules
    \relax
  \else
    \\[\CV@Header@Rule@Separation]
    {
      \color{CVHeaderRuleColor}
      \rule{\linewidth}{\CV@Header@Rule@Width}
      \par
    }
  \fi
}


%%%%%%%%%%%%%%%%%%%%% Header %%%%%%%%%%%%%%%%%%%%%

\newcommand\CVHeader{
  \begingroup
  \if@cvsitesatleft
    \make@CV@Header@Sites
  \else
    \make@CV@Header@Picture
  \fi
  \make@CV@Header@Main
  \if@cvsitesatleft
    \make@CV@Header@Picture
  \else
    \make@CV@Header@Sites
  \fi
  \hfill
  \make@CV@Header@Rule
  \bigskip
  \endgroup
}


%%%%%%%%%%%%%%%%%%%% CV Info %%%%%%%%%%%%%%%%%%%%%

\newcommand\CVMainInfo[1]{
  \def\FirstName##1{\def\CV@Header@Main@FirstName{##1}}
  \def\LastName##1{\def\CV@Header@Main@LastName{##1}}
  \def\Phone##1{
    \def\CV@Header@Main@Phone{##1}

    %%% Depending if the macro '\Phone' is used earlier than '\Email', it will
    %%% show first or second.
    \@ifundefined{make@CV@Header@Main@FirstExtra}{
      \def\make@CV@Header@Main@FirstExtra{\make@CV@Header@Main@Extras@Phone}
    }{
      \def\make@CV@Header@Main@SecondExtra{\make@CV@Header@Main@Extras@Phone}
    }
  }
  \def\Email##1{
    \def\CV@Header@Main@Email{##1}

    %%% Same as above.
    \@ifundefined{make@CV@Header@Main@FirstExtra}{
      \def\make@CV@Header@Main@FirstExtra{\make@CV@Header@Main@Extras@Email}
    }{
      \def\make@CV@Header@Main@SecondExtra{\make@CV@Header@Main@Extras@Email}
    }
  }
  #1
  \undef\FirstName
  \undef\LastName
  \undef\Phone
  \undef\Email
}

\newcommand\CVPictureInfo[2][3cm]{
  \def\CV@Header@PictureWidth{#1}
  \def\CV@Header@Picture{#2}
}

\newcommand\CVRoundedPictureInfo[1]{
  \def\Scale##1{\def\CV@Header@Picture@RoundedOptions@Scale{##1}}
  \def\Opacity##1{\def\CV@Header@Picture@RoundedOptions@Opacity{##1}}
  \def\XShift##1{\def\CV@Header@Picture@RoundedOptions@XShift{##1}}
  \def\YShift##1{\def\CV@Header@Picture@RoundedOptions@YShift{##1}}
  #1
  \undef\Scale
  \undef\Opacity
  \undef\XShift
  \undef\YShift
}

\newcommand\CVRoundedPictureBorderInfo[1][]{
  \def\CV@Header@Picture@RoundedOptions@Border{draw}
  \def\Dashed{\def\CV@Header@Picture@RoundedOptions@Border@Dashed{dashed}}
  \def\Double{\def\CV@Header@Picture@RoundedOptions@Border@Double{double}}
  \def\Width##1{\def\CV@Header@Picture@RoundedOptions@Border@Width{##1}}
  \def\Color##1{\def\CV@Header@Picture@RoundedOptions@Border@Color{##1}}
  #1
  \undef\Dashed
  \undef\Double
  \undef\Width
  \undef\Color
}

\newcommand\CVSitesInfo[2][4cm]{
  \def\WebPage##1{\CV@Header@Sites@WebPage{##1}}
  \def\LinkedIn##1{\CV@Header@Sites@LinkedIn{##1}}
  \def\GitHub##1{\CV@Header@Sites@GitHub{##1}}
  \def\Twitter##1{\CV@Header@Sites@Twitter{##1}}
  \def\Orcid##1{\CV@Header@Sites@Orcid{##1}}

  \def\CV@Header@SitesWidth{#1}
  \def\CV@Header@SitesAux{
    \def\WebPage####1{\CV@Header@Sites@WebPage{####1}}
    \def\LinkedIn####1{\CV@Header@Sites@LinkedIn{####1}}
    \def\GitHub####1{\CV@Header@Sites@GitHub{####1}}
    \def\Twitter####1{\CV@Header@Sites@Twitter{####1}}
    \def\Orcid####1{\CV@Header@Sites@Orcid{####1}}
    #2
    \undef\WebPage
    \undef\LinkedIn
    \undef\GitHub
    \undef\Twitter
    \undef\Orcid
  }
  \def\CV@Header@Sites{\CV@Header@SitesAux}
  \undef\WebPage
  \undef\LinkedIn
  \undef\GitHub
  \undef\Twitter
  \undef\Orcid
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BODY                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%% Sections %%%%%%%%%%%%%%%%%%%%

\def\CV@Body@Section@Rule@Width{2pt}
\newcommand\CVSectionRuleWidth[1]{
  \def\CV@Body@Section@Rule@Width{#1}
}

\def\CV@Body@Section@ItemsSeparation{1cm}
\newcommand\CVSectionElementsSeparation[1]{
  \def\CV@Body@Section@ItemsSeparation{#1}
}

\def\CV@Body@Section@Rule@Separation{0ex}
\newcommand\CVSectionRuleSeparation[1]{
  \def\CV@Body@Section@Rule@Separation{#1}
}


\newcommand\make@CV@Body@Section@Rule{
  {
    \color{CVSectionHeaderRuleColor}
    \rule{\linewidth}{\CV@Body@Section@Rule@Width}
    \par\medskip
  }
}

\newcommand\make@CV@Body@Section@Title[1]{
  \CV@Body@Section@Header@TitleFont
  \color{CVSectionHeaderTitleColor}
  \MakeUppercase{#1}
}

\newcommand\make@CV@Body@Section@Secondary[1]{
  \CV@Body@Section@Header@SecondaryFont
  \color{CVSectionHeaderSecondaryColor}
  #1
}

\NewDocumentCommand{\CVSection}{
  o
  O{\CV@Body@Section@ItemsSeparation}
  D(){\CV@Body@Section@Rule@Separation}
  m
}{
  \bigskip
  {
    \raggedright
    \IfNoValueTF{#1}{
      \make@CV@Body@Section@Title{#4}
    }{
      \begin{minipage}{#2}
        \make@CV@Body@Section@Secondary{#1}
      \end{minipage}
      \begin{minipage}{\dimexpr\linewidth - #2}
        \make@CV@Body@Section@Title{#4}
      \end{minipage}
    }
  }
  \if@cvnorules
    \medskip
  \else
    \\[#3]
    \make@CV@Body@Section@Rule
  \fi
}


%%%%%%%%%%%%%%%%%%%%% Items %%%%%%%%%%%%%%%%%%%%%%

\def\CV@Body@Section@Item@ItemsSeparation{7pt}
\newcommand\CVItemHeaderSeparation[1]{
  \def\CV@Body@Section@Item@ItemsSeparation{#1}
}

\def\CV@Body@Section@Item@ItemsSeparator{--}
\newcommand\CVItemHeaderSeparator[1]{
  \def\CV@Body@Section@Item@ItemsSeparator{#1}
}

\newcommand\make@CV@Body@Section@Item@Main[1]{
  {
    \CV@Body@Section@Item@MainFont
    \color{CVItemMainColor}
    #1
  }
}

\newcommand\make@CV@Body@Section@Item@Separator[2]{
  \hspace{#1}
  {
    \CV@Body@Section@Item@SeparatorFont
    \color{CVItemSeparatorColor}
    #2
  }
  \hspace{#1}
}

\newcommand\make@CV@Body@Section@Item@Secondary[1]{
  {
    \CV@Body@Section@Item@SecondaryFont
    \color{CVItemSecondaryColor}
    #1
  }
}

\newcommand\make@CV@Body@Section@Item@Calendar[1]{
  \makebox[0.45\linewidth][l]{
    {
      \color{CVItemCalendarIconColor}
      \faCalendar*[regular]
    }
    \hspace{-1.5pt}
    \CV@Body@Section@Item@TertiaryFont
    \color{CVItemCalendarTextColor}
    #1
  }
}

\newcommand\make@CV@Body@Section@Item@Location[1]{
  \makebox[0.45\linewidth][l]{
    {
      \color{CVItemLocationIconColor}
      \faMapMarker*
    }
    \hspace{-1.5pt}
    \CV@Body@Section@Item@TertiaryFont
    \color{CVItemLocationTextColor}
    #1
  }
}

\NewDocumentCommand\CVItem{
  O{\CV@Body@Section@Item@ItemsSeparation}
  m
  O{\CV@Body@Section@Item@ItemsSeparator}
  m
  o
  d()
}{
  \medskip
  \make@CV@Body@Section@Item@Main{#2}
  \make@CV@Body@Section@Item@Separator{#1}{#3}
  \make@CV@Body@Section@Item@Secondary{#4}
  \par\medskip
  \IfNoValueF{#5}{
  	\make@CV@Body@Section@Item@Calendar{#5}
  }
  \IfNoValueF{#6}{
    \make@CV@Body@Section@Item@Location{#6}
  }
  \par\medskip
}


%%%%% Item Rule Divider %%%%%

\def\CVBody@Section@Item@RuleDivider@Width{0.75pt}
\newcommand\CVItemDividerWidth[1]{
  \def\CVBody@Section@Item@RuleDivider@Width{#1}
}

\NewDocumentCommand\CVItemDivider{
  O{\CVBody@Section@Item@RuleDivider@Width}
}{
  {
    \color{CVItemRuleDividerColor}
    \rule{0.95\linewidth}{#1}
  }
  \par
}


%%%%%%%%%%%%%%% List environments %%%%%%%%%%%%%%%%

\def\CV@Itemize@Bullet{
  \small
  \textbullet
}
\newcommand\CVItemizeBullet[1]{
  \def\CV@Itemize@Bullet{#1}
}

\setlist{
  labelsep=0.5em,
  nosep,
  itemsep=0.25\baselineskip,
  before=\vspace{0.25\baselineskip},
  after=\vspace{0.25\baselineskip}
}

\setlist[itemize]{label=\CV@Itemize@Bullet}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DEFAULT                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{
  \pagestyle{empty}
  \color{CVBodyColor}
  \CV@BodyFont
}
