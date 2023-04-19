//
//  VideoMusicHelper.swift
//  MyApplication
//
//  Created by Rome on 4/17/23.
//

import Foundation
import MediaPlayer

import MediaPlayer

func getAppsUsingVideo() -> [String] {
    var appsWithVideoAccess = [String]()
    
    let mediaType: MPMediaType = .anyVideo
    let predicate = MPMediaPropertyPredicate(value: mediaType.rawValue, forProperty: MPMediaItemPropertyMediaType)
    let query = MPMediaQuery(filterPredicates: [predicate])
    guard let items = query.items else { return appsWithVideoAccess }
        
    for item in items {
        let assetURL = item.assetURL
        if let host = assetURL?.host {
            appsWithVideoAccess.append(host)
        }
    }
    
    return appsWithVideoAccess
}

func getAppsUsingMusic() -> [String] {
    var appsWithMusicAccess = [String]()
    
    let mediaType: MPMediaType = .music
    let predicate = MPMediaPropertyPredicate(value: mediaType.rawValue, forProperty: MPMediaItemPropertyMediaType)
    let query = MPMediaQuery(filterPredicates: [predicate])
    guard let items = query.items else { return appsWithMusicAccess }
    
    for item in items {
        if let assetURL = item.assetURL,
           let components = URLComponents(url: assetURL, resolvingAgainstBaseURL: false),
           let host = components.host {
            appsWithMusicAccess.append(host)
        }
    }
    
    return appsWithMusicAccess
}
