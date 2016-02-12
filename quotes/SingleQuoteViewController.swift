//
//  SingleQuoteViewController.swift
//  quotes
//
//  Created by mac33 on 4/2/16.
//  Copyright © 2016 mac33. All rights reserved.
//

import UIKit

class SingleQuoteViewController: UIViewController {

    @IBOutlet weak var roundImageView: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    var network:Network!
    var quoteLogicAux:QuoteLogic!
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundImageView.layer.cornerRadius = roundImageView.frame.size.width / 2
        roundImageView.clipsToBounds = true
        roundImageView.layer.borderWidth = 3
        roundImageView.layer.borderColor = UIColor.whiteColor().CGColor
        
        network = Network.init()
        network.getQuoteOfTheDay { quoteLogic -> Void in
            print(quoteLogic)
            if let quote = quoteLogic {
                print("Hola")
                dispatch_async(dispatch_get_main_queue()) {
                    self.quoteLabel.text = quote.text
                    self.authorLabel.text = quote.author
                    
                    if let url = NSURL(string: quote.background){
                        self.network = Network.init()
                        if let image = self.network.downloadImageFromUrl(url){
                            self.backgroundImage.image = image
                        } else {
                            self.backgroundImage.image = UIImage(named: "profile-bg")
                        }
                        
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
