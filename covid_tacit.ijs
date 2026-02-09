NB. COVID-19 Data Filtering by Country and Plotting (terser)

require 'tables/csv web/gethttp plot'

NB. moving average (infix)
ma  =: (+/%#)\

NB. select rows whose first column matches a boxed key
gets=: {~ I.@((<@]) E. 0&{:@|:@[)

NB. linear regression coefficients (intercept,slope) for y on x
lreg=: ] %. 1&,.@[

NB. regression trend line over y (same length as y)
treg=: 3 : 'p=. (i.#y) lreg y [ (0{p) + (1{p) * i.#y'

NB. numeric column extract (x-th column of table y)
col =: makenum@([ { |:@])

NB. CSV source
covid=: fixcsv@gethttp@dquote 'https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv'

NB. convenience: last x items (preserving order)
last=: |.,@([ {. |.@])

NB. 10-day moving avg of daily cases for country y
mac =: 3 : '10 ma 5 col covid gets y'

NB. last n days of (cases / cases per million) for country x
lnd =: 4 : 'y last  5 col covid gets x'
lnx =: 4 : 'y last 11 col covid gets x'

report =: 3 : 0                              NB. country iso code as (y)
  last =: {. |. 5 col covid gets y 
  weekavg =: (+/%#) y lnd 7                  NB. average daily infection for week
  monthavg =: (+/%#) y lnd 30                NB. average daily infection for month
  total =: {: 4 col covid gets y        NB. returns last total infection
  cpm =:   {: 11 col covid gets y        NB. daily cases per million
  echo '- Last Recorded Daily Infection: ',":last
  echo '- Daily Average For Last Week  : ',":weekavg
  echo '- Daily Average For Last Month : ',":monthavg
  echo '- Total Cases in Country       : ',":total
  echo '- Daily Cases per Million      : ',":cpm 
)
