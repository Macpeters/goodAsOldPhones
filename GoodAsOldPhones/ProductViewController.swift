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
    
    
    var productName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        productNameLabel.text = productName
        productImageView.image = UIImage(named: "phone-fullscreen1")
        
    }

    @IBAction func addToCartPressed(sender: AnyObject) {
        print("Button Tapped")
    }

}
