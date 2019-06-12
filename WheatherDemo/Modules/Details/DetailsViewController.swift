//
//  DetailsViewController.swift
//  WheatherDemo
//
//  Created by Vincent Villalta on 6/12/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import SnapKit

class DetailsViewController: UIViewController {
    var presenter: DetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        self.view.backgroundColor = .white
    }
}

extension DetailsViewController: DetailsView {
    
    func showDetails(_ model: WeatherViewModel) {
        print(model)
    }
}
