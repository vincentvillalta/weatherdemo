//
//  HomeProtocol.swift
//  WheatherDemo
//
//  Created by Vincent Villalta on 6/10/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
protocol HomeView {
    func showLoading()
    func hideLoading()
    func presentWheaterData(data: WeatherData)
    func presentLocalWeatherData(data: WeatherData)
}

protocol HomePresenter {
    func requestWeather()
    func requestLocation()
    func requestLocalWeather(location: CLLocation)
    func showWeatherDetails(detail: WeatherViewModel)
}

protocol HomeInteractor {
    func requestWheatherData(by location: CLLocation)
    func requestWeatherDataForUserLocation(location: CLLocation)
}

protocol HomeInteractorOutput {
    func weatherData(data: WeatherData)
    func weatherDataForUserLocation(data: WeatherData)
    func weatherDataReponseError(error: Error)
}

protocol HomeRouter {
    func presentWheaterDetails(from view: HomeView, for model: WeatherViewModel)
}
