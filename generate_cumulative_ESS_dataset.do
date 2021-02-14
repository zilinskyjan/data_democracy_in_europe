* Purpose: 	Create a cumulative ESS dataset
***		*	Keep the appropriate outcome variable
***		* 	Make covariates consistent across waves
* Time: 	Feb. 2018

clear

* Set you working directory
cd "data_democracy_in_europe/full_datasets"
global wd "`c(pwd)'"

use "ESS8/ESS8e01.dta"

set more off
do "ESS8/ESS_miss.do"
*do "ESS8/ESS8e01_formats_unicode.do"
rename cntry iso2
* Interview year
gen year = inwyye
gen wave = 8

* COVARIATES
gen female = (gndr==2) if !mi(gndr) 
label var female "Female"
* Age categories
recode agea (min/24=1 "18-24 year olds") (25/34=2 "25-34 year olds") (35/44=3 "35-44 year olds") (45/64=4 "45-64 year olds") (64/max=5 "65 years and older"), gen(age_cat)
* Marital status
gen married = (maritalb==1) if !mi(maritalb)
label var married "Married"
* Education
gen ed_lower_secondary = (edulvlb <= 229) if !mi(edulvlb)
gen ed_BA_orHigher = (edulvlb >= 610) if !mi(edulvlb)
label var ed_lower "Lower education"
label var ed_BA "University education"
* Employment & income
gen paidWork = (pdwrk==1) 
label var paidWork "Did paid work in last 7 days"
gen income_high = (hinctnta>=8)  if !mi(hinctnta)
gen income_low = (hinctnta<=2) if !mi(hinctnta)
label var income_low "Bottom 2 income deciles"
label var income_high "Top 3 income deciles"

* SELECTED OUTCOMES
gen econsatisfied = (stfeco >=7) if !mi(stfeco)  
gen lifesat = (stflife >=7) if !mi(stflife)
gen govsat = (stfgov >=7) if !mi(stfgov)
label var econsatisfied "Satisfied with the economy"
label var lifesat "Satisfied with own life"
label var govsat "Satisfied with national government"

gen democracySat7 = (stfdem>=7) if !mi(stfdem)
gen democracySat8 = (stfdem>=8) if !mi(stfdem)
gen democracySat9 = (stfdem>=9) if !mi(stfdem)
gen democracySat10 = (stfdem==10) if !mi(stfdem)

keep year wave agea iso2 dweight democracySat7 democracySat8 democracySat9 democracySat10 stfdem stfeco stflife stfgov income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst age_cat govsat paidWork married

save "ess8_cleaned.dta", replace
clear



do "ESS7/ESS_miss.do"

rename cntry iso2
* Interview year
gen year = inwyye
gen wave = 7

* COVARIATES
gen female = (gndr==2) if !mi(gndr) 
label var female "Female"
* Age categories
recode agea (min/24=1 "18-24 year olds") (25/34=2 "25-34 year olds") (35/44=3 "35-44 year olds") (45/64=4 "45-64 year olds") (64/max=5 "65 years and older"), gen(age_cat)
* Marital status
gen married = (maritalb==1) if !mi(maritalb)
label var married "Married"
* Education
gen ed_lower_secondary = (edulvlb <= 229) if !mi(edulvlb)
gen ed_BA_orHigher = (edulvlb >= 610) if !mi(edulvlb)
label var ed_lower "Lower education"
label var ed_BA "University education"
* Employment & income
gen paidWork = (pdwrk==1) 
label var paidWork "Did paid work in last 7 days"
gen income_high = (hinctnta>=8)  if !mi(hinctnta)
gen income_low = (hinctnta<=2) if !mi(hinctnta)
label var income_low "Bottom 2 income deciles"
label var income_high "Top 3 income deciles"

* SELECTED OUTCOMES
gen econsatisfied = (stfeco >=7) if !mi(stfeco)  
gen lifesat = (stflife >=7) if !mi(stflife)
gen govsat = (stfgov >=7) if !mi(stfgov)
label var econsatisfied "Satisfied with the economy"
label var lifesat "Satisfied with own life"
label var govsat "Satisfied with national government"

gen democracySat7 = (stfdem>=7) if !mi(stfdem)
gen democracySat8 = (stfdem>=8) if !mi(stfdem)
gen democracySat9 = (stfdem>=9) if !mi(stfdem)
gen democracySat10 = (stfdem==10) if !mi(stfdem)

