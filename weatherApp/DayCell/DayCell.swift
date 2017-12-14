//
//  DayCell.swift
//  weatherApp
//
//  Created by Dariia Rodari on 12/14/17.
//  Copyright © 2017 rodariapp. All rights reserved.
//

import UIKit

class DayCell: UITableViewCell {

    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure (with weather: ConsolidatedWeather) {
        weekdayLabel.text = weather.applicableDate
        maxTempLabel.text = String(weather.maximumTempreture)
        minTempLabel.text = String(weather.minimumTempreture)
    }
    
}
