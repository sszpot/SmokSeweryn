//
//  City.swift
//  SmokSeweryn
//
//  Created by Sebastian Kaletka on 13/02/2017.
//  Copyright © 2017 skaletka. All rights reserved.
//

import Foundation
import Unbox


class CityData : Unboxable {
    
    var ci_id : String
    var ci_citydesc : String
    var stations : [Actual]
    
    required init(unboxer: Unboxer) throws {
        self.ci_id = try unboxer.unbox(keyPath: "city.ci_id")
        self.ci_citydesc = try unboxer.unbox(keyPath: "city.ci_citydesc")
        self.stations = try unboxer.unbox(key: "actual")
    }
    
    init() {
        ci_id = ""
        ci_citydesc = ""
        stations = []
    }
}

struct Actual : Unboxable {
    var station_id : String
    var station_name : String
    var station_hour : Int
    var details : [Details]?
    
    init(unboxer: Unboxer) throws {
        self.station_id = try unboxer.unbox(key: "station_id")
        self.station_name = try unboxer.unbox(key: "station_name")
        self.station_hour = try unboxer.unbox(key: "station_hour")
        self.details = unboxer.unbox(key: "details")
    }
}

struct Details : Unboxable {
    var par_name : String
    var o_value : Int
    var par_unit : String
    
    init(unboxer: Unboxer) throws {
        self.par_name = try unboxer.unbox(key: "par_name")
        self.o_value = try unboxer.unbox(key: "o_value")
        self.par_unit = try unboxer.unbox(key: "par_unit")
    }
}
