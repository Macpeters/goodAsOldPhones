//
//  Order.swift
//  GoodAsOldPhones
//
//  Created by Maryanne Peters on 2016-06-27.
//  Copyright © 2016 Maryanne Peters. All rights reserved.
//

import UIKit

class Order: NSObject, NSCoding {

    var product: Product?
    
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.product = aDecoder.decodeObjectForKey("product") as? Product
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(product, forKey: "product")
    }
}
