//
//  Copyright © 2019 Agustin Olmedo. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Properties
    
    @IBOutlet private weak var imageView: UIImageView!
    
    var photo: Photo?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let existingPhoto     = photo {
            sharedPhotoLoader.loadFullSizePhotoData(photo: existingPhoto) { [weak self] (data, fetchedPhoto) in
                if let photoData = data, self?.photo?.id == fetchedPhoto.id {
                    self?.imageView.image = UIImage(data: photoData)
                }
            }
        }
    }
 
    // MARK: - UIScrollView

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
