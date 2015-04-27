//
//  CartTableViewController.swift
//  salido-challenge
//
//  Created by chuck on 4/27/15.
//  Copyright (c) 2015 Chuck's Anime Shrine. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {
    
    //MARK: Properties
    
    let cellIndentifier_  = "cartCell"           //custom cell identifier used by the viewController
    
    var cartArray : NSMutableArray = []         //empty mutable array to hold selected Wine data for display
    
    
    //tableView indexPathForSelectedRow
    
    //move to payment process
    @IBAction func removeItem(sender: UIButton) {
        
        if cartArray.count > 0{
            if let selected = self.tableView.indexPathForSelectedRow(){
        
        cartArray.removeObjectAtIndex(selected.row)
        
        //reload tableview
        self.tableView.reloadData()
            }
        }
        
    }
    
    //MARK: Overidden Functions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sets the title
        self.title = "Cart Contents"
        
        //load data
        self.getData()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cartArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIndentifier_) as! UITableViewCell
        
        //Config the table cell
        
        cell.textLabel?.text = cartArray.objectAtIndex(indexPath.row) as? String
        
        //accessory config
        cell.accessoryType = UITableViewCellAccessoryType.None
        
        
        return cell
    }
    
    // MARK: - Navigation
    
    //move to payment process
    @IBAction func paymentSegue(sender: UIButton) {
        
        if cartArray.count > 0{
        performSegueWithIdentifier("processPayment", sender: sender)
        }
        
    }
    
    //MARK: Custom Functions
    
    func getData(){
    
    //TODO: configure cart's look and data better

    for (kind, quantity) in cart_._contents {
        //println("kind: \(kind)")
        let wineItem: Wine = kind[0] as! Wine
        let totalPrice = wineItem.priceRetail_ * Float(quantity)
        cartArray.addObject(wineItem.name_)
        //cartData.text = cartData.text + ("Wine: \(wineItem.name_) QTY: \(quantity)\n Total Price: \(totalPrice.formatAsPrice())\n\n")
        //println("qty: \(quantity)")
        }

        
    //reload Table View
    self.tableView.reloadData()
    
    }

    
    
    
    
}
