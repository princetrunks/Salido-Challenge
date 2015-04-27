//
//  DetailViewController.swift
//  salido-challenge
//
//  Created by chuck on 4/26/15.
//  Copyright (c) 2015 Chuck's Anime Shrine. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: Properties
    
    //labels
    @IBOutlet var nameLabel        : UILabel!
    @IBOutlet var priceLabel       : UILabel!
    @IBOutlet var descriptionLabel : UILabel!
    
    //Text Field(s)
    @IBOutlet var descriptionField : UITextView!
    
    //Button(s)
    @IBOutlet var cartButton       : UIButton!
    
    
    //move to Cart view
    @IBAction func viewCartSegue(sender: UIButton) {
        
        performSegueWithIdentifier("viewCart", sender: sender)
       
    }
    
    @IBAction func addItemToCart(sender: UIButton) {
        //counter++
        cart_.addItem([currentWineProduct])
        println("CART: \(cart_)")
    }
    
    //Main Wine Object
    var currentWineProduct : Wine!
    
    //MARK: DetailView Main Functions
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Product Details"
                
        //Load Details UI
        setUpDetails()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "viewCart" {
            let indexPath = sender
            
            
            if let destinationVC = segue.destinationViewController as? CartViewController{
                //destinationVC.getWineProduct(product)
            }
        }
        
    }*/
    
    //MARK: Custom Functions
    func getWineProduct(product:Wine){
        
        currentWineProduct = product
    }
    
    func setUpDetails()
    {
        //TODO: add description field and other labels
        nameLabel.text = currentWineProduct.name_
        priceLabel.text = "Price: \(currentWineProduct.priceRetail_.formatAsPrice())"
        descriptionLabel.text = "Description:"
        descriptionField.text = currentWineProduct.wineDescription_
        
    }
    
    

}
