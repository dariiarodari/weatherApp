//
//  CitySearchViewController.swift
//  weatherApp
//
//  Created by Dariia Rodari on 12/14/17.
//  Copyright © 2017 rodariapp. All rights reserved.
//

import UIKit

class CitySearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    @IBOutlet weak var cityTableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private var filteredCities = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        
        cityTableView.tableHeaderView = searchController.searchBar
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        cityTableView.register(UINib(nibName: "CityWeatherCell", bundle: nil), forCellReuseIdentifier: "CityWeatherCell")
        
        cityTableView.tableFooterView = UIView()
        
        self.filteredCities = CityData.shared.cities
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityCell = cityTableView.dequeueReusableCell(withIdentifier: "CityWeatherCell", for: indexPath) as! CityWeatherCell
        
        let city = filteredCities[indexPath.row]
        
        cityCell.configure(with: city)
        
        return cityCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
    // MARK: - Search bar updater
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let lowerCasedQuery = searchController.searchBar.text?.lowercased() else { return }
        
        if lowerCasedQuery == "" {
            if filteredCities.count != CityData.shared.cities.count {
            
            filteredCities = CityData.shared.cities
            cityTableView.reloadSections([0], with: UITableViewRowAnimation.none)
        }
        
    } else {
    
    let filtered = CityData.shared.cities.filter { city -> Bool in
    let lowerCasedCityName = city.cityName.lowercased()
    
    return lowerCasedCityName.contains(lowerCasedQuery)
    }
    
    filteredCities = filtered
    cityTableView.reloadSections([0], with: UITableViewRowAnimation.fade)
    
    }
}

}
