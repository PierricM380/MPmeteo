//
//  CityViewViewModel.swift
//  MPmeteo
//
//  Created by Pierric Marye on 14/02/2022.
//

import SwiftUI
import CoreLocation

final class CityViewViewModel: ObservableObject {
    
    @Published var weather = WeatherResponse.empty()
    @Published var city: String = "Paris" {
        didSet {
            // call get location here
            getLocation()
        }
    }
    // Date, day, hours formatters
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.locale = Locale(identifier: "FR-fr")
        return formatter
    }()
    
    private lazy var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "FR-fr")
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "FR-fr")
        formatter.dateFormat = "HH"
        return formatter
    }()
    
    init() {
        // get location
        getLocation()
    }
    // Perform date into string since interval
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    // Display icon
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "sun.max.fill"
    }
    
    var temperature: String {
        return getTempFor(temp: weather.current.temp)
    }
    
    var conditions: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].description
        }
        return ""
    }
    
    var windSpeed: String {
        return String(format: "%0.1f", weather.current.wind_speed * 3.6)
    }
    
    var humidity: String {
        return String(format: "%d%%", weather.current.humidity)
    }
    
    var rainChance: String {
        return String(format: "%0.0f%%", weather.current.dew_point)
    }
    
    var pressure: String {
        return String(weather.current.pressure)
    }
    //
    func getTimeFor(timestamp: Int) -> String {
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    // Make one value after dot (15.5°C)
    func getTempFor(temp: Double) -> String {
        return String(format: "%0.1f", temp)
    }
    //
    func getDayFor(timestamp: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks, let place = places.first {
                self.getWeather(coord: place.location?.coordinate)
            }
        }
    }
    
    private func getWeather(coord: CLLocationCoordinate2D?) {
        if let coord = coord {
            let urlString = API.getUrlFor(lat: coord.latitude, lon: coord.longitude)
            getWeatherInterval(city: city, for: urlString)
        } else {
            let urlString = API.getUrlFor(lat: 48.856614, lon: 48.856614)
            getWeatherInterval(city: city, for: urlString)
        }
    }
    
    private func getWeatherInterval(city: String, for urlString: String) {
        NetworkManager<WeatherResponse>.fetch(for: URL(string: urlString)!) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func getWeatherIconFor(icon: String) -> Image {
        switch icon {
        case "01d":
            return Image("01d")
        case "01n":
            return Image("01n")
        case "02d":
            return Image("02d")
        case "03d":
            return Image("03d")
        case "03n":
            return Image("03n")
        case "04d":
            return Image("04d")
        case "04n":
            return Image("04n")
        case "09d":
            return Image("09d")
        case "09n":
            return Image("09n")
        case "10d":
            return Image("10d")
        case "10n":
            return Image("10n")
        case "11d":
            return Image("11d")
        case "11n":
            return Image("11n")
        case "13d":
            return Image("13d")
        case "13n":
            return Image("13n")
        case "50d":
            return Image("50d")
        case "50n":
            return Image("50n")
        default:
            return Image(systemName: "sun.max.fill")
        }
    }
}
