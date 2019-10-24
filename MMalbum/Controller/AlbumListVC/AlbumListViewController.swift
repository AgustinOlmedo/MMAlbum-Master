//
//  Copyright © 2019 Agustin Olmedo. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class AlbumListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {

    // MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var album :  Album?
    var albums: [Album]?
    let reuseIdentifierTableView: String = "AlbumListCollectionTableViewCell"
    let reuseIdentifierCell     : String = "AlbumListCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadAlbums()
        
        tableView.dataSource      = self
        tableView.delegate        = self
        tableView.tableFooterView = UIView()
    }

    func loadAlbums() {
        Album.loadAlbums { [weak self] (success, albumData) in
            if let data           = albumData, success {
                self?.albums      = data;
                self?.tableView.reloadData()
            } else {
                self?.albums      = nil;
            }
        }
    }
}




