//
//  DetailsViewPresenter.swift
//  WheatherDemo
//
//  Created by Vincent Villalta on 6/12/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

class DetailsViewPresenter: DetailsPresenter {
    
    var view: DetailsView?
    var router: DetailsRouter?
    var interactor: DetailsInteractor?
    
    func viewDidLoad() {
        if let item = interactor?.model {
            view?.showDetails(item)
        }
    }
    
}
