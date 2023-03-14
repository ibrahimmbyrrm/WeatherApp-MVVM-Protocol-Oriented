//
//  ViewController.swift
//  WeatherApp
//
//  Created by İbrahim Bayram on 13.03.2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, ViewOutput{
    
    func saveWeather(weather: WeatherModel) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.name
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.tempLabel.text = weather.temperatureString
        }
    }
    
 
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    let locationManager = CLLocationManager()
    lazy var viewModel : ViewModelOutput = WeatherViewModel()
    private var apiService = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        viewModel.setDelegate(output: self)
        searchTextField.delegate = self
    }

}
extension ViewController : CLLocationManagerDelegate{
    @IBAction func locationButtonClicked(_ sender: Any) {
        locationManager.requestLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("dsff")
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            viewModel.fetchLocationData(lat: lat, lon: lon)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

extension ViewController : UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: Any) {
        searchTextField.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            viewModel.fetchCityData(city: city)
            searchTextField.text = ""
        }
    }
    
    
}

