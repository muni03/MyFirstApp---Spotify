//
//  API.swift
//  MyFirstApp
//
//  Created by Peter Muniz on 8/27/18.
//  Copyright © 2018 Peter Muniz. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class API {
    static let baseURLString = "https://api.spotify.com/v1/search"
    static func searchTracks(_ query: String,
                             onCompleted: @escaping (([SpotifyTrack]) -> Void),
                             onError: @escaping ((Error) -> Void)) {
    guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
    onError(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "could not create url encoded string for search query \(query)" ]))
    return
    }
    
    let urlString = baseURLString + "?type=track&q=" + encodedQuery
    let headers = [
    "Accept": "application/json",
    "Authorization": "Bearer BQAx-RgsVpiws_0K4ctfhhEYcZgNALKDNbobLexvd5z0sM8Mf2UYXFt7KAXL-LCg9PsvTEKk5CSlpOM5EPCdc1LqeUV_xoWIrDGMVF0E2WTsfCIIeT7bmNMB7RmS0m3VSLifguTJkv-i"]
    
    Alamofire
    .request(urlString, headers: headers)
    .responseArray(keyPath: "tracks.items") { (response: DataResponse<[SpotifyTrack]>) in
        if let tracks = response.value {
                onCompleted(tracks)
        }
            
        else if let error = response.error {
                onError(error)
        }
    }
    }
}
