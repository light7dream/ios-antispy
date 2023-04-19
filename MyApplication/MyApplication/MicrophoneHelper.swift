//
//  MicrophoneHelper.swift
//  MyApplication
//
//  Created by Rome on 4/13/23.
//

import Foundation
import AVFoundation

func getAppsUsingMicrophone() -> [String] {
    var appsUsingMicrophone = [String]()
    
    let session = AVAudioSession.sharedInstance()
    let currentRoute = session.currentRoute
    
    for outputPort in currentRoute.outputs {
        if outputPort.portType == .builtInMic || outputPort.portType == .headsetMic {
            // Check if the built-in or headset microphone is selected as the audio input route
            
            let appDescriptions = session.availableInputs?.compactMap { $0.portName } ?? []
            
            for description in appDescriptions {
                if !description.contains("iPhone Microphone") && !description.contains("Headset Microphone") {
                    // Assume that any app with a port name that doesn't contain "iPhone Microphone" or "Headset Microphone"
                    // has requested microphone access
                    
                    let appName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? ""
                    
                    appsUsingMicrophone.append(appName)
                }
            }
        }
    }
    
    return appsUsingMicrophone
}
