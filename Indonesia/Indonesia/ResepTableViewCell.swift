//
//  ResepTableViewCell.swift
//  Indonesia
//
//  Created by SMK IDN MI on 11/23/17.
//  Copyright © 2017 Djoendhie. All rights reserved.
//

import UIKit

class ResepTableViewCell: UITableViewCell {
    @IBOutlet weak var labelResep: UILabel!
    @IBOutlet weak var labelOrang: UILabel!
    @IBOutlet weak var labelWaktu: UILabel!
    @IBOutlet weak var labelHarga: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
