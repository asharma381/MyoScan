//
//  ViewController.swift
//  MyoScan
//
//  Created by Aditya Sharma on 7/26/20.
//  Copyright © 2020 Aditya Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("YATHARTH's EDIT WORKED")
        // Do any additional setup after loading the view.
    }

    @IBAction func getStartedTapped(_ sender: UIButton) {
        let transition = storyboard?.instantiateViewController(identifier: "menuScreen") as? NavViewController
        view.window?.rootViewController = transition
        view.window?.makeKeyAndVisible()
    }
    
}