keep year wave agea iso2 dweight democracySat7 democracySat8 democracySat9 democracySat10 stfdem stfeco stflife stfgov income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst age_cat govsat paidWork married

save "ess7_cleaned.dta", replace



clear
use "ESS6/ESS6e02_3.dta"
do "ESS6/ESS_miss.do"

rename cntry iso2
* Interview year
gen year = inwyye
gen wave = 6

* COVARIATES
gen female = (gndr==2) if !mi(gndr) 
label var female "Female"
* Age categories
recode agea (min/24=1 "18-24 year olds") (25/34=2 "25-34 year olds") (35/44=3 "35-44 year olds") (45/64=4 "45-64 year olds") (64/max=5 "65 years and older"), gen(age_cat)
* Marital status
gen married = (maritalb==1) if !mi(maritalb)
label var married "Married"
* Education
gen ed_lower_secondary = (edulvlb <= 229) if !mi(edulvlb)
gen ed_BA_orHigher = (edulvlb >= 610) if !mi(edulvlb)
label var ed_lower "Lower education"
label var ed_BA "University education"
* Employment & income
gen paidWork = (pdwrk==1) 
label var paidWork "Did paid work in last 7 days"
gen income_high = (hinctnta>=8)  if !mi(hinctnta)
gen income_low = (hinctnta<=2) if !mi(hinctnta)
label var income_low "Bottom 2 income deciles"
label var income_high "Top 3 income deciles"

* SELECTED OUTCOMES
gen econsatisfied = (stfeco >=7) if !mi(stfeco)  
gen lifesat = (stflife >=7) if !mi(stflife)
gen govsat = (stfgov >=7) if !mi(stfgov)
label var econsatisfied "Satisfied with the economy"
label var lifesat "Satisfied with own life"
label var govsat "Satisfied with national government"

gen democracySat7 = (stfdem>=7) if !mi(stfdem)
gen democracySat8 = (stfdem>=8) if !mi(stfdem)
gen democracySat9 = (stfdem>=9) if !mi(stfdem)
gen democracySat10 = (stfdem==10) if !mi(stfdem)

keep year wave agea iso2 dweight democracySat7 democracySat8 democracySat9 democracySat10 stfdem stfeco stflife stfgov income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst age_cat govsat paidWork married

save "ess6_cleaned.dta", replace


clear
use "ESS5/ESS5e03_3.dta"
set more off
do "ESS5/ESS_miss.do"

rename cntry iso2
* Interview year
gen year = inwyye
gen wave = 5

* COVARIATES
gen female = (gndr==2) if !mi(gndr) 
label var female "Female"
* Age categories
recode agea (min/24=1 "18-24 year olds") (25/34=2 "25-34 year olds") (35/44=3 "35-44 year olds") (45/64=4 "45-64 year olds") (64/max=5 "65 years and older"), gen(age_cat)
* Marital status
gen married = (maritalb==1) if !mi(maritalb)
label var married "Married"
* Education
gen ed_lower_secondary = (edulvlb <= 229) if !mi(edulvlb)
gen ed_BA_orHigher = (edulvlb >= 610) if !mi(edulvlb)
label var ed_lower "Lower education"
label var ed_BA "University education"
* Employment & income
gen paidWork = (pdwrk==1) 
label var paidWork "Did paid work in last 7 days"
gen income_high = (hinctnta>=8)  if !mi(hinctnta)
gen income_low = (hinctnta<=2) if !mi(hinctnta)
label var income_low "Bottom 2 income deciles"
label var income_high "Top 3 income deciles"

* SELECTED OUTCOMES
gen econsatisfied = (stfeco >=7) if !mi(stfeco)  
gen lifesat = (stflife >=7) if !mi(stflife)
gen govsat = (stfgov >=7) if !mi(stfgov)
label var econsatisfied "Satisfied with the economy"
label var lifesat "Satisfied with own life"
label var govsat "Satisfied with national government"

gen democracySat7 = (stfdem>=7) if !mi(stfdem)
gen democracySat8 = (stfdem>=8) if !mi(stfdem)
gen democracySat9 = (stfdem>=9) if !mi(stfdem)
gen democracySat10 = (stfdem==10) if !mi(stfdem)

keep year wave agea iso2 dweight democracySat7 democracySat8 democracySat9 democracySat10 stfdem stfeco stflife stfgov income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst age_cat govsat paidWork married

