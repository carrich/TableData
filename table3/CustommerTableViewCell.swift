//
//  CustommerTableViewCell.swift
//  table3
//
//  Created by Ngoduc on 5/22/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit

class CustommerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var phoneLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var imageName: UIImageView!
    var person: Person1?{
        didSet{
            if let data = person{
                imageName.image = data.avatarImage
                nameLable.text = data.name
                phoneLable.text = data.phone
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .orange
        imageName.layer.cornerRadius = imageName.bounds.height/2
        imageName.layer.masksToBounds = true
        imageName.layer.borderWidth = 1
        imageName.layer.borderColor = UIColor.white.cgColor
        imageName.backgroundColor = .blue
        imageName.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
