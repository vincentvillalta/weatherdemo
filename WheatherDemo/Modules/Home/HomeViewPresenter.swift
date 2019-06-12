//
//  HomeViewPresenter.swift
//  WheatherDemo
//
//  Created by Vincent Villalta on 6/10/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import CoreLocation
class HomeViewPresenter: HomePresenter {
    private var interactor: HomeInteractor?
    private var router: HomeRouter?
    private var view: HomeView?
    private var manager: CLLocationManager?
    
    private var locations: [CLLocation] = [
        CLLocation(latitude: 51.509865, longitude: -0.118092), //London
        CLLocation(latitude: 35.686958, longitude: 139.749466), //Tokio
    ]
    init(view: HomeView) {
        self.view = view
        router = HomeViewRouter(view: view)
        interactor = HomeViewInteractor(output: self)
    }
    
    func requestWeather() {
        for location in locations {
            interactor?.requestWheatherData(by: location)
        }
    }
    
    func requestLocation() {
        manager = CLLocationManager()
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .notDetermined:
            manager?.requestWhenInUseAuthorization()
        case .denied, .restricted:
            return
        default:
            break
        }
        
        manager?.delegate = view as? HomeViewController
        manager?.startUpdatingLocation()
    }
    
    func requestLocalWeather(location: CLLocation) {
        interactor?.requestWeatherDataForUserLocation(location: location)
    }
    
    func showWeatherDetails(detail: WeatherViewModel) {
        guard let view = view else { return }
        router?.presentWheaterDetails(from: view, for: detail)
    }
}

extension HomeViewPresenter: HomeInteractorOutput {
    func weatherDataForUserLocation(data: WeatherData) {
        view?.presentLocalWeatherData(data: data)
    }
    
    func weatherData(data: WeatherData) {
        view?.presentWheaterData(data: data)
    }
    
    func weatherDataReponseError(error: Error) {
        
    }
}
