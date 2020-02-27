//
//  WeekdayTableViewCell.swift
//  TODO-list
//
//  Created by Ivan Lutaenko on 3/18/19.
//  Copyright © 2019 Ivan Lutaenko. All rights reserved.
//

import UIKit

class WeekdayTableViewCell: UITableViewCell {

    @IBOutlet private weak var ibImageView: UIImageView!
    @IBOutlet private weak var ibWeekdayName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    func update(image: UIImage, name: String){
        ibImageView.image = image
        ibWeekdayName.text = name
    }
    
    
}
