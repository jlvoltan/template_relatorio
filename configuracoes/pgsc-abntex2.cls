%%-----------------------------------------------------------------------------
%% The LaTeX Project Public License 
%%-----------------------------------------------------------------------------
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% Further information about abnTeX2 are available on http://www.abntex.net.br/
%%------------------------------------------------------------------------------


% -----------------------------------------------------------------------------
%
% Customização da classe abnTeX2 (http://www.abntex.net.br/) 
%
%------------------------------------------------------------------------------
% Codificação: UTF-8
% LaTeX:  abnTeX2          
% -----------------------------------------------------------------------------


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{configuracoes/pgsc-abntex2}[2022/04/30 v1.0]

% Repassa os parâmetros ao abntex2
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}

\PassOptionsToClass{%
% Opções da classe memoir
    12pt,                     % Tamanho da fonte
    a4paper,                  % Tamanho do papel.
    sumario=abnt-6027-2012,      % Seleciona o sumário  ABNT
% Opções do pacote babel
    brazil,                   % Idioma do documento
}{abntex2}


\ProcessOptions\relax
\LoadClass{abntex2}

\RequirePackage[brazilian, hyperpageref]{backref}       % Produzir índice nas referências
\RequirePackage{makeidx}                                % Produzir índice remissivo de palavras
\RequirePackage{chngcntr}

\RequirePackage{etoolbox}

% -----------------------------------------------------------------------------
% Configurações gerais
% -----------------------------------------------------------------------------

% Retira o espaço extra desnecessário nas frases
\frenchspacing

%TIRAR
%%%\renewcommand{\apendicesname}{Ap\^endices}


