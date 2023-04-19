//
//  ContentView.swift
//  MyApplication
//
//  Created by Rome on 4/13/23.
//

import SwiftUI

extension String: Identifiable {
    public var id: String {
        return self
    }
}

struct ContentView: View {
    
    /*
    let appsUsingContacts = getAppsUsingContacts()
    let appsUsingCalendas = getAppsUsingCalendas()
    let appsUsingReminders = getAppsUsingReminders()
    
     */
    let appsUsingPhotos = getAppsUsingPhotos()
     /*
    let appsUsingLocation = getAppsUsingLocation()
    let appsUsingMicrophone = getAppsUsingMicrophone()
    let appsUsingCamera = getAppsUsingCamera()
    let appsUsingMediaLibrary = getAppsUsingMediaLibrary()
    let appsUsingBluetooth = getAppsUsingBluetooth()
     
    let appsUsingVideo = getAppsUsingVideo()
    let appsUsingMusic = getAppsUsingMusic()
     */

    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            /*
            List(appsUsingContacts){app in
                Text(app)
            }
            
            List(appsUsingCalendas){app in
                Text(app)
            }
            
            List(appsUsingReminders){app in
                Text(app)
            }
             */
            List(appsUsingPhotos){app in
                Text(app)
            }
            /*
            List(appsUsingLocation){app in
                Text(app)
            }
            List(appsUsingMicrophone){app in
               Text(app)
            }
            List(appsUsingCamera){app in
               Text(app)
            }
            List(appsUsingMediaLibrary){app in
               Text(app)
            }
            List(appsUsingBluetooth){app in
               Text(app)
            }
            List(appsUsingMusic){app in
               Text(app)
            }
            List(appsUsingVideo){app in
               Text(app)
            }
             */
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
