//
//  OBDAmbientAirTemperatureUtil.swift
//  OBD II wifi
//
//  Created by Lucas Bicca on 14/10/17.
//  Copyright © 2017 MacBook Pro. All rights reserved.
//

import Foundation
open class AmbientAirTemperatureUtil {
    
    open class func calculeTemperature(result: String) throws -> String {
        print("AmbientAirTemperatureUtil calculeTemperature: \(result)")
        if (ResultUtil.hasNoData(result: result) || ResultUtil.isUnableToConnect(result: result)) {
            return "-"
        }
        let subractNeeded: UInt8 = 40
        let stringArray: [String]! = result.components(separatedBy: " ")
        if (stringArray.count < 3) {
            throw CommandError.indexError
        }
        let desiredData = stringArray[2]
        if let value = UInt8(desiredData, radix: 16) {
            return "\(String(value - subractNeeded)) ºC"
        }
        return "-"
    }
}
