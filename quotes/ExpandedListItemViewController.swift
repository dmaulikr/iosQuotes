//
//  ExpandedListItemViewController.swift
//  quotes
//
//  Created by Xavi on 11/02/16.
//  Copyright © 2016 mac33. All rights reserved.
//

import UIKit

class ExpandedListItemViewController: UIViewController {

    @IBOutlet weak var roundImageView: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    var network:Network!
    
    var quoteStr:String!
    var authorStr:String!
    var backgroundStr:String!
    var authorImgStr:String?
    
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundImageView.layer.cornerRadius = roundImageView.frame.size.width / 2
        roundImageView.clipsToBounds = true
        roundImageView.layer.borderWidth = 3
        roundImageView.layer.borderColor = UIColor.whiteColor().CGColor
        
        quote.text = quoteStr
        authorLabel.text = authorStr
        
        if let url = NSURL(string: backgroundStr){
            network = Network.init(baseURL: url)
            if let image = network.downloadImageFromUrl(url){
                backgroundImage.image = image
            } else {
                backgroundImage.image = UIImage(named: "profile-bg")
            }
            
        }
        
        if authorImgStr != nil {
            if let url2 = NSURL(string: authorImgStr!){
                roundImageView.image = network.downloadImageFromUrl(url2)
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
