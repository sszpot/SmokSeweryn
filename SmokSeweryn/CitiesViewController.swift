//
//  CitiesViewController.swift
//  SmokSeweryn
//
//  Created by Sebastian Kaletka on 14/02/2017.
//  Copyright © 2017 skaletka. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    

    @IBOutlet weak var topMessageLabel: UILabel!
    @IBOutlet weak var cityPicker: UIPickerView!
    @IBOutlet weak var changeCityButton: UIButton!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let cities = ["Kraków", "Tarnów", "Nowy Sącz", "Bochnia", "Brzesko", "Chrzanów", "Dąbrowa Tarnowska", "Gorlice", "Krynica Zdrój", "Limanowa", "Miechów", "Myślenice", "Nowy Targ", "Olkusz", "Oświęcim", "Proszowice", "Skawina", "Sucha Beskidzka", "Trzebinia", "Tuchów", "Wadowice", "Wieliczka", "Zakopane"]
    var currentCityIndex : Int = 1

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cityPicker.dataSource = self
        cityPicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func changeCityButtonTapped(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
        appDelegate.getSmogApi().downloadDataOfCityWith(id: currentCityIndex)
    }

    // PICKER VIEW DATA SOURCE
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Selected: \(cities[row])")
        currentCityIndex = row + 1
    }
    
}
