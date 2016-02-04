//
//  ViewController.swift
//  quotes
//
//  Created by mac33 on 4/2/16.
//  Copyright © 2016 mac33. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
//        if let cell = tableView.dequeueReusableCellWithIdentifier("customCell") as? TableViewCell {
//            
//            if indexPath.row == 0{
//                cell.nameLabel.text = usuari.name?.first
//                print(usuari.name?.first)
//            } else if indexPath.row == 1{
//                cell.nameLabel.text = usuari.phone
//            } else if indexPath.row == 2{
//                cell.nameLabel.text = usuari.email
//            }
//            
//            return cell
//            
//        }
        return UITableViewCell()
    }
    
}

