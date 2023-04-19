//
//  MediaLibraryHelper.swift
//  MyApplication
//
//  Created by Rome on 4/17/23.
//

import Foundation
import Photos

func getAppsUsingMediaLibrary() -> [String] {
    var appsUsingMediaLibrary = [String]()
    
    let status = PHPhotoLibrary.authorizationStatus()
    
    if case .authorized = status {
        // User has already granted access to the photo library
        
        let results = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        
        results.enumerateObjects { (collection, _, _) in
            guard let appName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String else {
                return
            }
            
            let result = PHAsset.fetchAssets(in: collection, options: nil)
            if result.count > 0 {
                appsUsingMediaLibrary.append(appName)
            }
        }
    }
    
    return appsUsingMediaLibrary
}
