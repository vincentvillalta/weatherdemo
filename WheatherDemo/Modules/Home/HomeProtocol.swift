//
//  HomeProtocol.swift
//  WheatherDemo
//
//  Created by Vincent Villalta on 6/10/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import Foundation

protocol HomeView {
    func showLoading()
    func hideLoading()
    func presentWheaterData()
}

protocol HomePresenter {
    func requestWeather()
    func requestLocation()
}

protocol HomeInteractor {
    func requestWheatherData()
    func requestUserLocationPermissions()
}

protocol HomeInteractorOutput {
    func weatherData(data: WeatherData)
    func weatherDataReponseError(error: Error)
}

protocol HomeRouter {
    func presentWheaterDetails()
}
