//
//  CustomGameTableViewCell.swift
//  GameLibrary
//
//  Created by Just Lenz on 29.11.21.
//

import UIKit

class CustomGameTableViewCell: UITableViewCell {

    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
