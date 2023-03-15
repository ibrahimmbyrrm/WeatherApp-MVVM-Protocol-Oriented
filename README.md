# WeatherApp-MVVM-Protocol-Oriented

This is an app which user can see weather status anywhere they want.When you runned the app, you will see the weather status of your current location.There is a textfield at the top of screen.You can enter city name, country name etc.Then the status of your selection will be shown.
I have used Weather API to fetch cities' and countries' datas.When you enter a city, APIManager changes the requestURL as your city.I have used some protocols to abstraction.APIService protocols transfers the data to viewModel.ViewModel transfers to fetched data to View with ViewOutput.Lastly we can use our data in View File with ViewOutput Protocol.That is a nice abstraction to use protocols.Also, i benefitted from CoreLocation to check user's location.
MVVM-Protocol Oriented-Object Oriented
<img width="374" alt="Ekran Resmi 2023-03-15 10 43 21" src="https://user-images.githubusercontent.com/96320314/225242861-fc7d567b-d1bd-441b-b5ff-341d34c6aa9c.png">
<img width="374" alt="Ekran Resmi 2023-03-15 10 43 41" src="https://user-images.githubusercontent.com/96320314/225242884-e70918ff-6a4f-4b2e-a168-67b46d73dac1.png">
