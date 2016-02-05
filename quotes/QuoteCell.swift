//
//  QuoteCell.swift
//  quotes
//
//  Created by mac33 on 5/2/16.
//  Copyright © 2016 mac33. All rights reserved.
//

import UIKit

class QuoteCell: UITableViewCell {

    @IBOutlet weak var listImageView: UIImageView!
    
    @IBOutlet weak var roundBackgroundLetter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
