//
//  Copyright © 2019 Agustin Olmedo. All rights reserved.
//

import UIKit

extension AlbumListViewController {

    // MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let albums = albums {
           return albums.count
        } else {
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->  UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierCell, for: indexPath) as? AlbumListCollectionViewCell {
            
            cell.backgroundColor = UIColor.random()
            cell.title.text      = self.albums![indexPath.row].title
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let albumToPresent = self.albums?[indexPath.row]
        performSegue(withIdentifier: "ShowAlbumDetailSegue", sender: albumToPresent)
    }
    
    // MARK: - Navigation Prepare
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // When a table view row is selected, prepare for a segue to the AlbumViewController.
        if segue.identifier == "ShowAlbumDetailSegue" {
            if let albumVC = segue.destination as? AlbumDetailListViewController {
                let albumToPresent = sender as! Album?
                albumVC.album = albumToPresent
                albumVC.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                albumVC.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
}
