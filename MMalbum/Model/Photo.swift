//
//  Album.swift
//  MMAlbum
//
//  Created by Macmini2 on 24/10/2019.
//  Copyright © 2019 Agustin Olmedo. All rights reserved.
//

import Foundation
import Alamofire

struct Photo: Codable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
    
    private struct PhotoConstants {
        static let PhotoRoute = "https://jsonplaceholder.typicode.com/photos"
        static let AlbumId = "albumId"
    }
    
    static func loadPhotos(albumId: Int, completion: @escaping (_ success: Bool, _ photos:[Photo]?) -> Void) {
        Alamofire.request(PhotoConstants.PhotoRoute + "?" + PhotoConstants.AlbumId + "=" + String(albumId)).responseJSON { response in
            if let data = response.data {
                if let photoData = try? JSONDecoder().decode([Photo].self, from: data) {
                    completion(true, photoData)
                } else {
                    completion(false, nil)
                }
            } else {
                completion(false, nil)
            }
        }
    }
}
