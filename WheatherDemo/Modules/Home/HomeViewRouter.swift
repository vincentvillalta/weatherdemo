//
//  HomeViewRouter.swift
//  WheatherDemo
//
//  Created by Vincent Villalta on 6/10/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

class HomeViewRouter: HomeRouter {
    private var view: HomeView?
    
    init(view: HomeView) {
        self.view = view
    }
    
    func presentWheaterDetails(from view: HomeView, for model: WeatherViewModel) {
        let detailsVc = DetailsViewRouter.createDetailRouterModule(with: model)
        
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid View Protocol type")
        }
        
        viewVC.navigationController?.pushViewController(detailsVc, animated: true)
    }
    
}
