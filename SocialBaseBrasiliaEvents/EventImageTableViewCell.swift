//
//  EventImageTableViewCell.swift
//  SocialBaseBrasiliaEvents
//
//  Created by Michel Monteiro on 11/12/16.
//  Copyright © 2016 Willian Pinho. All rights reserved.
//

import UIKit

class EventImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
