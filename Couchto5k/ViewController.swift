//
//  ViewController.swift
//  Couchto5k
//
//  Created by Taylor Chan on 5/2/18.
//  Copyright © 2018 Taylor Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let service = APIService()
        service.getDataWith{
            (result) in print(result)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

