//
//  DetailsProtocol.swift
//  WheatherDemo
//
//  Created by Vincent Villalta on 6/12/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

protocol DetailsView {
    var presenter: DetailsPresenter? { get set }

    func showDetails(_ model: WeatherViewModel)
}

protocol DetailsPresenter {
    var view: DetailsView? { get set }
    var interactor: DetailsInteractor? { get set }
    var router: DetailsRouter? { get set }
    func viewDidLoad()
}

protocol DetailsInteractor {
    var presenter: DetailsPresenter? { get set }
    var model: WeatherViewModel? { get set }
}

protocol DetailsInteractorOutput {
    
}

protocol DetailsRouter {
    static func createDetailRouterModule(with model: WeatherViewModel) -> UIViewController
    func navigateBack()
}
