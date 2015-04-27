//
//  CartItem.swift
//  salido-challenge
//
//  Created by chuck on 4/27/15.
//  Copyright (c) 2015 Chuck's Anime Shrine. All rights reserved.
//

import UIKit

class CartItem: NSObject {
    
    let qty_ : Int
    let name_ : String
    let priceRetail_ : Float
    
    init( name: String, price: Float, quantity: Int){
        self.name_ = name
        self.priceRetail_ = price
        self.qty_ = quantity
        super.init()
    }

}
