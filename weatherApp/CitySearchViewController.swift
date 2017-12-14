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
//    private var filteredCities = [City]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        
        cityTableView.tableHeaderView = searchController.searchBar
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        cityTableView.register(UINib(nibName: "CityWeatherCell", bundle: nil), forCellReuseIdentifier: "CityWeatherCell")
        
        cityTableView.tableFooterView = UIView()

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CityData.shared.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityCell = cityTableView.dequeueReusableCell(withIdentifier: "CityWeatherCell", for: indexPath) as! CityWeatherCell
        
        let city = CityData.shared.cities[indexPath.row]
        
        cityCell.configure(with: city)
        
        return cityCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
    // MARK: - Search bar updater
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text)
    }

}
