# BIKE SHARE
<img width="1440" alt="readme-splash" src="https://user-images.githubusercontent.com/33355897/43535327-e3623b4c-9576-11e8-9b41-48c3e419373b.png">

#### Application
Bike Share is a web application built with Ruby, Rails and Activerecord. It’s purpose is to analyze bike share usage in San Francisco as well as provide the opportunity for users to purchase bike accessories through an online store. 

The application was deployed through Heroku and can be accessed here: [Bike Share](https://jem-bikeshare.herokuapp.com)

#### Setup
- The dataset for this application is from a San Francisco based bike share company (provided by Kaggle):[Data](https://www.kaggle.com/benhamner/sf-bay-area-bike-share)
- Once downloaded, the stations, trips and weather CSVs must be placed in a folder named 'sf-bay-area-bike-share' at the same level as your main application folder.
- Run the following commands in your terminal: 
  `bundle`
  `bundle update`
  `rake db:{drop,create,migrate,seed}`
  
#### Testing
- This application utilizes RSpec for testing.  
- To execute the test suite run the following command: ```rspec```

#### Gems Utilized
- BCrypt
- Byebug
- Pry
- Pry-rails
- Capybara
- RSpec-rails
- Launchy
- Shoulda-matchers
- Database_cleaner
- Simplecov
