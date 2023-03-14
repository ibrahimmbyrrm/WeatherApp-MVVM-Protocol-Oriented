//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by İbrahim Bayram on 14.03.2023.
//

import Foundation
import CoreLocation

class WeatherViewModel : ViewModelOutput{
    //First, we have changed the url as out city.Then, we called the fetchWeather function to get data.Finally, we transformed the weather data to our viewoutput.
    func fetchCityData(city : String) {
        apiService.changeURL(cityName: city)
        apiService.fetchWeather { result in
            switch result {
            case .success(let weather):
                self.viewOutput?.saveWeather(weather: weather)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    func fetchLocationData(lat : CLLocationDegrees, lon : CLLocationDegrees) {
        apiService.changeURLasLocation(lat: lat, lon: lon)
        apiService.fetchWeather { result in
            switch result {
            case .success(let weather):
                self.viewOutput?.saveWeather(weather: weather)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    var apiService: APIService = APIManager()
    
    init() {
        apiService = APIManager()
    }
    
    var viewOutput: ViewOutput?
    
    func setDelegate(output: ViewOutput) {
        viewOutput = output
    }
    
   
   
    
}
