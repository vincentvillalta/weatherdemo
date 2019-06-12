//
//  HomeViewController.swift
//  WheatherDemo
//
//  Created by Vincent Villalta on 6/10/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import SnapKit
import CoreLocation
class HomeViewController: UIViewController {
    
    private var models: [WeatherViewModel] = []
    private var presenter: HomeViewPresenter?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.estimatedRowHeight = 100.0
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = HomeViewPresenter(view: self)
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make  in
            make.edges.equalToSuperview()
        }
        presenter?.requestLocation()
        presenter?.requestWeather()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.register(WeatherListTableViewCell.self, forCellReuseIdentifier: "WeatherCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension HomeViewController: HomeView {
    func presentLocalWeatherData(data: WeatherData) {
        let model = WeatherViewModel(data)
        models.insert(model, at: 0)
        tableView.reloadData()
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func presentWheaterData(data: WeatherData) {
        let model = WeatherViewModel(data)
        models.append(model)
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as? WeatherListTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showWeatherDetails(detail: models[indexPath.row])
    }
}

extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Found user's location: \(location)")
            manager.stopUpdatingLocation()
            presenter?.requestLocalWeather(location: location)
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
