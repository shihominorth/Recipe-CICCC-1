//
//  SearchingPageViewController.swift
//  Recipe-CICCC
//
//  Created by 北島　志帆美 on 2020-04-20.
//  Copyright © 2020 Argus Chen. All rights reserved.
//

import UIKit

class SearchingPageViewController: UIPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        let ingredientVC = storyboard?.instantiateViewController(identifier: "ingredientVC") as! SearchingIngredientsViewController
        self.setViewControllers([ingredientVC], direction: .forward, animated: true,completion: nil)
        
        // tapによるページめくりを担当するインスタンスを取得
//        let tapGestureRecognizer = self.gestureRecognizers.filter{ $0 is UITapGestureRecognizer }.first as! UITapGestureRecognizer
        
//        tapGestureRecognizer.isEnabled = false
        
        
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



//extension SearchingPageViewController: SearchingViewControllerDelegate {
//    func segmentSetted(index: Int) {
//
//        let genreVC = storyboard?.instantiateViewController(identifier: "genreVC") as! SearchingGenreViewController
//        let ingredientVC = storyboard?.instantiateViewController(identifier: "ingredientVC") as! SearchingIngredientsViewController
//        let creatorVC = storyboard?.instantiateViewController(identifier: "creatroVC") as! SearchingCreatorsViewController
//
//        let VCs = [ingredientVC,genreVC,creatorVC]
//        self.setViewControllers([VCs[index]], direction: .forward, animated: true, completion: nil)
//    }
//}