save "ess5_cleaned.dta", replace


clear
use "ESS4/ESS4e04_4.dta"
set more off
do "ESS4/ESS_miss.do"

rename cntry iso2
* Interview year
gen year = inwyye
gen wave = 4

* COVARIATES
gen female = (gndr==2) if !mi(gndr) 
label var female "Female"
* Age categories
recode agea (min/24=1 "18-24 year olds") (25/34=2 "25-34 year olds") (35/44=3 "35-44 year olds") (45/64=4 "45-64 year olds") (64/max=5 "65 years and older"), gen(age_cat)
* Marital status
gen married = (maritala==1) if !mi(maritala)
label var married "Married"
* Education
gen ed_lower_secondary = (edulvla <= 2) if !mi(edulvla)
gen ed_BA_orHigher = (edulvla >= 5) if !mi(edulvla)
label var ed_lower "Lower education"
label var ed_BA "University education"
* Employment & income
gen paidWork = (pdwrk==1) 
label var paidWork "Did paid work in last 7 days"
gen income_high = (hinctnta>=8)  if !mi(hinctnta)
gen income_low = (hinctnta<=2) if !mi(hinctnta)
label var income_low "Bottom 2 income deciles"
label var income_high "Top 3 income deciles"

* SELECTED OUTCOMES
gen econsatisfied = (stfeco >=7) if !mi(stfeco)  
gen lifesat = (stflife >=7) if !mi(stflife)
gen govsat = (stfgov >=7) if !mi(stfgov)
label var econsatisfied "Satisfied with the economy"
label var lifesat "Satisfied with own life"
label var govsat "Satisfied with national government"

gen democracySat7 = (stfdem>=7) if !mi(stfdem)
gen democracySat8 = (stfdem>=8) if !mi(stfdem)
gen democracySat9 = (stfdem>=9) if !mi(stfdem)
gen democracySat10 = (stfdem==10) if !mi(stfdem)

keep year wave agea iso2 dweight democracySat7 democracySat8 democracySat9 democracySat10 stfdem stfeco stflife stfgov income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst age_cat govsat paidWork married

save "ess4_cleaned.dta", replace


clear
use "ESS3/ESS3e03_6.dta"
set more off
do "ESS3/ESS_miss.do"

rename cntry iso2
* Interview year
gen year = inwyye
gen wave = 3

* COVARIATES
gen female = (gndr==2) if !mi(gndr) 
label var female "Female"
* Age categories
recode agea (min/24=1 "18-24 year olds") (25/34=2 "25-34 year olds") (35/44=3 "35-44 year olds") (45/64=4 "45-64 year olds") (64/max=5 "65 years and older"), gen(age_cat)
* Marital status
gen married = (maritala==1) if !mi(maritala)
label var married "Married"
* Education
gen ed_lower_secondary = (edulvla <= 2) if !mi(edulvla)
gen ed_BA_orHigher = (edulvla >= 5) if !mi(edulvla)
label var ed_lower "Lower education"
label var ed_BA "University education"
* Employment & income
gen paidWork = (pdwrk==1) 
label var paidWork "Did paid work in last 7 days"

* This is an ESS3 change:
replace hinctnt=. if hinctnt >=11
gen income_high = (hinctnt>=8)  if !mi(hinctnt)
gen income_low = (hinctnt<=2) if !mi(hinctnt)
label var income_low "Bottom 2 income deciles"
label var income_high "Top 3 income deciles"

* SELECTED OUTCOMES
gen econsatisfied = (stfeco >=7) if !mi(stfeco)  
gen lifesat = (stflife >=7) if !mi(stflife)
gen govsat = (stfgov >=7) if !mi(stfgov)
label var econsatisfied "Satisfied with the economy"
label var lifesat "Satisfied with own life"
label var govsat "Satisfied with national government"

gen democracySat7 = (stfdem>=7) if !mi(stfdem)
gen democracySat8 = (stfdem>=8) if !mi(stfdem)
gen democracySat9 = (stfdem>=9) if !mi(stfdem)
gen democracySat10 = (stfdem==10) if !mi(stfdem)

keep year wave agea iso2 dweight democracySat7 democracySat8 democracySat9 democracySat10 stfdem stfeco stflife stfgov income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst age_cat govsat paidWork married

save "ess3_cleaned.dta", replace

