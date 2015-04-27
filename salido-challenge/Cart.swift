//
//  Cart.swift
//  salido-challenge
//
//  Created by chuck on 4/27/15.
//  Copyright (c) 2015 Chuck's Anime Shrine. All rights reserved.
//

import UIKit

//uses Generics for a reusable container/cart
class Cart<Wine: Hashable> : Printable {
    
    //var _contents = Dictionary<Wine, Int>()
    var _contents = [Wine:Int]()
    
    init()
    {

    }
    
    
    init(_ items : Wine ...)
    {
        for item in items
        {
            self.addItem(item)
        }
    }
    
    func addItem(item : Wine)
    {
        if let count = _contents[item] {
            _contents[item] = count + 1
        } else {
            _contents[item] = 1
        }
    }
    
    func removeItem(item: Wine) {
        if let count = _contents[item]
        {
            if (count > 1) {
                _contents[item] = count - 1
            } else {
                _contents.removeValueForKey(item)
            }
        }
    }
    
    func emptyCart(){
        _contents.removeAll(keepCapacity: false)
    }
    
    var description : String {
        return _contents.description
    }
}

