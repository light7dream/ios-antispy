//
//  BluetoothHelper.swift
//  MyApplication
//
//  Created by Rome on 4/17/23.
//

import Foundation
import CoreBluetooth

func getAppsUsingBluetooth() -> [String] {
    var appsUsingBluetooth = [String]()
    
    let centralManager = CBCentralManager()
    let peripherals = centralManager.retrieveConnectedPeripherals(withServices: [])
    
    if !peripherals.isEmpty {
        for peripheral in peripherals {
            if let name = peripheral.name {
                let appName = getAppName(fromString: name)
                appsUsingBluetooth.append(appName)
            }
        }
    }
    
    return appsUsingBluetooth
}

func getAppName(fromString string: String) -> String {
    if let endIndex = string.range(of: "(", options: .backwards)?.lowerBound {
        let truncated = string[..<endIndex]
        return String(truncated)
    } else {
        return string
    }
}
