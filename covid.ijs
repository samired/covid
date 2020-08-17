NB. COVID-19 Data Filtering by Contry and Ploting

require 'tables/csv web/gethttp plot'

NB. Utility verbs
gets =: 4 : '(I. (<y) E. 0{|:x){x'
lreg =: 4 : 'y %. 1 ,. x'
treg =: 3 : '((1{((i.#y) lreg y))*(i.#y))+(0{((i.#y) lreg y))'
col =: 4 :  'makenum  x { |: y' NB. adjust by adding }. if header=true
columns =: 3 : '(;/ |: ,: i. #0{y) ,. (|: ,: 0{ y)'
counter =: 3 : '(~. y) ,. (;/ (#/.~ y))'

covid =: fixcsv gethttp dquote 'https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv'

NB. define country before applying lastndays
country =: ''

lnd =: 3 : '|. y {. |. 5 col covid gets country' NB. last n days


report =: 3 : 0
  weekavg =: (+/%#) 7 |. lnd 7                NB. average daily infection for a week
  total =: {. |. 4 col covid gets country     NB. returns last total infection
  cpm =:   {. |. 9 col covid gets country     NB. daily cases per million
  echo 'Average Weekly: ' , ":weekavg
  echo 'Total Cases in Country: ', ":total
  echo 'Daily Cases per Million: ',":cpm 
)