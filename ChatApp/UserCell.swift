//
//  UserCell.swift
//  ChatApp
//
//  Created by Jorge Gomez on 2017-11-14.
//  Copyright © 2017 Jorge Gomez. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

  @IBOutlet weak var userImage: UIImageView!
  @IBOutlet weak var userNameLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
         userImage.image = UIImage(named: "user_default.png")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
