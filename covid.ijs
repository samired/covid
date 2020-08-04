NB. COVID-19 Data Filtering by Contryand Ploting "
NB. Required library scripts\n",
require 'tables/csv web/gethttp plot'

NB. Utility verbs
gets =: 4 : '(I. (<y) E. 0{|:x){x'
lreg =: 4 : 'y %. 1 ,. x'
treg =: 3 : '((1{((i.#y) lreg y))*(i.#y))+(0{((i.#y) lreg y))'
col =: 4 :  'makenum  x { |: y'
NB. col =: 4 : 'makenum }. x {\"1 y'
NB. vfmx =: 3 : '}:(,|.\"1 [ 1,.-. *./\\\"1 |.\"1 y='' '')#,y,.LF'
columns =: 3 : '(;/ |: ,: i. #0{y) ,. (|: ,: 0{ y)'
counter =: 3 : '(~. y) ,. (;/ (#/.~ y))'

covid =: fixcsv gethttp dquote 'https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv'

lastndays =: 3 : 0
 |. y {. |. 5 col covid gets 'EGY'
)
