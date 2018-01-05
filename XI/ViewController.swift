//  ViewController.swift
//  XI
//
//  Created by 上田　護 on 2017/11/15.
//  Copyright © 2017年 上田　護. All rights reserved.
//test

import UIKit

class ViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0,y: 0,width: 100,height: 50))
        button.backgroundColor = UIColor.orange
        button.layer.masksToBounds = true
        button.setTitle("TimeSelect", for: .normal)
        button.layer.cornerRadius = 20.0
        button.layer.position = CGPoint(x: self.view.bounds.width/2, y:200)
        button.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Controllerのタイトルを設定する.
        self.title = "MindBind"
        // Viewの背景色をCyanに設定する.
        self.view.backgroundColor = UIColor.white
        // ボタンをViewに追加する.
        self.view.addSubview(button);
    }

    @objc func onClickMyButton(sender: UIButton){
        // 移動先のViewを定義する
//        let secondViewController = SecondViewController()
        let TestViewController = testViewController()
        self.navigationController?.pushViewController(TestViewController, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

