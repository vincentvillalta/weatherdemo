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
    
    func requestWheatherData() {
        firstly {
            HomeViewEntity().getWeatherDataWith(coordinates: CLLocation(latitude: 12, longitude: 12))
            }.done { response in
                print(response)
                self.output?.weatherData(data: response)
            }.catch { error in
                print(error)
                self.output?.weatherDataReponseError(error: error)
        }
    }
    
    func requestUserLocationPermissions() {
//        self.locationManager.requestWhenInUseAuthorization()
//        self.locationManager.delegate = self
//        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        self.locationManager.startUpdatingLocation()
    }
}
