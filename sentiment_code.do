* Purpose: here I create the Stasavage / Democracy paper exhibits
cd "/Users/jz/Dropbox/nyu_politics/data/ESS/data/"

set more off
clear
use "ess1_cleaned.dta"
append using "ess2_cleaned.dta"
append using "ess3_cleaned.dta"
append using "ess4_cleaned.dta"
append using "ess5_cleaned.dta"
append using "ess6_cleaned.dta"
append using "ess7_cleaned.dta"
append using "ess8_cleaned.dta"

egen c_id = group(iso2)

* PANEL CHART
tabstat stfdem [w=dweight] if age_cat==1, by(wave) 
tabstat stfdem [w=dweight] if age_cat==2, by(wave) 
tabstat stfdem [w=dweight] if age_cat==3 | age_cat==4, by(wave) 
tabstat stfdem [w=dweight] if age_cat==5, by(wave) 

eststo clear
eststo: reg democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst govsat [pw=dweight], r
eststo: reg democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst govsat i.c_id i.year [pw=dweight], vce(cluster c_id)
eststo: reg democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst ib2.age_cat govsat i.c_id i.year [pw=dweight], vce(cluster c_id)
eststo: reg democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst agea govsat i.c_id i.year [pw=dweight], vce(cluster c_id)
esttab using "ESS_all.csv", se(%5.3f) b(%5.3f) r2 se label nogaps replace

eststo clear
eststo: reg stfdem income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst ib2.age_cat govsat i.c_id i.year [pw=dweight], vce(cluster c_id)
eststo: reg democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst ib2.age_cat govsat i.c_id i.year [pw=dweight], vce(cluster c_id)
eststo: reg democracySat8 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst ib2.age_cat govsat i.c_id i.year [pw=dweight], vce(cluster c_id)
eststo: reg democracySat9 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst ib2.age_cat govsat i.c_id i.year [pw=dweight], vce(cluster c_id)
eststo: reg democracySat10 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst ib2.age_cat govsat i.c_id i.year [pw=dweight], vce(cluster c_id)
esttab using "ESS_robustness.csv", se(%5.3f) b(%5.3f) r2 se label nogaps replace


* EPCP TABLE
probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female i.c_id [pw=dweight] if year>=2016, vce(cluster c_id)
epcp
probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst i.c_id [pw=dweight] if year>=2016, vce(cluster c_id)
epcp
probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst govsat i.c_id [pw=dweight] if year>=2016, vce(cluster c_id)
epcp
probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst govsat stfeco i.c_id [pw=dweight] if year>=2016, vce(cluster c_id)
epcp
probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst govsat stfeco ib2.age_cat i.c_id [pw=dweight] if year>=2016, vce(cluster c_id)
epcp
probit democracySat7 ib2.age_cat i.c_id [pw=dweight] if year>=2016, vce(cluster c_id)
epcp
probit democracySat7 ib2.age_cat [pw=dweight] if year>=2016, r
epcp
* N 29,483; 35,373

* EPCP TABLE ALL -- this also has year FEs
probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female i.c_id i.year [pw=dweight], vce(cluster c_id)
epcp
probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst i.c_id i.year [pw=dweight], vce(cluster c_id)
epcp
probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst govsat i.c_id i.year [pw=dweight], vce(cluster c_id)
epcp
probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst govsat stfeco i.c_id i.year [pw=dweight], vce(cluster c_id)
epcp
probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst govsat stfeco ib2.age_cat i.c_id i.year [pw=dweight], vce(cluster c_id)
epcp
probit democracySat7 ib2.age_cat i.c_id i.year[pw=dweight], vce(cluster c_id)
epcp
probit democracySat7 ib2.age_cat [pw=dweight], r
epcp
* N=263,574; N=263,036; N=259,207; N=257,046; N=256,536; N=352,203; N=353,998


ciplot stfdem [aw=dweight] if agea<=60 & agea>=16, by(agea)

ciplot stfdem [aw=dweight] if age_cat==1, by(wave)
ciplot stfdem [aw=dweight] if age_cat==5, by(wave)

tabstat stfdem



* Create ""ESS_4_periods""

ciplot stfdem [aw=dweight], by(age_cat) ///
xsize(10) ysize(7.5) scheme(s1mono) ///
yscale(range(4.8 5.7))  ///
title("All years") note("") ///
xtitle("Age group") /// ytitle("Percent agree") [KEEP HERE IF MAJOR YAXIS L1 is added] ///
ytitle("") ///
name(ciplot_ALL, replace)

ciplot stfdem [aw=dweight] if year>=2002 & year <=2006, by(age_cat) ///
xsize(10) ysize(7.5) scheme(s1mono) ///
yscale(range(4.8 5.7))  ///
title("Interviews between 2002 and 2006") note("") ///
xtitle("Age group") /// ytitle("Percent agree") [KEEP HERE IF MAJOR YAXIS L1 is added] ///
ytitle("") ///
name(ciplot_Y0, replace)

ciplot stfdem [aw=dweight]  if year>=2007 & year <=2012, by(age_cat) ///
xsize(10) ysize(7.5) scheme(s1mono) ///
yscale(range(4.8 5.7))  ///
title("Interviews between 2007 and 2012") note("") ///
xtitle("Age group") /// ytitle("Percent agree") [KEEP HERE IF MAJOR YAXIS L1 is added] ///
ytitle("") ///
name(ciplot_Y1, replace)

ciplot stfdem [aw=dweight]  if year>=2013, by(age_cat) ///
xsize(10) ysize(7.5) scheme(s1mono) ///
yscale(range(4.8 5.7))  ///
title("Interviews between 2013 and 2017") note("") ///
xtitle("Age group") /// ytitle("Percent agree") [KEEP HERE IF MAJOR YAXIS L1 is added] ///
ytitle("") ///
name(ciplot_Y2, replace)

gr combine ciplot_ALL ciplot_Y0 ciplot_Y1 ciplot_Y2


binscatter stfdem agea if agea<=81 & agea>=16, n(100)
binscatter democracySat10 agea if agea<=81 & agea>=16, n(100)


