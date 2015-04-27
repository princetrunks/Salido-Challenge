//
//  PaymentViewController.swift
//  salido-challenge
//
//  Created by chuck on 4/27/15.
//  Copyright (c) 2015 Chuck's Anime Shrine. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet var cartData : UITextView!
    
    //MARK: Overidden Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        
        //sets the title
        self.title = "Payment Processed"
        
        cartDump()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    //Return back to Product list
    @IBAction func paymentSegue(sender: UIButton) {
        
        performSegueWithIdentifier("backToList", sender: sender)
        
    }
    

    //MARK: Custom Functions
    
    func cartDump()
    {
      
        for (kind, quantity) in cart_._contents {
        //println("kind: \(kind)")
        let wineItem: Wine = kind[0] as! Wine
        let totalPrice = wineItem.priceRetail_ * Float(quantity)
        cartData.text = cartData.text + ("Wine: \(wineItem.name_) QTY: \(quantity)\n Total Price: \(totalPrice.formatAsPrice())\n\n")
        //println("qty: \(quantity)")
        }
        
        
        /*cartData.text = String(_cocoaString: cart_)*/
        
    }
    
    


}
