//
//  ViewController.swift
//  SmokSeweryn
//
//  Created by Sebastian Kaletka on 13/02/2017.
//  Copyright © 2017 skaletka. All rights reserved.
//
protocol ApiDelegate {
    func dataDownloadedFor(city: CityData)
}

import UIKit

class MainViewController: UIViewController, ApiDelegate {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    
    @IBOutlet weak var pm10value: UILabel!
    @IBOutlet weak var pm10label: UILabel!
    
    @IBOutlet weak var pm25value: UILabel!
    @IBOutlet weak var pm25label: UILabel!
    
    @IBOutlet weak var no2value: UILabel!
    @IBOutlet weak var no2label: UILabel!
    
    @IBOutlet weak var unitLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        appDelegate.getSmogApi().delegate = self
        
        appDelegate.getSmogApi().downloadDataOfCityWith(id: 1)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func dataDownloadedFor(city: CityData) {
        cityNameLabel.text = city.ci_citydesc
		
		if city.stations.count > 0 {
			
			stationNameLabel.text = city.stations[0].station_name
			
			if let details = city.stations[0].details {
				unitLabel.isHidden = false
				for every in details {
					if every.par_name == "pm10" {
						pm10value.text = String(every.o_value)
						pm10label.text = "pm10"
					} else if every.par_name == "pm2.5" {
						pm25value.text = String(every.o_value)
						pm25label.text = "pm2.5"
					} else if every.par_name == "no2" {
						no2value.text = String(every.o_value)
						no2label.text = "no2"
					}
				}
				
				if details.count > 0 { unitLabel.text = city.stations[0].details?[0].par_unit }
			}
		} else {
			pm10value.text = "Brak danych"
			pm25value.text = "Brak danych"
			no2value.text = "Brak danych"
			unitLabel.isHidden = true
			presentAlertNoDataFor(city: city.ci_citydesc)
		}
	}
	
	func presentAlertNoDataFor(city: String) {
		let alertController = UIAlertController(title: "Brak danych", message: "Obecnie nie ma danych dla miasta \(city). Wybierz inne miasto z listy.", preferredStyle: UIAlertControllerStyle.alert)

		let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
			(result : UIAlertAction) -> Void in
			print("OK")
		}

		alertController.addAction(okAction)
		self.present(alertController, animated: true, completion: nil)
	}
	
	@IBAction func presentPM10info(_ sender: UIButton) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "info") as! InfoViewController
		vc.smogType = Smog.pm10
		self.present(vc, animated: true, completion: nil)
	}
	
	@IBAction func presentPM25info(_ sender: UIButton) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "info") as! InfoViewController
		vc.smogType = Smog.pm25
		self.present(vc, animated: true, completion: nil)
	}
	
	@IBAction func presentNO2info(_ sender: UIButton) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "info") as! InfoViewController
		vc.smogType = Smog.no2
		self.present(vc, animated: true, completion: nil)
	}

}

