//
//  PhotoCell.swift
//  flix
//
//  Created by Eric Huang on 2/4/15.
//  Copyright (c) 2015 Eric Huang. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var mediaImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImage.layer.cornerRadius = profileImage.frame.size.height/2;
        profileImage.layer.masksToBounds = true;
        profileImage.layer.borderWidth = 0;
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
