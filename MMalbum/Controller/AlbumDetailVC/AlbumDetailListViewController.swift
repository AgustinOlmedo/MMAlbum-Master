//
//  Copyright © 2019 Agustin Olmedo. All rights reserved.
//

import UIKit

class AlbumDetailListViewController:  UICollectionViewController, UICollectionViewDelegateFlowLayout {
   
    // MARK: - Properties
    
    let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    let itemsPerRow: CGFloat = 3
    let reuseIdentifier = "AlbumDetailListCollectionViewCell"
    let reuseSegue = "ShowPhotoSegue"
    
    var album: Album? {
        didSet {
            if let album = album {
                title = album.title
                
                Photo.loadPhotos(albumId: album.id, completion: { [weak self] (success, photoData) in
                    if let data = photoData, success {
                        self?.photos = data;
                    } else {
                        self?.photos = nil;
                    }
                })
            }
        }
    }

    var photos: [Photo]? {
        didSet {
            collectionView.reloadData()
        }
    }
}

