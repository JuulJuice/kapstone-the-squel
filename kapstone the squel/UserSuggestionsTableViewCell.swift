//
//  UserSuggestionsTableViewCell.swift
//  kapstone the squel
//
//  Created by Lisette Antigua on 3/10/22.
//

import UIKit

class UserSuggestionsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        textLabel?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        
       detailTextLabel?.translatesAutoresizingMaskIntoConstraints = false

        let marginguide = contentView.layoutMarginsGuide
       
        imageView?.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
       
          imageView?.leadingAnchor.constraint(equalTo: marginguide.leadingAnchor).isActive = true
       
        textLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        textLabel?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 70).isActive = true
        detailTextLabel?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 100).isActive = true
        detailTextLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: 25).isActive = true
           imageView?.heightAnchor.constraint(equalToConstant: 50).isActive = true
           imageView?.widthAnchor.constraint(equalToConstant: 50).isActive = true
       
        imageView?.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
