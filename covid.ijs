NB. COVID-19 Data Filtering by Contryand Ploting "
NB. Required library scripts\n",
require 'tables/csv web/gethttp plot'

NB. Utility verbs
gets =: 4 : '(I. (<y) E. 0{|:x){x'
lreg =: 4 : 'y %. 1 ,. x'
treg =: 3 : '((1{((i.#y) lreg y))*(i.#y))+(0{((i.#y) lreg y))'
col =: 4 :  'makenum  x { |: y'
columns =: 3 : '(;/ |: ,: i. #0{y) ,. (|: ,: 0{ y)'
counter =: 3 : '(~. y) ,. (;/ (#/.~ y))'

covid =: fixcsv gethttp dquote 'https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv'

lastmonth =: 150 }. 5 col (covid gets 'EGY')

plot lastmonth,: treg lastmonth
