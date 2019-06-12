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
    private lazy var temperature: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 120, weight: .black)
        label.textColor = UIColor.white.withAlphaComponent(0.7)
        return label
    }()
    
    private lazy var location: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var details: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var clouds: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var wind: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.white
        return label
    }()
    
    
    var presenter: DetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        self.view.backgroundColor = .blue
        self.view.addSubview(temperature)
        temperature.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8.0)
            make.bottom.equalToSuperview().offset(20.0)
        }
        
        self.view.addSubview(location)
        location.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(8.0)
            make.top.equalToSuperview().inset(60.0)
        }
        
        let stack = UIStackView(arrangedSubviews: [details, clouds, wind])
        stack.spacing = 8.0
        stack.axis = .vertical
        self.view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8.0)
            make.top.equalTo(location.snp.bottom).offset(18.0)
        }
    }
}

extension DetailsViewController: DetailsView {
    
    func showDetails(_ model: WeatherViewModel) {
        print(model.location)
        self.view.backgroundColor = MaterialColorGenerator.get_color(key: model.location)
        temperature.text = "\(model.temperature)"
        location.text = model.location
        wind.text = "Wind: \(model.wind)"
        clouds.text = "Clouds: \(model.clouds)"
        details.text = model.weatherDetail
    }
}
