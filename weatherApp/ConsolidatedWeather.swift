//
//  ConsolidatedWeather.swift
//  weatherApp
//
//  Created by Dariia Rodari on 12/11/17.
//  Copyright © 2017 rodariapp. All rights reserved.
//

import Foundation
import UIKit


class ConsolidatedWeather:NSObject {

    let weatherStateName: String
    let minimumTempreture: Double
    let maximumTempreture: Double
    let currentTempreture: Double
    let applicableDate: String
    let weatherStateIconUrl: URL
//    let weatherStateIcon: UIImage

    init?(json: [String: Any]) {
        guard let weatherStateName = json["weather_state_name"] as? String,
            let minimumTempreture = json["min_temp"] as? Double,
            let maximumTempreture = json["max_temp"] as? Double,
            let currentTempreture = json["the_temp"] as? Double,
            let applicableDate = json["applicable_date"] as? String,
            let weatherStateAbbreviation = json["weather_state_abbr"] as? String,
            let weatherStateIconURLbuilder = "https://www.metaweather.com/static/img/weather/png/64/\(weatherStateAbbreviation).png" as? String,
            let weatherStateIconUrl = URL(string: weatherStateIconURLbuilder)

        else { return nil }

        self.weatherStateName = weatherStateName
        self.minimumTempreture = minimumTempreture
        self.maximumTempreture = maximumTempreture
        self.currentTempreture = currentTempreture
        self.applicableDate = applicableDate
        self.weatherStateIconUrl = weatherStateIconUrl

    }

    override var description: String {
        return """
        weatherStateName = \(weatherStateName)
        minimumTempreture = \(minimumTempreture)
        maximumTempreture = \(maximumTempreture)
        currentTempreture = \(currentTempreture)
        applicableDate = \(applicableDate)
        weatherStateIconUrl = \(weatherStateIconUrl)
        """
    }
    
}
