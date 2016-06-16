//
//  PhotoCell.swift
//  Tumblr Feed
//
//  Created by Stephanie Angulo on 6/16/16.
//  Copyright © 2016 Stephanie Angulo. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var imagepost: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
