//
//  CameraHelper.swift
//  MyApplication
//
//  Created by Rome on 4/13/23.
//

import Foundation
import AVFoundation

func getAppsUsingCamera() -> [String] {
    var appsUsingCamera = [String]()
    
    let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera, .builtInTelephotoCamera, .builtInUltraWideCamera], mediaType: .video, position: .unspecified)
    
    for device in discoverySession.devices {
        if let appName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String,
            AVCaptureDevice.authorizationStatus(for: .video) == .authorized {
            // Check if the device has an authorized status
            
            appsUsingCamera.append(appName)
        }
    }
    
    return appsUsingCamera
}
