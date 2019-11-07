//
//  Photo.swift
//  MMAlbum
//
//  Created by Macmini2 on 24/10/2019.
//  Copyright © 2019 Agustin Olmedo. All rights reserved.
//

import Foundation
import Alamofire

class Album: Codable {
    var userId: Int
    var id: Int
    var title: String

    private struct AlbumConstants {
        static let AlbumRoute = "https://jsonplaceholder.typicode.com/albums"
    }
      
    static func loadAlbums(completion: @escaping (_ success: Bool, _ albums: [Album]?) -> Void) {
        Alamofire.request(AlbumConstants.AlbumRoute).responseJSON { response in
            if let data = response.data {
                if let albumData = try? JSONDecoder().decode([Album].self, from: data) {
                    
                    completion(true, albumData)
                    
                } else {
                    completion(false, nil)
                }
            } else {
                completion(false, nil)
            }
        }
    }
}
