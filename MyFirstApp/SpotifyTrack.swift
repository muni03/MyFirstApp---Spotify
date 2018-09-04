//
//  SpotifyTrack.swift
//  MyFirstApp
//
//  Created by Peter Muniz on 8/27/18.
//  Copyright © 2018 Peter Muniz. All rights reserved.
//

import Foundation
import ObjectMapper

class SpotifyTrack: Mappable {
    var id: String?
    var artist: String?
    var name: String?
    var albumName: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        artist <- map["artists.0.name"]
        name <- map["name"]
        albumName <- map["album.name"]
    }
}
