//
//  Common.swift
//  salido-challenge
//
//  Created by chuck on 4/26/15.
//  Copyright (c) 2015 Chuck's Anime Shrine. All rights reserved.
//

// Shared assets, extentions, structs and global vars for the project

import Foundation

//global cart object, blank to start
var cart_ = Cart([])

//allows floating point numbers to be returned as a string with a set format
extension Float {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
        }
    
}

//uses the formating extention to create an easy pricing extension
extension Float {
    func formatAsPrice() -> String {
        
        let priceFormat = ".2"
        
        return String("$\(self.format(priceFormat))")
    }
    
    
}

