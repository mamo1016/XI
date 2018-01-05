//
//  FirstViewController.swift
//  XI
//
//  Created by 上田　護 on 2017/12/20.
//  Copyright © 2017年 上田　護. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        // Controllerのタイトルを設定する.
        self.title = "MindBind"
        // Viewの背景色をCyanに設定する.
        self.view.backgroundColor = UIColor.white
        
        // ボタンの定義をおこなう.
        let myButton = UIButton(frame: CGRect(x: 0,y: 0,width: 100,height: 50))
        myButton.backgroundColor = UIColor.orange
        myButton.layer.masksToBounds = true
        myButton.setTitle("Start", for: .normal)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:200)
        //        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(_:)) ,for: .touchUpInside)
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender: )), for: .touchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(myButton);
        
        // ピッカーの作成
        let picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        picker.center = self.view.center
        
        // プロトコルの設定
        picker.delegate = self as! UIPickerViewDelegate
        picker.dataSource = self as? UIPickerViewDataSource
        
        // はじめに表示する項目を指定
        picker.selectRow(1, inComponent: 0, animated: true)
        
        // 画面にピッカーを追加
        self.view.addSubview(picker)
    
    }
    
    @objc func onClickMyButton(sender: UIButton){
        // 移動先のViewを定義する
        let secondViewController = SecondViewController()
        // SecondViewに移動する.
        self.navigationController?.pushViewController(secondViewController, animated: true)
        print("hey");
    }
    
    @objc internal func leftBarBtnClicked(sender: UIButton){
        print("leftBarBtnClicked")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

