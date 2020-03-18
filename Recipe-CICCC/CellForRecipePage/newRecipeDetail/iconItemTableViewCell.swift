//
//  iconItemTableViewCell.swift
//  RecipeTest
//
//  Created by 北島　志帆美 on 2019-11-28.
//  Copyright © 2019 北島　志帆美. All rights reserved.
//

import UIKit

protocol iconItemTableViewCellDelegate: class{
    func increaseLike()
}

class iconItemTableViewCell: UITableViewCell {

    @IBOutlet weak var numLikeLabel: UILabel!
    
    weak var delegate: iconItemTableViewCellDelegate?
    
    @IBAction func increaseLike(_ sender: UIButton) {
        self.delegate?.increaseLike()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
               // Configure the view for the selected state
    }

}