clear
use "ESS2/ESS2e03_5.dta"
set more off
do "ESS2/ESS_miss.do"

rename cntry iso2
* Interview year
gen year = inwyr
gen wave = 2

* COVARIATES
gen female = (gndr==2) if !mi(gndr) 
label var female "Female"
* Age categories
recode agea (min/24=1 "18-24 year olds") (25/34=2 "25-34 year olds") (35/44=3 "35-44 year olds") (45/64=4 "45-64 year olds") (64/max=5 "65 years and older"), gen(age_cat)
* Marital status
gen married = (marital==1) if !mi(marital)
label var married "Married"
* Education
gen ed_lower_secondary = (edulvla <= 2) if !mi(edulvla)
gen ed_BA_orHigher = (edulvla >= 5) if !mi(edulvla)
label var ed_lower "Lower education"
label var ed_BA "University education"
* Employment & income
gen paidWork = (pdwrk==1) 
label var paidWork "Did paid work in last 7 days"
replace hinctnt=. if hinctnt >=11
gen income_high = (hinctnt>=8)  if !mi(hinctnt)
gen income_low = (hinctnt<=2) if !mi(hinctnt)
label var income_low "Bottom 2 income deciles"
label var income_high "Top 3 income deciles"

* SELECTED OUTCOMES
gen econsatisfied = (stfeco >=7) if !mi(stfeco)  
gen lifesat = (stflife >=7) if !mi(stflife)
gen govsat = (stfgov >=7) if !mi(stfgov)
label var econsatisfied "Satisfied with the economy"
label var lifesat "Satisfied with own life"
label var govsat "Satisfied with national government"

gen democracySat7 = (stfdem>=7) if !mi(stfdem)
gen democracySat8 = (stfdem>=8) if !mi(stfdem)
gen democracySat9 = (stfdem>=9) if !mi(stfdem)
gen democracySat10 = (stfdem==10) if !mi(stfdem)

keep year wave agea iso2 dweight democracySat7 democracySat8 democracySat9 democracySat10 stfdem stfeco stflife stfgov income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst age_cat govsat paidWork married

save "ess2_cleaned.dta", replace



clear
use "ESS1/ESS1e06_5.dta"
set more off
do "ESS1/ESS_miss.do"

rename cntry iso2
* Interview year
gen year = inwyr
gen wave = 1

* COVARIATES
gen female = (gndr==2) if !mi(gndr) 
label var female "Female"
* Age categories
recode agea (min/24=1 "18-24 year olds") (25/34=2 "25-34 year olds") (35/44=3 "35-44 year olds") (45/64=4 "45-64 year olds") (64/max=5 "65 years and older"), gen(age_cat)
* Marital status
gen married = (marital==1) if !mi(marital)
label var married "Married"
* Education
gen ed_lower_secondary = (edulvla <= 2) if !mi(edulvla)
gen ed_BA_orHigher = (edulvla >= 5) if !mi(edulvla)
label var ed_lower "Lower education"
label var ed_BA "University education"
* Employment & income
gen paidWork = (pdwrk==1) 
label var paidWork "Did paid work in last 7 days"
replace hinctnt=. if hinctnt >=11
gen income_high = (hinctnt>=8)  if !mi(hinctnt)
gen income_low = (hinctnt<=2) if !mi(hinctnt)
label var income_low "Bottom 2 income deciles"
label var income_high "Top 3 income deciles"

* SELECTED OUTCOMES
gen econsatisfied = (stfeco >=7) if !mi(stfeco)  
gen lifesat = (stflife >=7) if !mi(stflife)
gen govsat = (stfgov >=7) if !mi(stfgov)
label var econsatisfied "Satisfied with the economy"
label var lifesat "Satisfied with own life"
label var govsat "Satisfied with national government"

gen democracySat7 = (stfdem>=7) if !mi(stfdem)
gen democracySat8 = (stfdem>=8) if !mi(stfdem)
gen democracySat9 = (stfdem>=9) if !mi(stfdem)
gen democracySat10 = (stfdem==10) if !mi(stfdem)

keep year wave agea iso2 dweight democracySat7 democracySat8 democracySat9 democracySat10 stfdem stfeco stflife stfgov income_low income_high ed_lower_secondary ed_BA_orHigher female ppltrst age_cat govsat paidWork married
label var age_cat "Age group"

save "ess1_cleaned.dta", replace

stop

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
