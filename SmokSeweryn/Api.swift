//
//  Api.swift
//  SmokSeweryn
//
//  Created by Sebastian Kaletka on 13/02/2017.
//  Copyright © 2017 skaletka. All rights reserved.
//

import Foundation
import Unbox

typealias CompletionHandler = (Bool) -> Void

class Api {
    
    fileprivate static let API_URL = "http://powietrze.malopolska.pl/_powietrzeapi/api/dane?act=danemiasta&ci_id="
    
    var delegate : ApiDelegate?
    
    
    private func downloadData(url: String, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let request = URLRequest(url: URL(string: url)!)
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
    }
    
    func downloadDataOfCityWith(id: Int) {
        let url = "\(Api.API_URL)" + "\(id)"
        print(url)
        downloadData(url: url, completionHandler: { (data, response, error) in
            
            let smogData = self.getInfoFromData(data: data)
            DispatchQueue.main.sync {
                self.delegate?.dataDownloadedFor(city: smogData)
            }
        })
    }
    
    
    
    fileprivate func getInfoFromData(data: Data?) -> CityData {
        
        if nil == data {
            return CityData()
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data!) as? [String: Any]
            let cityData : CityData = try unbox(dictionary: json!, atKey: "dane")
            return cityData
            
        } catch {
            print("Can't get the info from data: \(error)")
            return CityData()
        }
    }
    
}
