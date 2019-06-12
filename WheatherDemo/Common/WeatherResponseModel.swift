//
//  WeatherResponseModel.swift
//  WheatherDemo
//
//  Created by Vincent Villalta on 6/10/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
struct WeatherData: Decodable {
    var coord: WeatherCoordinate?
    var weather: [Weather]?
    var base: String?
    var main:WeatherMain?
    var visibility: Int?
    var wind: WeatherWind?
    var clouds: WeatherClouds?
    var dt: Int?
    var sys: WeatherSys?
    var id: Int?
    var name: String?
    var cod: Int?
}

struct WeatherCoordinate: Decodable{
    var lon: Double?
    var lat: Double?
}

struct Weather: Decodable{
    var id: Int?
    var main: String?
    var description: String?
    var icon: String
}

struct WeatherMain: Decodable{
    var temp: Double?
    var pressure: Float?
    var humidity: Int?
    var temp_min: Double?
    var temp_max: Double?
    var grnd_level: Float?
    var sea_level: Float?
}

struct WeatherWind: Decodable{
    var speed: Double?
    var deg: Double?
}

struct WeatherClouds: Decodable{
    var all: Int?
}

struct WeatherSys: Decodable{
    var type: Int?
    var id: Int?
    var message: Double?
    var country: String?
    var sunrise: Int?
    var sunset: Int?
}
