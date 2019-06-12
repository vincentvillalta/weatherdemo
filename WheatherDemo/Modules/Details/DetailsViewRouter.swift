//
//  DetailsViewRouter.swift
//  WheatherDemo
//
//  Created by Vincent Villalta on 6/12/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

class DetailsViewRouter: DetailsRouter {
    private var view: DetailsView?
    
    init(view: DetailsView) {
        self.view = view
    }
    
    static func createDetailRouterModule(with model: WeatherViewModel) -> UIViewController {
        let view = DetailsViewController()
        let interactor = DetailsViewInteractor()
        let presenter = DetailsViewPresenter()
        interactor.model = model
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        view.presenter = presenter
        return view
    }
    
    func navigateBack() {
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid view protocol type")
        }
        viewVC.navigationController?.popViewController(animated: true)
    }
    
    
}
