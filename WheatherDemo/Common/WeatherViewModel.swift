//
//  WeatherViewModel.swift
//  WheatherDemo
//
//  Created by Vincent Villalta on 6/11/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import CoreLocation

struct WeatherViewModel: Equatable {
    var coordinates: CLLocation
    var visibility: Int
    var wind: Double
    var sunrise: Date
    var sunset: Date
    var humidity: Int
    var pressure: Float
    var temperature: Double
    var weather: String
    var weatherDetail: String
    var location: String
    var clouds: Int
    
    init(_ model: WeatherData) {
        coordinates = CLLocation(latitude: model.coord?.lat ?? 0.0, longitude: model.coord?.lon ?? 0.0)
        visibility = model.visibility ?? 0
        wind = model.wind?.speed ?? 0.0
        sunrise = Date(timeIntervalSince1970: TimeInterval(model.sys?.sunrise ?? 0))
        sunset = Date(timeIntervalSince1970: TimeInterval(model.sys?.sunset ?? 0))
        humidity = model.main?.humidity ?? 0
        pressure = model.main?.pressure ?? 0
        temperature = model.main?.temp ?? 0.0
        weather = model.weather?.first?.main ?? ""
        weatherDetail = model.weather?.first?.description ?? ""
        location = model.name ?? ""
        clouds = model.clouds?.all ?? 0

    }
    
}
