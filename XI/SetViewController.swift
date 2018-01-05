//
//  SetViewController.swift
//  XI
//
//  Created by 上田　護 on 2017/11/15.
//  Copyright © 2017年 上田　護. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(){
//        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
}
