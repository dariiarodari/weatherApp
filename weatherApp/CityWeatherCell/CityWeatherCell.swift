//
//  CityWeatherCell.swift
//  weatherApp
//
//  Created by Dariia Rodari on 12/14/17.
//  Copyright © 2017 rodariapp. All rights reserved.
//

import UIKit

class CityWeatherCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure (with city: City) {
        cityNameLabel.text = city.cityName
        countryNameLabel.text = city.countryName
    }
    
}
