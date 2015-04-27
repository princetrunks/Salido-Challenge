//
//  Wine.swift
//  salido-challenge
//
//  Created by chuck on 4/26/15.
//  Copyright (c) 2015 Chuck's Anime Shrine. All rights reserved.
//

import UIKit
import CoreLocation

//TODO: Set Up Type Struct
/*
struct Type{

  Wine
  WineSet
  Basket
  Glassware
  Accessory
}
*/

class Wine : NSObject {
    
    //TODO: Fill in all of the Wine Fields and Objects
    
    //MARK:Properties

    let id_ : Int
    let name_ : String
    let wineDescription_ : String
    //let geoLocation : CLLocation //or custom GeoLocation class
    //let url_ : NSURL
    //let priceMin_ : Float
    //let priceMax_ : Float
    let priceRetail_ : Float
    //let type_ : String
    //let appellation_ : Appellation
    //let varietal_ : Varietal
    //let vineyard_ : Vineyard
    //let productAttributes_ : [ProductAttributes]
    //let labels_ : [Labels]
    //let ratings_ : Ratings
    //let retail_ : Retail
    //let vintages_ : Vintages
    //let community_ : Community
    
    
    
    /*
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    
    
    init(id:Int, name: String, price: Float, description: String){
        self.id_   = id
        self.name_ = name
        self.priceRetail_ = price
        self.wineDescription_ = description
        super.init()
    }
    

}
