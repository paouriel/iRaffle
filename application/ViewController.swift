//
//  ViewController.swift
//  application
//
//  Created by ITS-OJT on 18/01/2018.
//  Copyright © 2018 ITS-OJT. All rights reserved.
//

import UIKit

class ItemViewCell: UITableViewCell {
    
    @IBOutlet weak var itemButton: UIButton!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemVenue: UILabel!
    @IBOutlet weak var itemAddress: UILabel!
    @IBOutlet weak var itemTime: UILabel!
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let itemTitles = ["Summer Linkages", "URC: The Future", "Battle of the Bands"]
    let itemVenues = ["TIP QC", "TIP MLA", "Gateway"]
    let itemAddresses = ["Anonas, Quezon City", "Arlegui, Manila", "Cubao, Quezon City"]
    let itemTimes = ["10:30AM - 2:30PM", "1:30PM - 6:30PM", "7:30AM - 10:30AM"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemTitles.count
    }
    
    func buttonTapped(_ index: Int) {
        let destination = RaffleController()
        destination.sampleLabel.text = String(describing: index)
        destination.performSegue(withIdentifier: "segue_raffle", sender: self)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemViewCell
        
        cell.itemButton.tag = indexPath.row
        cell.itemButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControlEvents.touchUpInside)
        
        cell.itemTitle.text = itemTitles[indexPath.row]
        cell.itemVenue.text = itemVenues[indexPath.row]
        cell.itemAddress.text = itemAddresses[indexPath.row]
        cell.itemTime.text = itemTimes[indexPath.row]
        
        return cell
    }



}

