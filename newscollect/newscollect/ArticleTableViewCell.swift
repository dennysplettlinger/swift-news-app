//
//  ArticleTableViewCell.swift
//  newscollect
//
//  Created by dennys Plettlinger on 12.05.20.
//  Copyright © 2020 dennysplettlinger. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {


    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleTextLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
