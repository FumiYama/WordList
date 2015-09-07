//
//  ListTableViewCell.swift
//  WordList
//
//  Created by Fumiya Yamanaka on 2015/09/07.
//  Copyright (c) 2015年 Fumiya Yamanaka. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet var japaneseLabel: UILabel!
    @IBOutlet var englishLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
