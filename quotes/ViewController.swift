//
//  ViewController.swift
//  quotes
//
//  Created by mac33 on 4/2/16.
//  Copyright © 2016 mac33. All rights reserved.
//

import UIKit
import CoreData


extension UIColor {
    static private func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    static func randomColor() -> UIColor {
        let r = randomCGFloat()
        let g = randomCGFloat()
        let b = randomCGFloat()
        
        // If you wanted a random alpha, just create another
        // random number for that too.
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var quotesTableView: UITableView!
    var quotes = [Quote]()
    var managedProductName = "Quote"
    var pressedCellIdentifier:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = appdelegate.managedObjectContext
        let fetchQuoteRequest = NSFetchRequest(entityName: "Quote")
        do {
            quotes = try managedObjectContext.executeFetchRequest(fetchQuoteRequest) as! [Quote]
            if quotes.count == 0{
                let quoteAux = QuoteLogic.init(text: "You know nothing John Snow", author: "Ygritte", background: "https://pbs.twimg.com/profile_images/675288295635476480/oLYGkY1j.jpg")
                
                let entityDescription = NSEntityDescription.entityForName(managedProductName, inManagedObjectContext: managedObjectContext)
                
                let quote = Quote(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
                
                quote.text = quoteAux.text
                quote.author = quoteAux.author
                quote.background = quoteAux.background
                
                appdelegate.saveContext()
                
                self.quotes.append(quote)
            }
            print(quotes[0])
        }
        catch {
            print(error)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return quotes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        if let cell = tableView.dequeueReusableCellWithIdentifier("quoteCell") as? QuoteCell {
            
            cell.listImageView.layer.cornerRadius = cell.listImageView.frame.size.width / 2
            cell.listImageView.clipsToBounds = true
            cell.listImageView.backgroundColor = UIColor.randomColor()
            //Guardar colors?

            let stringAux = quotes[indexPath.row].author
            let index = stringAux!.startIndex.advancedBy(0)
            let firstChar = stringAux![index]
            
            cell.roundBackgroundLetter.text = String(firstChar)
            cell.authorName.text = stringAux
            //cell.roundBackgroundLetter.font = UIFont.boldSystemFontOfSize(25)
            cell.roundBackgroundLetter.textColor = UIColor.whiteColor()
            cell.roundBackgroundLetter.textAlignment = NSTextAlignment.Center

            return cell
            
        }
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Hola")
        pressedCellIdentifier = indexPath.row
        performSegueWithIdentifier("showSegue", sender: self)
    }
    
    func addQuote(quoteLogic:QuoteLogic) ->Void {
        self.saveQuote(quoteLogic)
        let indexPath = NSIndexPath(forRow: self.quotes.count-1, inSection: 0)
        self.quotesTableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    func saveQuote(quoteLogic:QuoteLogic) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedObjectContext = appDelegate.managedObjectContext
        
        let entityDescription = NSEntityDescription.entityForName(managedProductName, inManagedObjectContext: managedObjectContext)
        
        let quote = Quote(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        quote.text = quoteLogic.text
        quote.author = quoteLogic.author
        quote.background = quoteLogic.background
        
        appDelegate.saveContext()
        
        self.quotes.append(quote)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "showSegue" {
                if let destination = segue.destinationViewController as? ExpandedListItemViewController {
                    destination.quote.text = "Hola"
//                    quotes[pressedCellIdentifier].text
                }
            }
        }
    }

    
}

