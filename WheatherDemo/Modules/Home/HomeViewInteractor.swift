//
//  HomeViewInteractor.swift
//  WheatherDemo
//
//  Created by Vincent Villalta on 6/10/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import CoreLocation
import PromiseKit

class HomeViewInteractor: HomeInteractor {
    private var output: HomeInteractorOutput?
    private var locationManager = CLLocationManager()
    init(output: HomeInteractorOutput) {
        self.output = output
    }
    
    func requestWheatherData(by location: CLLocation) {
        firstly {
            HomeViewEntity().getWeatherDataWith(coordinates: location)
            }.done { response in
                self.output?.weatherData(data: response)
            }.catch { error in
                self.output?.weatherDataReponseError(error: error)
        }
    }
    
    func requestWeatherDataForUserLocation(location: CLLocation) {
        firstly {
            HomeViewEntity().getWeatherDataWith(coordinates: location)
            }.done { response in
                self.output?.weatherDataForUserLocation(data: response)
            }.catch { error in
                self.output?.weatherDataReponseError(error: error)
        }
    }
}
