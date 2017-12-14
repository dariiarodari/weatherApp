//
//  CityData.swift
//  weatherApp
//
//  Created by Dariia Rodari on 12/14/17.
//  Copyright © 2017 rodariapp. All rights reserved.
//

import Foundation

class  CityData {
    static let shared = CityData()
    
    var cities = [City(cityName: "London", countryName: "United Kingdom"),City(cityName: "Kyiv", countryName: "Ukraine"),City(cityName: "Madrid", countryName: "Spain"),City(cityName: "Kathmandu", countryName: "Nepal"),City(cityName: "Astana", countryName: "Kazakhstan")]
}
