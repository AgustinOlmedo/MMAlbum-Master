//
//  Copyright © 2019 Agustin Olmedo. All rights reserved.
//

import UIKit

class AlbumDetailListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!

    var photo: Photo? {
        didSet {
            if let existingPhoto = photo {
                sharedPhotoLoader.loadThumbnailPhotoData(photo: existingPhoto) { [weak self] (data, fetchedPhoto) in
                    if let photoData = data, self?.photo?.id == fetchedPhoto.id {
                        self?.imageView.image = UIImage(data: photoData)
                    }
                }
            } else {
                imageView.image = nil
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
