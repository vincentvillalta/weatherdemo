//
//  HomeViewPresenter.swift
//  WheatherDemo
//
//  Created by Vincent Villalta on 6/10/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

class HomeViewPresenter: HomePresenter {
    private var interactor: HomeInteractor?
    private var router: HomeRouter?
    private var view: HomeView?
    init(view: HomeView) {
        self.view = view
        router = HomeViewRouter(view: view)
        interactor = HomeViewInteractor(output: self)
    }
    
    func requestWeather() {
        interactor?.requestWheatherData()
    }
    
    func requestLocation() {
        
    }
    
}

extension HomeViewPresenter: HomeInteractorOutput {
    func weatherData(data: WeatherData) {
        
    }
    
    func weatherDataReponseError(error: Error) {
        
    }
}
