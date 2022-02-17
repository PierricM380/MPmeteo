//
//  API+Extensions.swift
//  MPmeteo
//
//  Created by Pierric Marye on 14/02/2022.
//

import Foundation

extension API {
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"
    
    static func getUrlFor(lat: Double, lon:Double) -> String {
        return "\(baseURLString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)&units=metric&lang=fr"
    }
}
