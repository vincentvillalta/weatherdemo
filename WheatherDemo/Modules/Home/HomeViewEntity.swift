//
//  HomeViewEntity.swift
//  WheatherDemo
//
//  Created by Vincent Villalta on 6/10/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import PromiseKit
import Alamofire
import CoreLocation
class HomeViewEntity {
    func getWeatherDataWith(coordinates: CLLocation, headers: HTTPHeaders = [:]) -> Promise<WeatherData> {
        return Promise { seal in
            AF.request("https://openweathermap.org/data/2.5/weather?lat=\(coordinates.coordinate.latitude)&lon=\(coordinates.coordinate.longitude)&appid=b6907d289e10d714a6e88b30761fae22",
                       method: .get,
                       parameters: nil,
                       encoding: JSONEncoding.default,
                       headers: headers).responseJSON { response in
                        
                        switch response.result {
                            case .success:
                                if let data = response.data {
                                    let weatherReponse = try! JSONDecoder().decode(WeatherData.self, from: data)
                                    seal.fulfill(weatherReponse)
                            }
                        case .failure(let error):
                            // pass the error into the reject function, so we can check what causes the error
                            seal.reject(error)
                        }
            }
        }
    }
}
