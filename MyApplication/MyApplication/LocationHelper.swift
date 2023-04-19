//
//  LocationHelper.swift
//  MyApplication
//
//  Created by Rome on 4/13/23.
//

import Foundation
import CoreLocation

func getListOfAppsUsingLocation() -> [String] {
    var appsUsingLocation = [String]()
    
    let locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    
    if authorizationStatus == .authorizedAlways || authorizationStatus == .authorizedWhenInUse {
        for app in Bundle.allBundles {
            let hasLocationAlwaysUsageDescription = app.object(forInfoDictionaryKey: "NSLocationAlwaysUsageDescription") != nil
            let hasLocationWhenInUseUsageDescription = app.object(forInfoDictionaryKey: "NSLocationWhenInUseUsageDescription") != nil
            
            if hasLocationAlwaysUsageDescription || hasLocationWhenInUseUsageDescription {
                let appName = app.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? ""
                appsUsingLocation.append(appName)
            }
        }
    }
    
    return appsUsingLocation
}

func getAppsUsingLocation() -> [String] {
    
    // Usage:
    let appsUsingLocation = getListOfAppsUsingLocation()
    print(appsUsingLocation)
    return appsUsingLocation
}
