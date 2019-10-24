//
//  Copyright © 2019 Agustin Olmedo. All rights reserved.
//

import UIKit

extension AlbumListViewController {

    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
          return "Albums"
      }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTableView) as! AlbumListCollectionTableViewCell
        
        cell.selectionStyle = .none
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! AlbumListCollectionTableViewCell
        cell.collectionView.reloadData()
        cell.collectionView.contentOffset = .zero
    }
}
