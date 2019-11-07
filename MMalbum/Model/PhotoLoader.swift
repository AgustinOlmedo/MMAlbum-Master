//
//  PhotoLoader.swift
//  MMAlbum
//
//  Created by Macmini2 on 24/10/2019.
//  Copyright © 2019 Agustin Olmedo. All rights reserved.
//

import Foundation

let sharedPhotoLoader = PhotoLoader()

class PhotoLoader {
    private let thumbnailPhotoDataCache = NSCache <NSString, NSData> ()
    private let fullSizePhotoDataCache = NSCache <NSString, NSData> ()

    func loadThumbnailPhotoData(photo: Photo, completion: @escaping (_ fetchedData: Data?, _ fetchedPhoto: Photo) -> Void) {
        if let url = URL(string: photo.thumbnailUrl) {
            loadPhotoData(url: url, photoId: String(photo.id), cache: thumbnailPhotoDataCache) { (data) in
                completion(data, photo)
            }
        } else {
            completion(nil, photo)
        }
    }
    
    func loadFullSizePhotoData(photo: Photo, completion: @escaping (_ fetchedData: Data?,_ fetchedPhoto: Photo) -> Void) {
        if let url = URL(string: photo.url) {
            loadPhotoData(url: url, photoId: String(photo.id), cache: fullSizePhotoDataCache) { (data) in
                completion(data, photo)
            }
        } else {
            completion(nil, photo)
        }
    }
    

    private func loadPhotoData(url: URL, photoId: String, cache: NSCache <NSString, NSData>, completion: @escaping (_ fetchedData: Data?) -> Void) {
        if let photoData = cache.object(forKey: photoId as NSString) {
            completion(photoData as Data)
        } else {
            DispatchQueue.global(qos: .userInitiated).async {
                if let photoData = try? Data(contentsOf: url) {
                    cache.setObject(photoData as NSData, forKey: String(photoId) as NSString)
                    
                    DispatchQueue.main.async {
                        completion(photoData)
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            }
        }
    }
}
