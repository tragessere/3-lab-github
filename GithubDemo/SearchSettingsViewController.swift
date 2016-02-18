//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Darrell Shi on 2/18/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

protocol SettingsDelegate: class {
    func didSaveSettings(settings: GithubRepoSearchSettings)
}

class SearchSettingsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var delegate: SettingsDelegate?
    var settings: GithubRepoSearchSettings?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSave(sender: AnyObject) {
        delegate?.didSaveSettings(settings!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension SearchSettingsViewController: UITableViewDelegate, UITableViewDataSource, MinStarCellDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SettingCell") as! MinStarTableViewCell
        cell.delegate = self
        cell.slider.value = Float(settings!.minStars)
        cell.minStarCountLabel.text = "\(settings!.minStars)"
        
        return cell
    }
    
    func minStarCell(cell: MinStarTableViewCell, value: Int) {
        settings?.minStars = value
    }
}