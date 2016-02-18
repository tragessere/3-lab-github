//
//  MinStarTableViewCell.swift
//  GithubDemo
//
//  Created by Darrell Shi on 2/18/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

protocol MinStarCellDelegate: class {
    func minStarCell(cell: MinStarTableViewCell, value: Int)
}

class MinStarTableViewCell: UITableViewCell {
    @IBOutlet weak var minStarCountLabel: UILabel!
    var delegate: MinStarCellDelegate?

    @IBOutlet weak var slider: UISlider!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func onSliderValueChanged(sender: AnyObject) {
        let slider = sender as! UISlider
        let value = Int(slider.value)
        minStarCountLabel.text = "\(value)"
        delegate?.minStarCell(self, value: value)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
