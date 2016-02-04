//
//  GithubRepoCell.swift
//  GithubDemo
//
//  Created by Evan on 2/4/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class GithubRepoCell: UITableViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var usernameLabel: UILabel!
	@IBOutlet weak var profileImageView: UIImageView!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var favoriteCountLabel: UILabel!
	@IBOutlet weak var forkCountLabel: UILabel!
	
	var repo: GithubRepo! {
		didSet {
			titleLabel.text = repo.name!
			usernameLabel.text = repo.ownerHandle!
			profileImageView.setImageWithURL(NSURL(string: repo.ownerAvatarURL!)!)
			descriptionLabel.text = repo.repoDescription!
			favoriteCountLabel.text = "\(repo.stars!)"
			forkCountLabel.text = "\(repo.forks!)"
		}
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
