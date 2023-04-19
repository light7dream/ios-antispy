//
//  RemindersHelper.swift
//  MyApplication
//
//  Created by Rome on 4/13/23.
//

import Foundation
import EventKit

func getAppsUsingReminders()->[String]{
    var apps = [String]()
    let eventStore = EKEventStore()
    eventStore.requestAccess(to: .reminder, completion:
                                {(granted: Bool, error: Error?) -> Void in
        if granted {
            let reminderSources = eventStore.sources
            
            
            for source in reminderSources {
                let calenderTitle = source.title
                if let _ = calenderTitle.range(of: "Reminders", options: [.caseInsensitive]) {
                    apps.append(calenderTitle)
                    //print(calenderTitle)
                }
            }
            
        } else {
            print("Access denied")
        }
    })
    return apps
}
