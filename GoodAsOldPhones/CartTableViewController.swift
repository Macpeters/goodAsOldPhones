//
//  CartTableViewController.swift
//  GoodAsOldPhones
//
//  Created by Maryanne Peters on 2016-06-27.
//  Copyright © 2016 Maryanne Peters. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {
    @IBOutlet weak var calcTotalLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    
    var ordersInCart: [Order]?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableHeaderView = headerView
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        let product1 = Product()
//        
//        product1.name = "1907 Wall Set"
//        product1.productImage = "phone-fullscreen1"
//        product1.cellImage = "image-cell1"
//        product1.price = 12.50
//        
//        let order = Order()
//        order.product = product1
        
        //read orders from disk
//        ordersInCart = [order]
        ordersInCart = Orders.readOrdersFromArchive()
        if(ordersInCart == nil) {
            ordersInCart = []
        }
        
        tableView.reloadData()
        updateTotal()
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersInCart?.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CartCell", forIndexPath: indexPath)

        let order = ordersInCart?[indexPath.row]
        if let order = order {
            cell.textLabel?.text = order.product?.name
            cell.detailTextLabel?.text = String(order.product?.price)
        }

        return cell
    }
 

    
    // Delete an item
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // same as if editingStyle == .Delete
        if editingStyle == UITableViewCellEditingStyle.Delete {
            // Delete the row from the data source
            ordersInCart?.removeAtIndex(indexPath.row)
            //save array to disk
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            if let orders = ordersInCart {
                Orders.saveOrdersToArchive(orders)
            }
            updateTotal()
        }
    }
    
    func updateTotal() -> Void {
        if let orders = ordersInCart {
            var total: Double = 0.0
            for order in orders {
                if let price = order.product?.price {
                    total = total + price
                }
            }
            calcTotalLabel.text = String(total)
        }
    }

}
