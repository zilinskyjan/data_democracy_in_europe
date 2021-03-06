* Purpose: Check whether age correlates with satisfaction with Democracy

* Step 1: Load the dataset generated with generate_cumulative_ESS_dataset.do 

* Calculations underlying FIGURE 1:

tabstat stfdem [w=dweight] if age_cat==1, by(wave) 
tabstat stfdem [w=dweight] if age_cat==2, by(wave) 
tabstat stfdem [w=dweight] if age_cat==3 | age_cat==4, by(wave) 
tabstat stfdem [w=dweight] if age_cat==5, by(wave) 

* Appendix PANEL CHART [restricted to people included in the mulrivariate analysis]
tabstat stfdem [w=dweight] if age_cat==1 & !mi(income_low) &  !mi(income_high) & !mi(ed_lower_secondary) & !mi(ed_BA_orHigher) & !mi(female) & !mi(ppltrst) & !mi(age_cat) & !mi(govsat), by(wave)
tabstat stfdem [w=dweight] if age_cat==2 & !mi(income_low) &  !mi(income_high) & !mi(ed_lower_secondary) & !mi(ed_BA_orHigher) & !mi(female) & !mi(ppltrst) & !mi(age_cat) & !mi(govsat), by(wave)
tabstat stfdem [w=dweight] if (age_cat==3 | age_cat==4) & !mi(income_low) &  !mi(income_high) & !mi(ed_lower_secondary) & !mi(ed_BA_orHigher) & !mi(female) & !mi(ppltrst) & !mi(age_cat) & !mi(govsat), by(wave)
tabstat stfdem [w=dweight] if age_cat==5 & !mi(income_low) &  !mi(income_high) & !mi(ed_lower_secondary) & !mi(ed_BA_orHigher) & !mi(female) & !mi(ppltrst) & !mi(age_cat) & !mi(govsat), by(wave)

* Main regressions 
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

* Table A3b:
eststo clear
eststo: reg stfdem income_low income_high ed_lower_secondary ed_BA_orHigher female  [pw=dweight], vce(cluster c_id)
eststo: reg stfdem income_low income_high ed_lower_secondary ed_BA_orHigher female ib2.age_cat [pw=dweight], vce(cluster c_id)
eststo: reg stfdem income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst govsat i.c_id i.year [pw=dweight], vce(cluster c_id)
eststo: reg stfdem income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst ib2.age_cat govsat i.c_id i.year [pw=dweight], vce(cluster c_id)
esttab using "ESS_cts_DV.csv", se(%5.3f) b(%4.2f) r2 se label nogaps replace

* Probit appendix chart:
eststo clear
eststo: probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female i.c_id i.year [pw=dweight], vce(cluster c_id)
eststo: probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female i.c_id i.year ib2.age_cat [pw=dweight], vce(cluster c_id)
eststo: probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ib2.age_cat ppltrst i.c_id i.year [pw=dweight], vce(cluster c_id)
eststo: probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ib2.age_cat ppltrst govsat i.c_id i.year [pw=dweight], vce(cluster c_id)
eststo: probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ib2.age_cat ppltrst govsat stfeco i.c_id i.year [pw=dweight], vce(cluster c_id)
eststo: probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst govsat stfeco i.c_id i.year [pw=dweight], vce(cluster c_id)
eststo: probit democracySat7 ib2.age_cat [pw=dweight], r
esttab using "ESS_probit.csv", se(%5.3f) b(%4.2f) r2 se label nogaps replace


* 1793 observations from Ireland in Wave 5 have a missing year, so fill that in:
replace year=2010 if year==. & wave==5

* EPCP 2016-17 TABLE
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

* EPCP TABLE ALL YEARS -- this also has year FEs
probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female i.c_id i.year [pw=dweight], vce(cluster c_id)
epcp
probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female i.c_id i.year ib2.age_cat [pw=dweight], vce(cluster c_id)
epcp
probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ib2.age_cat ppltrst i.c_id i.year [pw=dweight], vce(cluster c_id)
epcp
probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ib2.age_cat ppltrst govsat i.c_id i.year [pw=dweight], vce(cluster c_id)
epcp
probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ib2.age_cat ppltrst govsat stfeco i.c_id i.year [pw=dweight], vce(cluster c_id)
epcp
probit democracySat7 income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst govsat stfeco i.c_id i.year [pw=dweight], vce(cluster c_id)
epcp
*probit democracySat7 ib2.age_cat i.c_id i.year[pw=dweight], vce(cluster c_id)
*epcp
probit democracySat7 ib2.age_cat [pw=dweight]
epcp
* N=263,574; N=263,036; N=259,207; N=257,046; N=256,536; N=353,881; N=353,998

* Figure 2
ciplot stfdem [aw=dweight] if agea<=60 & agea>=16, by(agea)

ciplot stfdem [aw=dweight] if age_cat==1, by(wave) title("Evaluations of democracy (0-10 scale)" "Age: Under 25") note("Data: ESS 2002-17") xtitle("ESS Round")
ciplot stfdem [aw=dweight] if age_cat==5, by(wave)

tabstat stfdem

**********
* FIGURE 3
**********

* Note: I use the simple scheme, available at https://github.com/zilinskyjan/archive/blob/master/code/simple.scheme

recode age_cat (1=1 "Under 25") (2=2 "25-34") (3=3 "35-44") (4=4 "45-64") (5=5 "65+"), gen(age_short)
* Create ""ESS_4_periods""

ciplot stfdem [aw=dweight], by(age_short) ///
xsize(8) ysize(7.5) ///
yscale(range(4.8 5.7))  ylabel(4.8 5 5.2 5.4 5.7) ///
title("All years") note("") ///
xtitle("Age group") /// ytitle("Percent agree") [KEEP HERE IF MAJOR YAXIS L1 is added] ///
ytitle("") ///
name(ciplot_ALL, replace)

ciplot stfdem [aw=dweight] if year>=2002 & year <=2006, by(age_short) ///
xsize(8) ysize(7.5)   ///
yscale(range(4.8 5.7)) ylabel(4.8 5 5.2 5.4 5.7) ///
title("Interviews between 2002 and 2006") note("") ///
xtitle("Age group") /// ytitle("Percent agree") [KEEP HERE IF MAJOR YAXIS L1 is added] ///
ytitle("") ///
name(ciplot_Y0, replace)

ciplot stfdem [aw=dweight]  if year>=2007 & year <=2012, by(age_short) ///
xsize(8) ysize(7.5)   ///
yscale(range(4.8 5.7)) ylabel(4.8 5 5.2 5.4 5.7) ///
title("Interviews between 2007 and 2012") note("") ///
xtitle("Age group") /// ytitle("Percent agree") [KEEP HERE IF MAJOR YAXIS L1 is added] ///
ytitle("") ///
name(ciplot_Y1, replace)

ciplot stfdem [aw=dweight]  if year>=2013 & year <=2017, by(age_short) ///
xsize(8) ysize(7.5)  ///
yscale(range(4.8 5.7)) ylabel(4.8 5 5.2 5.4 5.7) ///
title("Interviews between 2013 and 2017") note("") ///
xtitle("Age group") /// ytitle("Percent agree") [KEEP HERE IF MAJOR YAXIS L1 is added] ///
ytitle("") ///
name(ciplot_Y2, replace)

gr combine ciplot_ALL ciplot_Y0 ciplot_Y1 ciplot_Y2
