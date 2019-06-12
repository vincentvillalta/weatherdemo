//
//  WeatherListTableViewCell.swift
//  WheatherDemo
//
//  Created by Vincent Villalta on 6/10/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import SnapKit
class WeatherListTableViewCell: UITableViewCell {
    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5.0
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var temperature: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50, weight: .black)
        label.textColor = UIColor.white.withAlphaComponent(0.7)
        return label
    }()
    
    private lazy var location: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = UIColor.white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: WeatherViewModel) {
        container.backgroundColor = MaterialColorGenerator.get_color(key: model.location)
        temperature.text = "\(model.temperature)"
        location.text = model.location
    }
    
    private func configureUI() {
        self.selectionStyle = .none
        contentView.addSubview(container)
        container.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8.0)
            make.top.bottom.equalToSuperview().inset(12.0)
        }
        
        container.addSubview(temperature)
        temperature.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8.0)
            make.bottom.equalToSuperview().offset(14.0)
        }
        
        container.addSubview(location)
        location.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(8.0)
        }
    }
}
