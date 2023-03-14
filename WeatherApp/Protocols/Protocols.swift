//
//  Protocols.swift
//  WeatherApp
//
//  Created by İbrahim Bayram on 14.03.2023.
//

import Foundation
import CoreLocation

protocol APIService {
    func fetchWeather(completion : @escaping(Result<WeatherModel, Error>)->Void)
    func changeURL(cityName : String)
    func changeURLasLocation(lat : CLLocationDegrees, lon : CLLocationDegrees)
}

protocol ViewModelOutput {
    func fetchCityData(city : String)
    func fetchLocationData(lat : CLLocationDegrees, lon : CLLocationDegrees)
    var apiService : APIService {get}
    var viewOutput : ViewOutput? {get}
    
    func setDelegate(output : ViewOutput)
}

protocol ViewOutput {
    func saveWeather(weather : WeatherModel)
}

