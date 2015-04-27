//
//  WineTableViewController.swift
//  salido-challenge
//
//  Created by Chuck Gaffney on 4/26/15.
//  Copyright (c) 2015 Chuck's Anime Shrine. All rights reserved.
//

import UIKit

class WineTableViewController: UITableViewController {
    
    //MARK: Properties
    
    let getDataURL = "http://services.wine.com/api/beta2/service.svc/JSON/catalog?apikey=283bf847e449029320e4dfdb77ff2ffe"                      //RESTful URL for JSON data
    
    let cellIndentifier_  = "Cell"              //custom cell identifier used by the viewController
    
    var wineArray : NSMutableArray = []         //empty mutable array to hold selected Wine data for display
    
    
    //MARK: Overidden Functions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sets the title
        self.title = "ABC Wine Distributors (ABC WD)"
        
        //clear any data in the cart
        cart_.emptyCart()
        
        //load data
        self.getData()
        
     }
    
    //TODO: Need to clean up tables & data better; currently there's a memory leak seen after paymentProcess
    override func viewDidDisappear(animated: Bool) {
        //
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wineArray.count
    }
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIndentifier_) as! UITableViewCell
        
        //Config the table cell
        let  wineObject: Wine
        wineObject = wineArray.objectAtIndex(indexPath.row) as! Wine
        
        cell.textLabel?.text = wineObject.name_
        
        //accessory config
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetailView" {
            let indexPath = self.tableView.indexPathForSelectedRow()
            
            let product:Wine = wineArray.objectAtIndex(indexPath!.row) as! Wine
            
            if let destinationVC = segue.destinationViewController as? DetailViewController{
                destinationVC.getWineProduct(product)
            }
        }
        
    }
    
    //MARK: Custom Functions
    
    func getData(){
        
        let url  = NSURL(string: getDataURL)
        let data = NSData(contentsOfURL: url!)
        var writeError: NSError?
        
        //Holds the raw JSON data as a Distionary
        let jsonDictionary : NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &writeError) as! NSDictionary
        
        //Error Check the JSON Read and catch the error
        if jsonDictionary == NSNull() {
            if let error = writeError {
                println("JSON Read failure: \(error.localizedDescription)")
            }
        }

        
        //Drill down the RESTful structure of the Catalog -> "Products" -> "List" -> (Product Data)
        
        //"Products"
        var currentDictionary : NSDictionary = jsonDictionary.objectForKey("Products") as! NSDictionary
        
        //"Lists" array
        var productList : NSMutableArray = currentDictionary.objectForKey("List") as! NSMutableArray
       
        
        //loop through jsonArray
        for var index = 0; index < productList.count; index++
        {
            
            
            //if (productList[index] != nil){
            
            //TODO: put keys in a separate class/list
            let wineProductItem : NSDictionary = productList[index] as! NSDictionary
                
            let wID          = wineProductItem.objectForKey("Id") as! Int
            let wName        = wineProductItem.objectForKey("Name") as! String
            let wPrice       = wineProductItem.objectForKey("PriceRetail") as! Float
            let wDescription = wineProductItem.objectForKey("Description") as! String
            
            let wineObject = Wine(id: wID, name: wName, price: wPrice, description: wDescription)
            
            wineArray.addObject(wineObject)
            //}
            
        }
        
        //println(wineArray)
        
        //reload Table View
        self.tableView.reloadData()
        
      }
}
    

    
    


