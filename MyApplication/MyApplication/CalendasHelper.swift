//
//  CalendasHelper.swift
//  MyApplication
//
//  Created by Rome on 4/13/23.
//

import Foundation
import EventKit

func getAppsUsingCalendas() -> [String] {
    
    let eventStore = EKEventStore()
    var apps = [String]()
    // request access to the event store
    eventStore.requestAccess(to: .event) { (granted, error) in
        // check if access is granted
        if granted {
            // get all sources
            let sources = eventStore.sources
            
            // loop through each source and print its name
            for source in sources {
                
                let calendars = source.calendars(for: .event)
                
                for calendar in calendars {
                    //print(calendar.title)
                    apps.append(calendar.title)
                }
            }
        } else {
            print("Access denied")
        }
    }
    print(apps)
    return apps
    
}
