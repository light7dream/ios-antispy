//
//  PhotosHelper.swift
//  MyApplication
//
//  Created by Rome on 4/13/23.
//

import Foundation
import Photos

func getAppsUsingPhotos() -> [String] {
    let allBundles = Bundle.allBundles
    let photoLibraryUsageKey = "NSPhotoLibraryUsageDescription"
    let allowedApps = NSMutableSet()
    let accessApps = [String]()
    for bundle in allBundles {
        guard let bundleIdentifier = bundle.bundleIdentifier else { continue }

        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        if status == .authorized {
            if let _ = bundle.object(forInfoDictionaryKey: photoLibraryUsageKey) {
                allowedApps.add(bundleIdentifier)
            }
        }
    }
    
    print("Apps with permission to access photo library: \(allowedApps)")
    return accessApps
}

/*
 import Photos

 let photoLibraryStatus = PHPhotoLibrary.authorizationStatus()

 switch photoLibraryStatus {
 case .authorized:
     // Get list of apps that have access to photos
     let appsWithPhotoAccess = PHPhotoLibrary.shared().performChangesAndWait {
         let appsWithAccess = PHCollectionList.fetchCollectionLists(with: .momentList, subtype: .any, options: nil)
         return appsWithAccess.collections
     }
         
     print("Apps with access to Photos:")
     for app in appsWithPhotoAccess {
         print(app.localizedTitle ?? "Unknown App")
     }
     
 case .notDetermined:
     // Ask user for permission to access photos
     PHPhotoLibrary.requestAuthorization { status in
         if status == .authorized {
             // Get list of apps that have access to photos
             let appsWithPhotoAccess = PHPhotoLibrary.shared().performChangesAndWait {
                 let appsWithAccess = PHCollectionList.fetchCollectionLists(with: .momentList, subtype: .any, options: nil)
                 return appsWithAccess.collections
             }
             
             print("Apps with access to Photos:")
             for app in appsWithPhotoAccess {
                 print(app.localizedTitle ?? "Unknown App")
             }
         } else {
             print("User denied access to Photos")
         }
     }
     
 case .denied, .restricted:
     print("User denied access to Photos")
 }

 
 */
