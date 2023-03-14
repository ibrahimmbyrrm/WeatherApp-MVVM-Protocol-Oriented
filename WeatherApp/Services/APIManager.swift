//
//  APIManager.swift
//  WeatherApp
//
//  Created by İbrahim Bayram on 13.03.2023.
//

import Foundation
import CoreLocation

class APIManager : APIService{

    var weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=9371fe490d01232e5dfd4b594b396bb5&units=metric&"
    
    
    //This function changes to url according to user's city selection.
    func changeURL(cityName : String) {
        self.weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=9371fe490d01232e5dfd4b594b396bb5&units=metric&q=\(cityName.lowercased())"
    }
    
    func changeURLasLocation(lat : CLLocationDegrees, lon : CLLocationDegrees) {
        self.weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=9371fe490d01232e5dfd4b594b396bb5&units=metric&lat=\(lat)&lon=\(lon)"
    }
    
    
    func fetchWeather(completion : @escaping(Result<WeatherModel, Error>)->Void){
        
        if let url = URL(string: weatherURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error?.localizedDescription)
                }else {
                    guard let data = data else {return}
                    do {
                        let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
                        let id = decodedData.weather[0].id
                        let name = decodedData.name
                        let temp = decodedData.main.temp
                        
                        let weather = WeatherModel(name: name, temp: temp, conditionId: id)
                        completion(.success(weather))
                        
                    }catch {
                        print(error.localizedDescription)
                        completion(.failure(error))
                    }
                    
                }
            }
            task.resume()
            
        }
        
        
        
    }
    
}
