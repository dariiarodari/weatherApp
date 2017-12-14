//
//  MainWeatherViewController.swift
//  weatherApp
//
//  Created by Dariia Rodari on 12/11/17.
//  Copyright © 2017 rodariapp. All rights reserved.
//

import UIKit

class MainWeatherViewController: UIViewController {

    @IBOutlet weak var MainWeatherForecastTableView: UITableView!
    
    private var weatherForcasts = [ConsolidatedWeather]()
//    struct Constants {
//        static let DayWeatherCellIdentifier = "DayWeatherTableViewCellIdentifier"
//        static let CellHeight: CGFloat = 44
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        MainWeatherForecastTableView.register(UINib(nibName: "DayCell", bundle: nil), forCellReuseIdentifier: "DayCell")

        MainWeatherForecastTableView.delegate = self
        MainWeatherForecastTableView.dataSource = self

        MainWeatherForecastTableView.tableFooterView = UIView()

        loadData()

    }

    func loadData() {
        guard let url = URL(string:"https://www.metaweather.com/api/location/924938") else { return }

        URLSession.shared.dataTask(with: url) { [weak self] (data, responce, error) in
            guard let `self` = self else { return }
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let data = data else { return }
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any],
                        let consolidatedWeatherArray = json["consolidated_weather"] as? [Any]
                        else { return }

                    for weather in consolidatedWeatherArray {
                        guard let weatherJson = weather as? [String:Any],
                            let newWeatherForcast = ConsolidatedWeather(json: weatherJson)
                            else { continue }

                        self.weatherForcasts.append(newWeatherForcast)

                    }
//                    print(self.weatherForcasts.count)
                    DispatchQueue.main.async {
                        self.MainWeatherForecastTableView.reloadSections([0], with: .left)
                    }


                } catch {

                }
            }

            } .resume()
    }

}

extension MainWeatherViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherForcasts.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as! DayCell

        cell.configure(with: weatherForcasts[indexPath.row])
        return cell
//        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

}
