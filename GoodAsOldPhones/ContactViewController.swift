//
//  ContactViewController.swift
//  GoodAsOldPhones
//
//  Created by Maryanne Peters on 2016-06-25.
//  Copyright © 2016 Maryanne Peters. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(scrollView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.scrollView.contentSize.height = 800
//        scrollView.contentSize = CGSizeMake(375, 800)
    }



}
