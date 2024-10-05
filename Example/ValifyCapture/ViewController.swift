//
//  ViewController.swift
//  ValifyCapture
//
//  Created by elsayed1ahmed0@gmail.com on 10/05/2024.
//  Copyright (c) 2024 elsayed1ahmed0@gmail.com. All rights reserved.
//

import UIKit
import ValifyCapture

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let selfi = SelfiCapture()
        selfi.sayHello()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

