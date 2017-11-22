//
//  FuelPressureUtil.swift
//  OBD II wifi
//
//  Created by Lucas Bicca on 14/10/17.
//  Copyright © 2017 MacBook Pro. All rights reserved.
//

import Foundation
open class FuelPressureUtil {
    
    open class func formatPressure(result: String) throws -> String {
        if (ResultUtil.hasNoData(result: result) || ResultUtil.isUnableToConnect(result: result)) {
            return "-"
        }
        let stringArray = result.components(separatedBy: " ")
        if (stringArray.count < 3) {
            throw CommandError.indexError
        }
        let desiredData = stringArray[2]
        let fuelPressure = UInt8(desiredData, radix: 16)
        let fuelPressureCalculated: UInt = UInt(fuelPressure! * 3)
        return "\(String(fuelPressureCalculated)) kPa"
    }
}
