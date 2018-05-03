//
//  TableViewCell.swift
//  Demo_Rule30
//
//  Created by uBack on 5/3/18.
//  Copyright © 2018 rule30Demo. All rights reserved.
//

import UIKit

final class TableViewCell: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
    }


}
