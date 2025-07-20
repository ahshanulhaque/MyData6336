clear
use "P:\abc\DataExam10.dta", clear
*use "D:\abc\DataExam10.dta", clear
*use "E:\abc\DataExam10.dta", clear
sum 

codebook



tab mNutri
tab mNutri residence
tab mNutri residence, col
tab mNutri residence, col ch
*
sum cage
sum cage, de
mean cage

tabstat cage mage mH mW
tabstat cage mage mH mW, statistics( mean sd )
tabstat cage mage mH mW, statistics( mean sd ) by(csex)
tabstat cage mage mH mW, statistics( mean sd p50 ) by(csex)

hist mH
hist mH, norm
graph box mH
scatter mH mW






*---Manuscript------------------------------------
tab 	csex
tab 	stunting
tab 	division
tab 	residence
tab 	wealth
tab 	mNutri
tab 	edu
tab 	DV
tab 	anc

* 
sum cage mage mH mW
*
tab csex group, col ch
tab stunting group, col ch
tab division group, col ch
tab residence group, col ch
tab wealth group, col ch
tab mNutri group, col ch
tab edu group, col ch
tab DV group, col ch
tab anc group, col ch

tabstat cage mage mH mW, statistics( mean sd  ) by(group)
tabstat cage mage mH mW, statistics( p25 p50 p75  ) by(group)


logistic stunting ib0.group
logistic stunting ib1.csex 
logistic stunting cage 
logistic stunting ib1.division 
logistic stunting ib2.residence 
logistic stunting ib5.wealth 
logistic stunting mage 
logistic stunting ib1.mNutri 
logistic stunting ib1.edu 
logistic stunting ib1.DV 
logistic stunting ib0.anc

logistic stunting ib0.group ib1.csex cage ib1.division ib2.residence ib5.wealth mage ib1.mNutri ib1.edu ib1.DV ib0.anc






kkk

gen bmi =mW/(mH/100)^2
la var bmi "Maternal BMI"
* 
gen bmiCAT= 0 if bmi>=18.5
replace bmiCAT= 1 if bmi<18.5
replace bmiCAT=. if bmi>50
la var bmiCAT "Maternal underweight(BMI<18.5)" 
la de bmiCAT 1 "Underweight" 0 "Normal", replace
la val bmiCAT bmiCAT


tab bmiCAT
tab bmiCAT edu, col ch

logistic bmiCAT ib1.anc
logistic bmiCAT ib5.wealth


