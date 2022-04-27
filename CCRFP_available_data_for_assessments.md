---
title: "California Collaborative Fisheries Research Program"
subtitle: "Data availability for stock assessments"
author: "Melissa H. Monk"
date: "April 26, 2022"
output:
  bookdown::pdf_document2: 
    keep_tex: true
    keep_md: true
toc: false
header-includes:
  - \usepackage{booktabs}
  - \usepackage{longtable}
  - \usepackage{array}
  - \usepackage{multirow}
  - \usepackage{wrapfig}
  - \usepackage{float}
  - \usepackage{colortbl}
  - \usepackage{pdflscape}
  - \usepackage{tabu}
  - \usepackage{threeparttable}
  - \usepackage[normalem]{ulem}
  - \usepackage{makecell}
  - \usepackage{xcolor}
  - \usepackage{placeins}
always_allow_html: true
---








# CCFRP Background
The California Collaborative Fisheries Research Program, 
[CCFRP](https://www.mlml.calstate.edu/ccfrp/), 
is a fishery-independent hook-and-line survey designed to monitor nearshore fish 
populations at a series of sampling 
locations both inside and adjacent to California's netowrk of Marine Protect Areas
(MPAs) [@Wendt2009; @Starr2015].  The CCFRP survey began in 2007 in collaboration 
with NMFS scientists and the fishing community.  The core area of the survey includes 
A&ntilde;o Nuevo and Point Lobos sampled by San Jose State University Moss Landing 
Marine Labs (MLML), and Point Buchon and Piedras Blancas by California Polytechnic University 
San Luis Obispo (Cal Poly). In 2017, CCFRP expanded coastwide within California, expanding 
to include four additional partners, Cal Poly Humboldt (CPH; formerly Humboldt State 
University), University of California Davis' Bodega Marine Lab (BML), University 
of California Santa Barbara (UCSB) and Scripps Institute of Oceanography (SIO), and 
xxxx monitored MPA/reference area pairs (Table xx). Cal Poly Humboldt samples the 
furthest north sites, which are still south of Cape Mendocino.  There are three 
nearshore State Marine Conservation Areas (SMCAs) north of the South Cap Mendocino 
State Marine Reserve (SMR) that is monitored. However, xxxxx

Insert a table of which universities monitor which MPAs.  Insert a maps of the 
MPAs with the cells. 


The CCFRP survey design is consistent across all partners. Each MPA and reference 
area consists of a number 500 x 500 m cells. The survey is restricted to xxxx feet 
to reduce potential effects of barotrauma since the survey was designed as a capture 
and release survey, with a sub-study tag/recapture program. On any given survey day site cells 
are randomly selected within a stratum (MPA and/or reference cells).  Commercial 
passenger fishing vessels (CPFVs) are chartered for the survey and the captain 
is allowed to search within the cell for a fishing location.  During a sampling 
event, each cell is fished for a total of 30-45 minutes by volunteer anglers. Volunteer 
anglers are allowed to reel up their lines when they believe they've hooked fish, 
re-bait and continue fishing until the the drop is complete. Each fish encountered 
can be linked back to an angler. Each anglers fishes one line, with two hooks. 
The jig and bait type may differ.....

All fish encountered are measured to the nearest centimeter (fork length).  
A total of xxxx fish were tagged since 2007, and the majority of fish are 
released or descended to depth. Starting in 2017, at the request of NMFS, some 
fish are retained to collect otoliths and fin clips that provide needed 
biological information for nearshore species.  In 2022, the goal will be to collect 
50-100 otoliths for commonly enountered species for use in the 2023 stock assessments.

Due to the nature of the fishery in northern California, Humboldt conducts sampling aboard 6-pack 
vessels, and therefore has fewer total angler hours per year compared to the 
other regions ().  The COVID-19 pandemic also affect the survey effort, but all 
partners were able to conduct sampling in 2000 and 2001.  

Tables of the number of positive drops of a species by university partner,
inside and outside the MPA

The number of otoliths collected by university partner and year


![(\#fig:fig-mpa-map)Map of the State Marine Reserves (SMRs) monitored by the CCFRP program.](MPA_map.pdf) 



# Available Samples

From 2007-2021 a total of 698 fishing trips 
were taken, consisting of 9634 fishing drops. When the CCFRP 
expanded in 2017, some MPAs/sites were fished in only one or two years during an 
exploratory phase.  These included Laguna Beach, the southeast Farallon Islands, 
Point Conception and Trinidad, which were excluded from this summary since we 
would not include them in a stock assessment. 
Fishing drops that drifted outside a cell were also excluded.  These site filter 
result in an available 7910. The final filter removed 
drifts within a cell that were not fished for at least ten minutes within a sampling 
occasion, resulting in a total of 7889 fishing 
drops available for analyses for stock assessments.

Cal Poly Humboldt (formerly Humboldt State University) does not collect depth 
information at each fishing drop.  Depths 
were interpreted from the California Seafloor Mapping Project (CSMP) 2 m bathymetry 
for the start and end locations of each fishing drop. There were also xx fishing 
drops with missing depth data that were added based on the bathymetry.

\begin{table}

\caption{(\#tab:monitoring)Monitoring groups and the associated MPAs they sample. The shorthand names will be 
  used throughout most of the tables in this document}
\centering
\begin{tabular}[t]{lll}
\toprule
Monitoring Group & Shorthand Name & MPA\\
\midrule
\cellcolor{gray!6}{Cal Poly Humboldt} & \cellcolor{gray!6}{Humboldt} & \cellcolor{gray!6}{South Cape Mendocino}\\
Cal Poly Humboldt & Humboldt & Ten Mile\\
\cellcolor{gray!6}{Bodega Marine Lab} & \cellcolor{gray!6}{Bodega} & \cellcolor{gray!6}{Stewarts Point}\\
Bodega Marine Lab & Bodega & Bodega Head\\
\cellcolor{gray!6}{Moss Landing Marine Lab} & \cellcolor{gray!6}{Moss Landing} & \cellcolor{gray!6}{Año Nuevo}\\
\addlinespace
Moss Landing Marine Lab & Moss Landing & Point Lobos\\
\cellcolor{gray!6}{Cal Poly SLO} & \cellcolor{gray!6}{Cal Poly} & \cellcolor{gray!6}{Piedras Blancas}\\
Cal Poly SLO & Cal Poly & Point Buchon\\
\cellcolor{gray!6}{UC Santa Barbara} & \cellcolor{gray!6}{UCSB} & \cellcolor{gray!6}{Carrington Point}\\
UC Santa Barbara & UCSB & Anacapa Island\\
\addlinespace
\cellcolor{gray!6}{Scripps Institute Ocean.} & \cellcolor{gray!6}{Scripps} & \cellcolor{gray!6}{Swamis}\\
Scripps Institute Ocean. & Scripps & South La Jolla\\
\bottomrule
\end{tabular}
\end{table}

\newpage

\begin{table}

\caption{(\#tab:anghrs)Total angler hours by institution summed across all active years.}
\centering
\begin{tabular}[t]{r>{\raggedleft\arraybackslash}p{6em}>{\raggedleft\arraybackslash}p{6em}>{\raggedleft\arraybackslash}p{6em}>{\raggedleft\arraybackslash}p{6em}>{\raggedleft\arraybackslash}p{6em}>{\raggedleft\arraybackslash}p{6em}}
\toprule
YEAR & Humboldt & Bodega & Moss Landing & Cal Poly & UCSB & Scripps\\
\midrule
\cellcolor{gray!6}{2007} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{450} & \cellcolor{gray!6}{277} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{0}\\
2008 & 0 & 0 & 639 & 455 & 0 & 0\\
\cellcolor{gray!6}{2009} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{343} & \cellcolor{gray!6}{339} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{0}\\
2010 & 0 & 0 & 406 & 440 & 0 & 0\\
\cellcolor{gray!6}{2011} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{459} & \cellcolor{gray!6}{393} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{0}\\
\addlinespace
2012 & 0 & 0 & 526 & 422 & 0 & 0\\
\cellcolor{gray!6}{2013} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{484} & \cellcolor{gray!6}{376} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{0}\\
2014 & 0 & 0 & 522 & 473 & 0 & 0\\
\cellcolor{gray!6}{2015} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{264} & \cellcolor{gray!6}{272} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{0}\\
2016 & 0 & 0 & 524 & 532 & 0 & 0\\
\addlinespace
\cellcolor{gray!6}{2017} & \cellcolor{gray!6}{157} & \cellcolor{gray!6}{92} & \cellcolor{gray!6}{383} & \cellcolor{gray!6}{507} & \cellcolor{gray!6}{137} & \cellcolor{gray!6}{127}\\
2018 & 136 & 353 & 330 & 373 & 230 & 186\\
\cellcolor{gray!6}{2019} & \cellcolor{gray!6}{132} & \cellcolor{gray!6}{403} & \cellcolor{gray!6}{365} & \cellcolor{gray!6}{340} & \cellcolor{gray!6}{222} & \cellcolor{gray!6}{240}\\
2020 & 103 & 143 & 198 & 222 & 227 & 105\\
\cellcolor{gray!6}{2021} & \cellcolor{gray!6}{127} & \cellcolor{gray!6}{219} & \cellcolor{gray!6}{305} & \cellcolor{gray!6}{246} & \cellcolor{gray!6}{271} & \cellcolor{gray!6}{109}\\
\bottomrule
\end{tabular}
\end{table}




\begin{landscape}\begin{table}

\caption{(\#tab:fishingdrops)Total number of fishing drops by year at each monitored site in the reference areas and inside the MPAs, in parentheses.}
\centering
\begin{tabular}[t]{r>{\raggedright\arraybackslash}p{1.7cm}>{\raggedright\arraybackslash}p{1.5cm}>{\raggedright\arraybackslash}p{1.5cm}>{\raggedright\arraybackslash}p{1.5cm}>{\raggedright\arraybackslash}p{1.5cm}>{\raggedright\arraybackslash}p{1.5cm}>{\raggedright\arraybackslash}p{1.5cm}>{\raggedright\arraybackslash}p{1.5cm}>{\raggedright\arraybackslash}p{1.5cm}>{\raggedright\arraybackslash}p{1.5cm}>{\raggedright\arraybackslash}p{1.5cm}l}
\toprule
\multicolumn{1}{c}{ } & \multicolumn{2}{c}{Cal Poly Humboldt} & \multicolumn{2}{c}{Bodega Marine Lab} & \multicolumn{2}{c}{Moss Landing} & \multicolumn{2}{c}{Cal Poly SLO} & \multicolumn{2}{c}{UC Santa Barbara} & \multicolumn{2}{c}{Scripps} \\
\cmidrule(l{3pt}r{3pt}){2-3} \cmidrule(l{3pt}r{3pt}){4-5} \cmidrule(l{3pt}r{3pt}){6-7} \cmidrule(l{3pt}r{3pt}){8-9} \cmidrule(l{3pt}r{3pt}){10-11} \cmidrule(l{3pt}r{3pt}){12-13}
YEAR & South Cape Mendocino & Ten Mile & Stewarts Point & Bodega Head & Año Nuevo & Point Lobos & Piedras Blancas & Point Buchon & Carrington Point & Anacapa Island & Swamis & South La Jolla\\
\midrule
\cellcolor{gray!6}{2007} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{125(72)} & \cellcolor{gray!6}{70(93)} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{64(71)} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2008 & - & - & - & - & 90(101) & 74(82) & 30(45) & 62(65) & - & - & - & -\\
\cellcolor{gray!6}{2009} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{78(45)} & \cellcolor{gray!6}{38(45)} & \cellcolor{gray!6}{38(35)} & \cellcolor{gray!6}{46(40)} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2010 & - & - & - & - & 76(80) & 45(48) & 44(39) & 44(46) & - & - & - & -\\
\cellcolor{gray!6}{2011} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{54(58)} & \cellcolor{gray!6}{40(49)} & \cellcolor{gray!6}{42(36)} & \cellcolor{gray!6}{44(42)} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
\addlinespace
2012 & - & - & - & - & 63(62) & 50(48) & 40(39) & 45(43) & - & - & - & -\\
\cellcolor{gray!6}{2013} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{66(71)} & \cellcolor{gray!6}{58(53)} & \cellcolor{gray!6}{41(38)} & \cellcolor{gray!6}{40(52)} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2014 & - & - & - & - & 66(77) & 57(55) & 46(46) & 50(44) & - & - & - & -\\
\cellcolor{gray!6}{2015} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{37(39)} & \cellcolor{gray!6}{24(27)} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{49(49)} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2016 & - & - & - & - & 66(57) & 47(50) & 47(57) & 48(49) & - & - & - & -\\
\addlinespace
\cellcolor{gray!6}{2017} & \cellcolor{gray!6}{38(34)} & \cellcolor{gray!6}{44(43)} & \cellcolor{gray!6}{13(9)} & \cellcolor{gray!6}{15(14)} & \cellcolor{gray!6}{59(48)} & \cellcolor{gray!6}{35(37)} & \cellcolor{gray!6}{44(46)} & \cellcolor{gray!6}{48(48)} & \cellcolor{gray!6}{17(17)} & \cellcolor{gray!6}{14(7)} & \cellcolor{gray!6}{9(7)} & \cellcolor{gray!6}{10(21)}\\
2018 & 36(33) & 34(35) & 47(54) & 36(34) & 54(50) & 31(34) & 34(35) & 36(34) & 29(26) & 21(16) & 16(6) & 22(28)\\
\cellcolor{gray!6}{2019} & \cellcolor{gray!6}{34(35)} & \cellcolor{gray!6}{32(36)} & \cellcolor{gray!6}{50(60)} & \cellcolor{gray!6}{41(40)} & \cellcolor{gray!6}{47(46)} & \cellcolor{gray!6}{35(38)} & \cellcolor{gray!6}{34(32)} & \cellcolor{gray!6}{36(39)} & \cellcolor{gray!6}{25(27)} & \cellcolor{gray!6}{19(12)} & \cellcolor{gray!6}{12(13)} & \cellcolor{gray!6}{24(23)}\\
2020 & 30(36) & 34(35) & 26(46) & 43(39) & 59(51) & 34(44) & 35(30) & 35(35) & 36(36) & 23(11) & 9(10) & 26(33)\\
\cellcolor{gray!6}{2021} & \cellcolor{gray!6}{37(35)} & \cellcolor{gray!6}{35(33)} & \cellcolor{gray!6}{28(41)} & \cellcolor{gray!6}{38(31)} & \cellcolor{gray!6}{51(46)} & \cellcolor{gray!6}{38(41)} & \cellcolor{gray!6}{32(36)} & \cellcolor{gray!6}{33(35)} & \cellcolor{gray!6}{31(35)} & \cellcolor{gray!6}{20(12)} & \cellcolor{gray!6}{6(8)} & \cellcolor{gray!6}{23(28)}\\
\bottomrule
\end{tabular}
\end{table}
\end{landscape}

\FloatBarrier
\newpage


# Species information

We explored data availability for candidate species for the 2023 stock assessment 
cycle as well as for any other species within the top 30 rockfish species in the 
Stock Assessment Prioritiziation spreadsheet provided by the NWFSC. Only one rockfish 
species within the top 30 species was never observed by observed by CCFRP, . 
Data summaries are presented for the other 13 species.

Species without a positive identification, e.g., blue and deacon rockfish or 
yellowtail and olive rockfish, were excluded.


\begin{table}

\caption{(\#tab:totalfishbygroup)Total number of fish encountered by each monitoring group.}
\centering
\begin{tabular}[t]{lrrrrrr}
\toprule
Common.Name & Humboldt & Bodega & Moss Landing & Cal Poly & UCSB & Scripps\\
\midrule
\cellcolor{gray!6}{Black Rockfish} & \cellcolor{gray!6}{1296} & \cellcolor{gray!6}{1488} & \cellcolor{gray!6}{13272} & \cellcolor{gray!6}{1744} & \cellcolor{gray!6}{2} & \cellcolor{gray!6}{0}\\
Blue Rockfish & 774 & 5112 & 32437 & 28979 & 1899 & 10\\
\cellcolor{gray!6}{Brown Rockfish} & \cellcolor{gray!6}{15} & \cellcolor{gray!6}{749} & \cellcolor{gray!6}{563} & \cellcolor{gray!6}{228} & \cellcolor{gray!6}{25} & \cellcolor{gray!6}{51}\\
Canary Rockfish & 791 & 845 & 970 & 423 & 2 & 0\\
\cellcolor{gray!6}{China Rockfish} & \cellcolor{gray!6}{164} & \cellcolor{gray!6}{495} & \cellcolor{gray!6}{1023} & \cellcolor{gray!6}{112} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{0}\\
\addlinespace
Copper Rockfish & 365 & 509 & 901 & 1008 & 2352 & 46\\
\cellcolor{gray!6}{Deacon Rockfish} & \cellcolor{gray!6}{1003} & \cellcolor{gray!6}{4895} & \cellcolor{gray!6}{2337} & \cellcolor{gray!6}{343} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{0}\\
Grass Rockfish & 0 & 0 & 16 & 1 & 1 & 7\\
\cellcolor{gray!6}{Olive Rockfish} & \cellcolor{gray!6}{111} & \cellcolor{gray!6}{701} & \cellcolor{gray!6}{4411} & \cellcolor{gray!6}{4229} & \cellcolor{gray!6}{63} & \cellcolor{gray!6}{74}\\
Quillback Rockfish & 220 & 39 & 1 & 1 & 0 & 0\\
\addlinespace
\cellcolor{gray!6}{Treefish} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{35} & \cellcolor{gray!6}{197} & \cellcolor{gray!6}{137} & \cellcolor{gray!6}{139}\\
Vermilion Rockfish & 221 & 369 & 1484 & 2723 & 271 & 98\\
\cellcolor{gray!6}{Yellowtail Rockfish} & \cellcolor{gray!6}{482} & \cellcolor{gray!6}{979} & \cellcolor{gray!6}{1828} & \cellcolor{gray!6}{1029} & \cellcolor{gray!6}{6} & \cellcolor{gray!6}{0}\\
\bottomrule
\end{tabular}
\end{table}




\begin{landscape}\begin{table}

\caption{(\#tab:unnamed-chunk-3)Percent of drifts with encounters of Black Rockfish in each at each monitoring location and yerar.}
\centering
\begin{tabular}[t]{r>{\raggedright\arraybackslash}p{1.7cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}l}
\toprule
YEAR & South Cape Mendocino & Ten Mile & Stewarts Point & Bodega Head & Año Nuevo & Point Lobos & Piedras Blancas & Point Buchon & Carrington Point & Anacapa Island & Swamis & South La Jolla\\
\midrule
\cellcolor{gray!6}{2007} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{70\%} & \cellcolor{gray!6}{26\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{34\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2008 & - & - & - & - & 74\% & 24\% & 10\% & 46\% & - & - & - & -\\
\cellcolor{gray!6}{2009} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{78\%} & \cellcolor{gray!6}{10\%} & \cellcolor{gray!6}{2\%} & \cellcolor{gray!6}{30\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2010 & - & - & - & - & 56\% & 6\% & 2\% & 8\% & - & - & - & -\\
\cellcolor{gray!6}{2011} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{74\%} & \cellcolor{gray!6}{18\%} & \cellcolor{gray!6}{8\%} & \cellcolor{gray!6}{38\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
\addlinespace
2012 & - & - & - & - & 82\% & 20\% & 14\% & 58\% & - & - & - & -\\
\cellcolor{gray!6}{2013} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{88\%} & \cellcolor{gray!6}{28\%} & \cellcolor{gray!6}{32\%} & \cellcolor{gray!6}{52\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2014 & - & - & - & - & 84\% & 38\% & 28\% & 50\% & - & - & - & -\\
\cellcolor{gray!6}{2015} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{86\%} & \cellcolor{gray!6}{50\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{40\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2016 & - & - & - & - & 86\% & 36\% & 22\% & 32\% & - & - & - & -\\
\addlinespace
\cellcolor{gray!6}{2017} & \cellcolor{gray!6}{54\%} & \cellcolor{gray!6}{22\%} & \cellcolor{gray!6}{50\%} & \cellcolor{gray!6}{38\%} & \cellcolor{gray!6}{76\%} & \cellcolor{gray!6}{18\%} & \cellcolor{gray!6}{4\%} & \cellcolor{gray!6}{24\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2018 & 46\% & 30\% & 56\% & 12\% & 70\% & 10\% & 2\% & 28\% & - & - & - & -\\
\cellcolor{gray!6}{2019} & \cellcolor{gray!6}{44\%} & \cellcolor{gray!6}{26\%} & \cellcolor{gray!6}{56\%} & \cellcolor{gray!6}{36\%} & \cellcolor{gray!6}{68\%} & \cellcolor{gray!6}{2\%} & \cellcolor{gray!6}{4\%} & \cellcolor{gray!6}{6\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2020 & 44\% & 40\% & 46\% & 48\% & 66\% & - & 4\% & 8\% & - & - & - & -\\
\cellcolor{gray!6}{2021} & \cellcolor{gray!6}{60\%} & \cellcolor{gray!6}{48\%} & \cellcolor{gray!6}{68\%} & \cellcolor{gray!6}{48\%} & \cellcolor{gray!6}{76\%} & \cellcolor{gray!6}{2\%} & \cellcolor{gray!6}{6\%} & \cellcolor{gray!6}{4\%} & \cellcolor{gray!6}{2\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
\bottomrule
\end{tabular}
\end{table}
\end{landscape}


<!-- -->


\begin{landscape}\begin{table}

\caption{(\#tab:unnamed-chunk-3)Percent of drifts with encounters of Copper Rockfish in each at each monitoring location and yerar.}
\centering
\begin{tabular}[t]{r>{\raggedright\arraybackslash}p{1.7cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}l}
\toprule
YEAR & South Cape Mendocino & Ten Mile & Stewarts Point & Bodega Head & Año Nuevo & Point Lobos & Piedras Blancas & Point Buchon & Carrington Point & Anacapa Island & Swamis & South La Jolla\\
\midrule
\cellcolor{gray!6}{2007} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{2\%} & \cellcolor{gray!6}{30\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{6\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2008 & - & - & - & - & 2\% & 16\% & 38\% & 10\% & - & - & - & -\\
\cellcolor{gray!6}{2009} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{2\%} & \cellcolor{gray!6}{30\%} & \cellcolor{gray!6}{54\%} & \cellcolor{gray!6}{4\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2010 & - & - & - & - & 2\% & 22\% & 34\% & 6\% & - & - & - & -\\
\cellcolor{gray!6}{2011} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{6\%} & \cellcolor{gray!6}{30\%} & \cellcolor{gray!6}{38\%} & \cellcolor{gray!6}{2\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
\addlinespace
2012 & - & - & - & - & 8\% & 26\% & 44\% & 6\% & - & - & - & -\\
\cellcolor{gray!6}{2013} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{6\%} & \cellcolor{gray!6}{10\%} & \cellcolor{gray!6}{30\%} & \cellcolor{gray!6}{12\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2014 & - & - & - & - & 6\% & 42\% & 54\% & 6\% & - & - & - & -\\
\cellcolor{gray!6}{2015} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{6\%} & \cellcolor{gray!6}{34\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{10\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2016 & - & - & - & - & 8\% & 46\% & 46\% & 14\% & - & - & - & -\\
\addlinespace
\cellcolor{gray!6}{2017} & \cellcolor{gray!6}{22\%} & \cellcolor{gray!6}{24\%} & \cellcolor{gray!6}{22\%} & \cellcolor{gray!6}{32\%} & \cellcolor{gray!6}{4\%} & \cellcolor{gray!6}{38\%} & \cellcolor{gray!6}{46\%} & \cellcolor{gray!6}{10\%} & \cellcolor{gray!6}{98\%} & \cellcolor{gray!6}{38\%} & \cellcolor{gray!6}{12\%} & \cellcolor{gray!6}{20\%}\\
2018 & 60\% & 24\% & 30\% & 24\% & 8\% & 44\% & 52\% & 22\% & 100\% & 36\% & 4\% & 8\%\\
\cellcolor{gray!6}{2019} & \cellcolor{gray!6}{26\%} & \cellcolor{gray!6}{26\%} & \cellcolor{gray!6}{32\%} & \cellcolor{gray!6}{54\%} & \cellcolor{gray!6}{6\%} & \cellcolor{gray!6}{46\%} & \cellcolor{gray!6}{60\%} & \cellcolor{gray!6}{20\%} & \cellcolor{gray!6}{100\%} & \cellcolor{gray!6}{36\%} & \cellcolor{gray!6}{4\%} & \cellcolor{gray!6}{10\%}\\
2020 & 34\% & 34\% & 28\% & 38\% & 2\% & 44\% & 56\% & 22\% & 98\% & 50\% & - & 10\%\\
\cellcolor{gray!6}{2021} & \cellcolor{gray!6}{42\%} & \cellcolor{gray!6}{24\%} & \cellcolor{gray!6}{42\%} & \cellcolor{gray!6}{42\%} & \cellcolor{gray!6}{10\%} & \cellcolor{gray!6}{52\%} & \cellcolor{gray!6}{52\%} & \cellcolor{gray!6}{18\%} & \cellcolor{gray!6}{94\%} & \cellcolor{gray!6}{50\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{18\%}\\
\bottomrule
\end{tabular}
\end{table}
\end{landscape}


<!-- -->


\begin{landscape}\begin{table}

\caption{(\#tab:unnamed-chunk-3)Percent of drifts with encounters of Quillback Rockfish in each at each monitoring location and yerar.}
\centering
\begin{tabular}[t]{r>{\raggedright\arraybackslash}p{1.7cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}l}
\toprule
YEAR & South Cape Mendocino & Ten Mile & Stewarts Point & Bodega Head & Año Nuevo & Point Lobos & Piedras Blancas & Point Buchon & Carrington Point & Anacapa Island & Swamis & South La Jolla\\
\midrule
\cellcolor{gray!6}{2007} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2008 & - & - & - & - & - & - & - & - & - & - & - & -\\
\cellcolor{gray!6}{2009} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2010 & - & - & - & - & - & - & - & - & - & - & - & -\\
\cellcolor{gray!6}{2011} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
\addlinespace
2012 & - & - & - & - & - & - & - & - & - & - & - & -\\
\cellcolor{gray!6}{2013} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2014 & - & - & - & - & - & - & - & 2\% & - & - & - & -\\
\cellcolor{gray!6}{2015} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{2\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2016 & - & - & - & - & - & - & - & - & - & - & - & -\\
\addlinespace
\cellcolor{gray!6}{2017} & \cellcolor{gray!6}{20\%} & \cellcolor{gray!6}{20\%} & \cellcolor{gray!6}{4\%} & \cellcolor{gray!6}{10\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2018 & 46\% & 24\% & 2\% & 8\% & - & - & - & - & - & - & - & -\\
\cellcolor{gray!6}{2019} & \cellcolor{gray!6}{30\%} & \cellcolor{gray!6}{8\%} & \cellcolor{gray!6}{2\%} & \cellcolor{gray!6}{2\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2020 & 28\% & 14\% & 4\% & 4\% & - & - & - & - & - & - & - & -\\
\cellcolor{gray!6}{2021} & \cellcolor{gray!6}{24\%} & \cellcolor{gray!6}{12\%} & \cellcolor{gray!6}{6\%} & \cellcolor{gray!6}{6\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
\bottomrule
\end{tabular}
\end{table}
\end{landscape}


<!-- -->


\begin{landscape}\begin{table}

\caption{(\#tab:unnamed-chunk-3)Percent of drifts with encounters of Yellowtail Rockfish in each at each monitoring location and yerar.}
\centering
\begin{tabular}[t]{r>{\raggedright\arraybackslash}p{1.7cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}>{\raggedright\arraybackslash}p{1.2cm}l}
\toprule
YEAR & South Cape Mendocino & Ten Mile & Stewarts Point & Bodega Head & Año Nuevo & Point Lobos & Piedras Blancas & Point Buchon & Carrington Point & Anacapa Island & Swamis & South La Jolla\\
\midrule
\cellcolor{gray!6}{2007} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{10\%} & \cellcolor{gray!6}{14\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{26\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2008 & - & - & - & - & 4\% & 10\% & 18\% & 16\% & - & - & - & -\\
\cellcolor{gray!6}{2009} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{16\%} & \cellcolor{gray!6}{26\%} & \cellcolor{gray!6}{20\%} & \cellcolor{gray!6}{26\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2010 & - & - & - & - & 8\% & 16\% & 12\% & 8\% & - & - & - & -\\
\cellcolor{gray!6}{2011} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{14\%} & \cellcolor{gray!6}{38\%} & \cellcolor{gray!6}{8\%} & \cellcolor{gray!6}{10\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
\addlinespace
2012 & - & - & - & - & 10\% & 30\% & 12\% & 20\% & - & - & - & -\\
\cellcolor{gray!6}{2013} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{18\%} & \cellcolor{gray!6}{30\%} & \cellcolor{gray!6}{40\%} & \cellcolor{gray!6}{40\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2014 & - & - & - & - & 20\% & 56\% & 22\% & 18\% & - & - & - & -\\
\cellcolor{gray!6}{2015} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{22\%} & \cellcolor{gray!6}{50\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{30\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2016 & - & - & - & - & 24\% & 30\% & 28\% & 16\% & - & - & - & -\\
\addlinespace
\cellcolor{gray!6}{2017} & \cellcolor{gray!6}{6\%} & \cellcolor{gray!6}{18\%} & \cellcolor{gray!6}{46\%} & \cellcolor{gray!6}{4\%} & \cellcolor{gray!6}{38\%} & \cellcolor{gray!6}{24\%} & \cellcolor{gray!6}{12\%} & \cellcolor{gray!6}{14\%} & \cellcolor{gray!6}{6\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2018 & 18\% & 24\% & 72\% & 14\% & 8\% & 46\% & 14\% & 16\% & - & - & - & -\\
\cellcolor{gray!6}{2019} & \cellcolor{gray!6}{14\%} & \cellcolor{gray!6}{24\%} & \cellcolor{gray!6}{46\%} & \cellcolor{gray!6}{6\%} & \cellcolor{gray!6}{14\%} & \cellcolor{gray!6}{16\%} & \cellcolor{gray!6}{14\%} & \cellcolor{gray!6}{10\%} & \cellcolor{gray!6}{2\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
2020 & 22\% & 46\% & 72\% & 4\% & 22\% & 14\% & 22\% & 10\% & 4\% & - & - & -\\
\cellcolor{gray!6}{2021} & \cellcolor{gray!6}{30\%} & \cellcolor{gray!6}{42\%} & \cellcolor{gray!6}{78\%} & \cellcolor{gray!6}{18\%} & \cellcolor{gray!6}{28\%} & \cellcolor{gray!6}{34\%} & \cellcolor{gray!6}{16\%} & \cellcolor{gray!6}{32\%} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-} & \cellcolor{gray!6}{-}\\
\bottomrule
\end{tabular}
\end{table}
\end{landscape}


<!-- -->


\FloatBarrier


# Length information

The CCFRP measures every fish to the nearest centimeter and distributions of the lengths
inside and outside the MPAs by MPA and species are in Figures xxxx.  Length data were 
filtered to the drifts included in the final data set.


![(\#fig:unnamed-chunk-4-1)Frequency of fork length (cm) for inside each MPA (MPA) and outside at reference areas (REF)](CCRFP_available_data_for_assessments_files/figure-latex/unnamed-chunk-4-1.pdf) 

<!-- -->

![(\#fig:unnamed-chunk-4-2)Frequency of fork length (cm) for inside each MPA (MPA) and outside at reference areas (REF)](CCRFP_available_data_for_assessments_files/figure-latex/unnamed-chunk-4-2.pdf) 

<!-- -->

![(\#fig:unnamed-chunk-4-3)Frequency of fork length (cm) for inside each MPA (MPA) and outside at reference areas (REF)](CCRFP_available_data_for_assessments_files/figure-latex/unnamed-chunk-4-3.pdf) 

<!-- -->

![(\#fig:unnamed-chunk-4-4)Frequency of fork length (cm) for inside each MPA (MPA) and outside at reference areas (REF)](CCRFP_available_data_for_assessments_files/figure-latex/unnamed-chunk-4-4.pdf) 

<!-- -->






\clearpage
\newpage
