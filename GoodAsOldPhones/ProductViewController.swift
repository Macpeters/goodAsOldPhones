//
//  ProductViewController.swift
//  GoodAsOldPhones
//
//  Created by Maryanne Peters on 2016-06-23.
//  Copyright © 2016 Maryanne Peters. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    
    var product: Product?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let p = product {
            productNameLabel.text = p.name
            if let i = p.productImage {
                productImageView.image = UIImage(named: i)
            }
        }
    }

    @IBAction func addToCartPressed(sender: AnyObject) {
        
        guard let product = product, let name = product.name, let price = product.price else {
            return
        }
        
        //create an order
        let order = Order()
        order.product = product
        
        //get existing orders
        var ordersInCart = Orders.readOrdersFromArchive()
        if(ordersInCart == nil) {
            ordersInCart = []
        }
        
        //save this order to disk
         ordersInCart?.append(order)
        if let orders = ordersInCart {
            Orders.saveOrdersToArchive(orders)
        }
        
        //show a message
        let alertController = UIAlertController(title: "Added To Cart", message: "You added \(name) to the cart for $\(price)", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        presentViewController(alertController, animated: true, completion: nil)
    }

}
