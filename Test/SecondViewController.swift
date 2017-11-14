//
//  SecondViewController.swift
//  Clicker
//
//  Created by NZ on 10.09.17.
//  Copyright © 2017 NZ. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func replayButton(_ sender: AnyObject) 
    {
        self.performSegue(withIdentifier: "replay", sender: nil)
    }

}
