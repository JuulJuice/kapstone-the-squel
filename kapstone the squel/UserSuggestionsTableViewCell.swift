//
//  UserSuggestionsTableViewCell.swift
//  kapstone the squel
//
//  Created by Lisette Antigua on 3/10/22.
//

import UIKit

class UserSuggestionsTableViewCell: UITableViewCell {
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet var symbolLabel: UILabel!

    @IBOutlet weak var gameGenre: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func update(with s: Suggestions) {
        symbolLabel.text = s.gameName
        gameGenre.text = s.genre
        gameImage.image = s.image
       
    }


}
