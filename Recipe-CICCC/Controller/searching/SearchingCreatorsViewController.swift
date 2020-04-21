//
//  SearchingCreatorsViewController.swift
//  Recipe-CICCC
//
//  Created by 北島　志帆美 on 2020-04-20.
//  Copyright © 2020 Argus Chen. All rights reserved.
//

import UIKit
import Firebase

class SearchingCreatorsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let dataManager = SearchingDataManager()
    
    var searchedCreators: [User] = []
    var searchingWord = ""
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        let query = db.collection("user").whereField("name", isGreaterThanOrEqualTo: searchingWord)
        
        if searchingWord != "" {
            dataManager.getSearchedCreator(query: query)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchingCreatorsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ( tableView.dequeueReusableCell(withIdentifier: "serchingCreator", for: indexPath) as? SearchingCreatorTableViewCell)!
        
        cell.creatorNameLabel.text = "test"
        cell.imgView.image = #imageLiteral(resourceName: "download1")
        
        return cell
    }
    
}


extension SearchingCreatorsViewController: UISearchBarDelegate {
}
