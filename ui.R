# Made with 💖 by Ankit Pandey (https://www.github.com/ankit2web)
#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Twitter Sentiment Analysis"),
  
  # Getting User Inputs
  
  sidebarPanel(
    
    textInput("searchTerm", "Enter data to be searched with '#'", "#"),
    sliderInput("maxTweets","Number of recent tweets to use for analysis:",min=5,max=1000,value=500), 
    submitButton(text="Analyse")
    
  ),
  
  mainPanel(
    
    
    tabsetPanel(
      
      tabPanel("Top Trending Topics Today",HTML("<div>Top Trending Topics according to location</div>"),
               
               selectInput("trendingTable","Choose location to extract trending topics",c("Worldwide","Afghanistan","Albania","Algeria","American Samoa","Andorra","Angola","Anguilla","Antarctica",
                                                                                          "Antigua and Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain",
                                                                                          "Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Brazil",
                                                                                          "British Indian Ocean Territory","Bulgaria","Burundi","Cambodia","Cameroon","Canada","Cayman Islands",
                                                                                          "Central African Republic","Chad","Chile","China","Colombia","Comoros","Congo","Cook Islands","Costa Rica",
                                                                                          "Croatia","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador",
                                                                                          "Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Falkland Islands","Faroe Islands",
                                                                                          "Fiji","Finland","France","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland",
                                                                                          "Grenada","Guadeloupe","Guam","Guatemala","Guinea","Guinea-bissau","Guyana","Vatican City","Honduras",
                                                                                          "Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Israel","Italy","Jamaica",
                                                                                          "Japan","Jordan","Kazakhstan","Kenya","Kiribati","Democratic People's Republic of Korea","Republic of Korea",
                                                                                          "Kuwait","Kyrgyzstan","Lao People's Democratic Republic","Latvia","Lebanon","Lesotho","Liberia",
                                                                                          "Libyan Arab Jamahiriya","Liechtenstein","Lithuania","Luxembourg","Macao","Macedonia","Madagascar","Malawi","Malaysia",
                                                                                          "Maldives","Mali","Malta","Marshall Islands","Martinique","Mauritania","Mauritius","Mayotte","Mexico",
                                                                                          "Micronesia","Republic of Moldova","Monaco","Mongolia","Montserrat","Morocco","Mozambique","Myanmar",
                                                                                          "Namibia","Nauru","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua",
                                                                                          "Niger","Nigeria, Niue","Norfolk Island","Northern Mariana Islands","Norway","Oman","Pakistan","Palau",
                                                                                          "Palestinian Territory Occupied","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Pitcairn",
                                                                                          "Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russian Federation","Rwanda","Saint Helena",
                                                                                          "Saint Kitts and Nevis","Saint Lucia","Saint Pierre and Miquelon","Saint Vincent and The Grenadines","Samoa",
                                                                                          "San Marino","Sao Tome and Principe","Saudi Arabia","Senegal","Serbia and Montenegro","Seychelles","Sierra Leone",
                                                                                          "Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Georgia and The South Sandwich Islands",
                                                                                          "Spain","Sri Lanka","Sudan","Suriname","Svalbard and Jan Mayen","Swaziland","Sweden","Switzerland",
                                                                                          "Syrian Arab Republic","Taiwan","Province of China","Tajikistan","United Republic of Tanzania","Thailand",
                                                                                          "Timor-leste","Togo","Tokelau","Tonga","Trinidad and Tobago","Tunisia","Turkey","Turkmenistan","Turks and Caicos Islands",
                                                                                          "Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","United States Minor Outlying Islands",
                                                                                          "Uruguay","Uzbekistan","Vanuatu","Venezuela","Vietnam","Virgin Islands","British","Virgin Islands","U.S.",
                                                                                          "Wallis and Futuna","Western Sahara","Yemen","Zambia", "Zimbabwe"), selected = "Worldwide", selectize = FALSE),
               submitButton(text="Search"),HTML("<div><h3> The table below shows the top Trending 
                                                Topics (Hot Topics) on Twitter of the location you have chosen. These are the hot topics today! </h3></div>"),
               tableOutput("trendtable"),
               HTML
               ("<div> </div>")),
      
      
      tabPanel("WordCloud",HTML("<div><h3>Most used words associated with the Trending Hashtag</h3></div>"),plotOutput("word"),
               HTML
               ("<div><h4> A Wordcloud is a visual representation of text data, typically used to depict keyword metadata (tags) on websites, or to visualize free form text.
                 This format is useful for quickly perceiving the most prominent terms and for locating a term alphabetically to determine its relative prominence.
                 </h4></div>")),
      
      
      tabPanel("Histogram",HTML
               ("<div><h3> Histograms graphically depict the positivity or negativity of peoples' opinion about of the hashtag
                 </h3></div>"), plotOutput("histPos"), plotOutput("histNeg"), plotOutput("histScore")
               ),
      
      
      tabPanel("Pie Chart",HTML("<div><h3>Pie Chart</h3></div>"), plotOutput("piechart"),HTML
               ("<div><h4> A pie chart is a circular statistical graphic, which is divided into slices to illustrate the sentiment of the hashtag. In a pie chart, the arc length 
			of each slice (and consequently its central angle and area), is proportional to the quantity it represents.</h4></div>")
               
      ),
      
      tabPanel("Table",HTML( "<div><h3> Storing the Tweets associated with the Hashtag in Tabular Format </h3></div>"), tableOutput("tabledata"),
               HTML ("<div><h4> This table depicts the Sentiment of the Tweets (Positive, Negative or Neutral) 
				associated with the searched Hashtag by showing the score for each type of sentiment. </h4></div>")),
      
      
      tabPanel("Top Charts",HTML
               ("<div><h3> Top 20 users who used that Hashtag</h3></div>"),plotOutput("tweetersplot"), tableOutput("tweeterstable")),
      
      tabPanel("Top Hashtags of User",textInput("user", "Enter Twitter Handle to be analyzed", "@"),submitButton(text="Analyze"),plotOutput("tophashtagsplot"),HTML
               ("<div> <h3>Hashtag frequencies in the tweets of the Twitter User</h3></div>"))
      )#end of tabset panel
      )#end of main panel
  
      ))#end of shinyUI