//
//  ViewController.swift
//  XI
//
//  Created by 上田　護 on 2017/11/15.
//  Copyright © 2017年 上田　護. All rights reserved.
//test

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Controllerのタイトルを設定する.
        self.title = "MindBind"
        // Viewの背景色をCyanに設定する.
        self.view.backgroundColor = UIColor.white

        // ボタンの定義をおこなう.
        let myButton = UIButton(frame: CGRect(x: 0,y: 0,width: 100,height: 50))
        myButton.backgroundColor = UIColor.orange
        myButton.layer.masksToBounds = true
        myButton.setTitle("TimeSelect", for: .normal)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:200)
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender: )), for: .touchUpInside)
        // ボタンをViewに追加する.
        self.view.addSubview(myButton);
    }

    @objc func onClickMyButton(sender: UIButton){
        // 移動先のViewを定義する
//        let secondViewController = SecondViewController()
        let TestViewController = testViewController()
        // SecondViewに移動する.
//        self.navigationController?.pushViewController(secondViewController, animated: true)
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let vc = storyboard.instantiateViewController(withIdentifier: "")
        self.navigationController?.pushViewController(TestViewController, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

