//
//  Copyright © 2019 Agustin Olmedo. All rights reserved.
//

import UIKit

extension AlbumDetailListViewController {

    // MARK: - CollectionView
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let photos = photos {
             return photos.count
         } else {
             return 0
         }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? AlbumDetailListCollectionViewCell {
            cell.photo = photos?[indexPath.row]
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoToPresent = self.photos?[indexPath.row]
            
        performSegue(withIdentifier: reuseSegue, sender: photoToPresent)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
  
    func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
   // MARK: - Navigation Prepare

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // When a collection view cell is selected, prepare for the segue to the PhotoViewController.
       if segue.identifier == reuseSegue {
           if let photoVC = segue.destination as? PhotoViewController  {
                   let photoToPresent = sender as! Photo?
                   photoVC.photo = photoToPresent
           }
       }
    }
}