% Configurações do pacote backref usado sem a opção hyperpageref de backref
\renewcommand{\backrefpagesname}{Citado na(s) p\'agina(s):~}

% Texto padrão antes do número das páginas
\renewcommand{\backref}{}

% Define as listas de item compactas (sem espaçamento entre os itens)
\setlist{noitemsep, topsep=0pt, parsep=0pt, partopsep=0pt}

% Define os textos da citação
\renewcommand*{\backrefalt}[4]
{%
    \ifcase #1
        Nenhuma cita\c{c}\~ao no texto.
    \or
        Citado na p\'agina #2.
    \else
        Citado #1 vezes nas p\'aginas #2.
    \fi
}

% Define a numeração das equações de forma sequencial
\counterwithout{equation}{chapter}

% -----------------------------------------------------------------------------
% Comandos de dados
% -----------------------------------------------------------------------------
% Comandos de dados - Subodinação do IME
\providecommand{\imprimirsubordinacao}{}
\newcommand{\subordinacao}[1]{\renewcommand{\imprimirsubordinacao}{#1}}


% Comandos de dados - Departamento
\providecommand{\imprimirdepartamento}{}
\newcommand{\departamento}[1]{\renewcommand{\imprimirdepartamento}{#1}}

% Comandos de dados - Programa
\providecommand{\imprimirprograma}{}
\newcommand{\programa}[1]{\renewcommand{\imprimirprograma}{#1}}

% Comandos de dados - Subtítulo do trabalho
\providecommand{\imprimirsubtitulo}{}
\newcommand{\subtitulo}[1]{\renewcommand{\imprimirsubtitulo}{#1}}

% Comandos de dados - Instituição do orientador
\providecommand{\imprimirinstOrientador}{}
\newcommand{\instOrientador}[1]{\renewcommand{\imprimirinstOrientador}{#1}}

% Comandos de dados - Instituição do coorientador
\providecommand{\imprimirinstCoorientador}{}
\newcommand{\instCoorientador}[1]{\renewcommand{\imprimirinstCoorientador}{#1}}

% Comandos de dados -  Tipo de trabalho acadêmico (trabalho de conclusão de curso, tese, dissertação ou projeto de qualificação)
\providecommand{\imprimirprojeto}{}
\newcommand{\projeto}[1]{\renewcommand{\imprimirprojeto}{#1}}

% Comandos de dados - Título Acadêmico a ser alcançado (Bacharel, Tecnólogo)
\providecommand{\imprimirtituloAcademico}{}
\newcommand{\tituloAcademico}[1]{\renewcommand{\imprimirtituloAcademico}{#1}}

% Comandos de dados - Título em Inglês
\providecommand{\imprimirautorcitacao}{}
\newcommand{\autorcitacao}[1]{\renewcommand{\imprimirautorcitacao}{#1}}

% Comandos de dados - Nome autor para citação
\providecommand{\imprimirtitleabstract}{}
\newcommand{\titleabstract}[1]{\renewcommand{\imprimirtitleabstract}{#1}}

% Comandos de dados - Área de concentração com Rótulo
\newcommand{\imprimirareaconcentracaoRotulo}{\'Area de concentra\c{c}\~ao: }
\providecommand{\imprimirareaconcentracao}{}
\newcommand{\areaconcentracao}[1]{\renewcommand{\imprimirareaconcentracao}{#1}}

% Comandos de dados - linha de pesquisa
\newcommand{\imprimirlinhapesquisaRotulo}{Linha de pesquisa: }
\providecommand{\imprimirlinhapesquisa}{}
\newcommand{\linhapesquisa}[1]{\renewcommand{\imprimirlinhapesquisa}{#1}}

% Comandos de dados - Texto da folha de aprovação
\providecommand{\imprimirtextopadraofolhadeaprovacao}{}
\newcommand{\textopadraofolhadeaprovacao}[1]{\renewcommand{\imprimirtextopadraofolhadeaprovacao}{#1}}

% Comandos de dados - Logomarca da instituição
\providecommand{\imprimirlogoinstituicao}{}
\newcommand{\logoinstituicao}[2]{\renewcommand{\imprimirlogoinstituicao}{\includegraphics[width={#1}\textwidth]{#2}}}

% -----------------------------------------------------------------------------
% Estilo de elementos
% -----------------------------------------------------------------------------

% Elementos pré-textuais
\renewcommand{\pretextual}
{%
  %  \pagenumbering{gobble}
  

    \aliaspagestyle{chapter}{empty}
    \pagestyle{empty}
    \aliaspagestyle{cleared}{empty}
    \aliaspagestyle{part}{empty}
}

% Configura layout para elementos textuais
\renewcommand{\textual}
{%
   % \pagenumbering{arabic} % A numeração das páginas é em algarismos arábicos, inciando em 1
    \pagestyle{abntheadings}
    \aliaspagestyle{chapter}{abntchapfirst}
    \nouppercaseheads
    \bookmarksetup{startatroot}
}

% Configura layout para elementos pós-textuais
\renewcommand{\postextual}
{%
    \chapterstyle{abnt}
    % V2.1 Remove Espaço no Sumário para após textuais: Ex.: Apêndices e Anexos
    %\phantompart
}

% -----------------------------------------------------------------------------
% Objetos flutuantes
% -----------------------------------------------------------------------------

% Comando que trata a fonte nos objetos flutuantes
\renewcommand{\fonte}[1]
{%
    \begin{SingleSpacing}\par\end{SingleSpacing}
    \centering\small{Fonte: #1}
}

% Comando que trata as notas nos objetos flutuantes
\renewcommand{\nota}[1]
{%
    \begin{SingleSpacing}\par\end{SingleSpacing}
    \begin{tabular}{l p{.85\textwidth}}%
        Nota: & #1
    \end{tabular}
}

% -----------------------------------------------------------------------------
% Parágrafos
% -----------------------------------------------------------------------------

% Tamanho da indentação do parágrafo
\setlength{\parindent}{1.5cm}

% Espaçamento entre um parágrafo e outro
\setlength{\parskip}{0.0cm}

% -----------------------------------------------------------------------------
% Fontes
% -----------------------------------------------------------------------------

% Redefinição de fontes
\renewcommand{\ABNTEXchapterfont}{\normalfont\bfseries}
\renewcommand{\ABNTEXchapterfontsize}{\normalsize}

\renewcommand{\ABNTEXpartfont}{\normalfont}
\renewcommand{\ABNTEXpartfontsize}{\ABNTEXchapterfontsize}

\renewcommand{\ABNTEXsectionfont}{\normalfont\bfseries}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}



\renewcommand{\ABNTEXsubsubsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}

% -----------------------------------------------------------------------------
% Sumário
% -----------------------------------------------------------------------------

% Travessão no sumário para apêndices e anexos
%\renewcommand{\cftchapteraftersnum}{\hfill\textendash\hfill}

% Insere espaço entre os itens do sumário de diferentes capítulos
\setlength{\cftbeforechapterskip}{1.0em \@plus\p@}

%V 2.1 - Remove negrito do sumário
\renewcommand{\cftsubsectionfont}{\normalfont}
\renewcommand{\cftsubsectionpagefont}{\cftsubsectionfont}

\renewcommand{\cftsubsubsectionfont}{\normalfont}
\renewcommand{\cftsubsubsectionpagefont}{\cftsubsubsectionfont}

%V 2.1 - Altera diminuindo Tamanho Escrita Apêndices e Anexos no Sumário
\renewcommand{\cftpartfont}{\normalfont\bfseries}
\renewcommand{\cftpartpagefont}{\cftpartfont}


% V2.1  tirar Warning Apendice e Anexos: 
\renewcommand{\PRIVATEapendiceconfig}[2]{%
 \setboolean{abntex@apendiceousecao}{true}%
 \renewcommand{\appendixname}{#1}
 \ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{
    % V2.1 trocado linha tirar Warning: Package hyperref Warning: Token not allowed in a PDF string (Unicode): removing `\uppercase' on apendices.tex input line 6.
   %\renewcommand{\appendixtocname}{\uppercase{#2}}
   \renewcommand{\appendixtocname}{\texorpdfstring{\MakeTextUppercase{#2}}{#2}}
   
  }{%
  \renewcommand{\appendixtocname}{#2}} 
 \renewcommand{\appendixpagename}{#2}
 \switchchapname{#1}% Corrected from \switchapname -> \switchchapname
 \renewcommand*{\cftappendixname}{#1 \space}
}


% -----------------------------------------------------------------------------
% Listas
% -----------------------------------------------------------------------------

% Define os títulos das listas
\addto\captionsbrazil{%
% Ajusta nomes padrões do babel
    \renewcommand{\listadesiglasname}{LISTA DE ABREVIATURAS E SIGLAS}
    \renewcommand{\listadesimbolosname}{LISTA DE S\'{I}MBOLOS}
    \renewcommand{\listfigurename}{LISTA DE FIGURAS}
    \renewcommand{\listtablename}{LISTA DE TABELAS}
    \renewcommand{\indexname}{\'{I}NDICE REMISSIVO}
% Ajusta nomes usados com a macro \autoref
    \renewcommand{\pageautorefname}{p\'agina}
    \renewcommand{\sectionautorefname}{Se\c{c}\~ao}
    \renewcommand{\subsectionautorefname}{Subse\c{c}\~ao}
    \renewcommand{\subsubsectionautorefname}{Subsubse\c{c}\~ao}
    \renewcommand{\paragraphautorefname}{Subse\c{c}\~ao}
}

% Cria a lista de quadros
\newcommand{\listofquadrosname}{Lista de Quadros}
\newcommand{\quadroname}{Quadro}
\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}
\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space}
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}

% -----------------------------------------------------------------------------
% Capa
% -----------------------------------------------------------------------------
\makeatletter
\renewcommand{\imprimircapa}{
    \begin{capa}
        \begin{center}
		\begin{SingleSpacing}
		            \large\MakeUppercase{\imprimirsubordinacao} \\
            		\large\MakeUppercase{\imprimirinstituicao} \\
	    		\abntex@ifnotempty{\imprimirdepartamento}
            		{
                		\MakeUppercase{\imprimirdepartamento} \\
            		}
           		\large\MakeUppercase{\imprimirprograma} \\
		\end{SingleSpacing}
        \end{center}
        \vspace{60pt}
	\begin{center}
		\large\MakeUppercase{\imprimirautor}\\
	\end{center}
	\vspace{120pt}
        \begin{center}
            \ABNTEXchapterfont\large\MakeUppercase{\imprimirtitulo}
            \abntex@ifnotempty{\imprimirsubtitulo}
	    {%
                {\ABNTEXchapterfont: }{\large{\imprimirsubtitulo}}
            }
        \end{center}
	\vspace{120pt}
	\begin{center}
		\large\MakeUppercase{\imprimirprojeto}
	\end{center}
	\vfill
        \begin{center}
		\begin{SingleSpacing}
            		\large\MakeUppercase{\imprimirlocal}\\
            		\large\MakeUppercase{\imprimirdata}
		\end{SingleSpacing}
    	\end{center}

    \end{capa}

}
\makeatother

% -----------------------------------------------------------------------------
% Folha de rosto
% -----------------------------------------------------------------------------

% Comando para licença (v2.5)
\providecommand{\imprimirlicencaCC}{}
\newcommand{\licencaCC}[1]{\renewcommand{\imprimirlicencaCC}{%
    \ifthenelse{\equal{#1}{CC-BY}}
    {%
        \begin{center}
            \begin{tabular}{ M{3.2cm} m{12cm} }
                \includegraphics[width=3cm]{./dados/CC-BY.png} \href{https://creativecommons.org/licenses/by/4.0/deed.pt_BR}{4.0 Internacional}  &
                {\small Esta licença permite compartilhamento, remixe, adaptação e criação a partir do trabalho, mesmo para fins comerciais, desde que sejam atribuídos créditos ao(s) autor(es). Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}\\
            \end{tabular}
        \end{center}
    }
    {
        \ifthenelse{\equal{#1}{CC-BY-NC}}
        {
            \begin{center}
                \begin{tabular}{ M{3.2cm} m{12cm} }
                    \includegraphics[width=3cm]{./dados/CC-BY-NC.png} \href{https://creativecommons.org/licenses/by-nc/4.0/deed.pt_BR}{4.0 Internacional}  &
                    {\small Esta licença permite remixe, adaptação e criação a partir do trabalho, para fins não comerciais, desde que sejam atribuídos créditos ao(s) autor(es). Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}\\
                \end{tabular}
            \end{center}
        }
        {
            \ifthenelse{\equal{#1}{CC-BY-NC-ND}}
            {
                \begin{center}
                    \begin{tabular}{ M{3.2cm} m{12cm} }
                        \includegraphics[width=3cm]{./dados/CC-BY-NC-ND.png} \href{https://creativecommons.org/licenses/by-nc-nd/4.0/deed.pt_BR}{4.0 Internacional}  &
                        {\small Esta licença permite download e compartilhamento do trabalho desde que sejam atribuídos créditos ao(s) autor(es), sem a possibilidade de alterá-lo ou utilizá-lo para fins comerciais. Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}\\
                    \end{tabular}
                \end{center}
            }
            {
                \ifthenelse{\equal{#1}{CC-BY-NC-SA}}
                {
                    \begin{center}
                        \begin{tabular}{ M{3.2cm} m{12cm} }
                            \includegraphics[width=3cm]{./dados/CC-BY-NC-SA.png} \href{https://creativecommons.org/licenses/by-nc-sa/4.0/deed.pt_BR}{4.0 Internacional}  &
                            {\small Esta licença permite remixe, adaptação e criação a partir do trabalho, para fins não comerciais, desde que sejam atribuídos créditos ao(s) autor(es) e que licenciem as novas criações sob termos idênticos. Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}\\
                        \end{tabular}
                    \end{center}
                }
                {
                    \ifthenelse{\equal{#1}{CC-BY-ND}}
                    {
                        \begin{center}
                            \begin{tabular}{ M{3.2cm} m{12cm} }
                                \includegraphics[width=3cm]{./dados/CC-BY-ND.png} \href{https://creativecommons.org/licenses/by-nd/4.0/deed.pt_BR}{4.0 Internacional}  &
                                {\small Esta licença permite compartilhamento do trabalho, mesmo para fins comerciais, sem a possibilidade de alterá-lo, desde que sejam atribuídos créditos ao(s) autor(es). Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}\\
                            \end{tabular}
                        \end{center}
                    }
                    {
                        \ifthenelse{\equal{#1}{CC-BY-SA}}
                        {
                            \begin{center}
                                \begin{tabular}{ M{3.2cm} m{12cm} }
                                    \includegraphics[width=3cm]{./dados/CC-BY-SA.png} \href{https://creativecommons.org/licenses/by-sa/4.0/deed.pt_BR}{4.0 Internacional}  &
                                    {\small Esta licença permite remixe, adaptação e criação a partir do trabalho, mesmo para fins comerciais, desde que sejam atribuídos créditos ao(s) autor(es) e que licenciem as novas criações sob termos idênticos. Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}\\
                                \end{tabular}
                            \end{center}
                        }
                        {
                            
                        }
                    }
                }
            }
        }
    }
}}

\makeatletter
\renewcommand{\folhaderostocontent}
{%
    \setcounter{page}{1}
    \begin{center}
        \large\MakeUppercase{\imprimirautor}\\
    \end{center}

    \vspace*{96pt}

    \begin{center}
        \ABNTEXchapterfont\large\MakeUppercase{\imprimirtitulo}
        \abntex@ifnotempty{\imprimirsubtitulo}
	{%
        	{\ABNTEXchapterfont: }{\large{\imprimirsubtitulo}}
        }
    \end{center}

    \vspace*{60pt}

    \abntex@ifnotempty{\imprimirpreambulo}
    {%
        \SingleSpacing
        \begin{tabular}{p{.25\textwidth}p{.13\textwidth}p{.44\textwidth}}
            & \multicolumn{2}{p{.6\textwidth}}{\small\hyphenpenalty=10000{\imprimirpreambulo}} \\ & & \\
            \abntex@ifnotempty{\imprimirareaconcentracao}
            {%
                & \multicolumn{2}{p{.6\textwidth}}{\small\hyphenpenalty=10000{\imprimirareaconcentracaoRotulo\imprimirareaconcentracao}} \\ & & \\
            }
            \abntex@ifnotempty{\imprimirlinhapesquisa}
            {%
                & \multicolumn{2}{p{.6\textwidth}}{\small\hyphenpenalty=10000{\imprimirlinhapesquisaRotulo\imprimirlinhapesquisa}} \\ & & \\
            }
            \abntex@ifnotempty{\imprimirorientador}
            {%
                & \small\imprimirorientadorRotulo & \imprimirorientador \\
               % & & \small\imprimirinstOrientador \\ & & \\
            }
            \abntex@ifnotempty{\imprimircoorientador}
            {%
                & \small\imprimircoorientadorRotulo & \imprimircoorientador \\
               % & & \small\imprimirinstCoorientador
            }
        \end{tabular}
    }

    \vspace*{\fill}

    \begin{center}
	\begin{SingleSpacing}
            \large\MakeUppercase{\imprimirlocal}\\
            \large\MakeUppercase{\imprimirdata}
	\end{SingleSpacing}
    \end{center}
    
    \imprimirlicencaCC
}
\makeatother

