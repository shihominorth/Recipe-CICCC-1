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
    
    var searchedCreators: [User] = [] {
        didSet {
//            tableReload(tableView: self.tableView)
        }
    }
//    var searchedCreators: [User] = []
    var searchedCreatorsImage:[Int:UIImage] = [:] {
    
        didSet {
//            tableReload(tableView: self.tableView)
        }

    }
//    var searchedCreatorsImage:[Int:UIImage] = [:]
    
//    var searchingWord : String = "" {
//        didSet {
//            let query = db.collection("user")
//            dataManager.delegateChild = self
//            dataManager.getSearchedCreator(query: query, searchingWord: searchingWord)
//        }
//    }
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        dataManager.delegateChild = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()

        
        let query = db.collection("user")
        
//        if searchingWord != "" {
//            dataManager.getSearchedCreator(query: query, searchingWord: searchingWord)
//        }
//
    
        
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
        return searchedCreators.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ( tableView.dequeueReusableCell(withIdentifier: "serchingCreator", for: indexPath) as? SearchingCreatorTableViewCell)!
        
        if  !searchedCreators.isEmpty && !searchedCreators.isEmpty {
            cell.creatorNameLabel.text = searchedCreators[indexPath.row].name
            cell.imgView.image = searchedCreatorsImage[indexPath.row]
        }
        
        return cell
    }
    
}

extension SearchingCreatorsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let id = searchedCreators[indexPath.row].userID
        
        if id == Auth.auth().currentUser?.uid {
            
            let profileVC = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(identifier: "User profile") as! MyPageViewController
            navigationController?.pushViewController(profileVC, animated: true)
            
        } else {
            let profileVC = UIStoryboard(name: "creatorProfile", bundle: nil).instantiateViewController(identifier: "creatorProfile") as! CreatorProfileViewController
            profileVC.id = id
            navigationController?.pushViewController(profileVC, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}

