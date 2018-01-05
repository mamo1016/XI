//
//  SecondViewController.swift
//  XI
//
//  Created by 上田　護 on 2017/12/18.
//  Copyright © 2017年 上田　護. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    // ピッカーの作成
    var picker: UIPickerView!
    @IBOutlet weak var testLabel: UILabel!
    
    let dataList = [["牛丼","豚丼","すき焼き丼","鮭定食"]]
    let dataList2 = [["牛丼","豚丼","すき焼き丼","鮭定食"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Set Time"
        // ただ背景色がシアンなだけ
        self.view.backgroundColor = UIColor.white
        
        //UIButtonのインスタンスを生成
        let Button = UIButton()
        
        Button.layer.position = CGPoint(x: self.view.bounds.width/2, y:200)
        //twitterButtonのサイズと位置を設定
        Button.frame = CGRect(x: self.view.frame.size.width / 2 - 50, y: self.view.frame.size.height / 2 - 90, width: 100, height: 100)
        //ボタンの丸み設定
        Button.layer.cornerRadius = 20.0
        //テキストの設定
        Button.setTitle("SetTime", for: UIControlState.normal)
        //テキストカラーの設定
        Button.setTitleColor(UIColor.blue, for: UIControlState.normal)
        //ボタンの背景カラー設定
        Button.backgroundColor = UIColor.orange
        //Buttonの処理の設定
        Button.addTarget(self, action: #selector(pickerView(sender:)), for: .touchUpInside)
        //ButtonをSubViewとして追加
        self.view.addSubview(Button)

        // ピッカーの作成
        picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))

        picker.center = self.view.center
        
        // プロトコルの設定
        picker.delegate = self as! UIPickerViewDelegate
        picker.dataSource = self as? UIPickerViewDataSource
        
//        // はじめに表示する項目を指定
//        picker.selectRow(1, inComponent: 0, animated: true)
        // はじめに表示する項目を指定
        picker.selectRow(1, inComponent: 0, animated: true)
        picker.selectRow(2, inComponent: 1, animated: true)


    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func pickerView(sender: UIButton) {
        //ButtonをSubViewとして追加
        self.view.addSubview(picker)
    }

    //コンポーネントの個数を返すメソッド
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return dataList.count
        
    }

    //コンポーネントに含まれるデータの個数を返すメソッド
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return dataList[component].count
        // アイテム表示個数を返す
        
        if component == 0 {
            // 1個目のピッカーの設定
            return dataList.count
        }
        
        return dataList2.count
    }
    
    
    //データを返すメソッド
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return dataList[component][row]
        if component == 0 {
            // 1個目のピッカーの設定
            return dataList[component][row]
        }
        
        return dataList2[component][row]
    }
    
    
    //データ選択時の呼び出しメソッド
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 選択時の処理
        
        if component == 0 {
            // 1個目のピッカーの設定
            print(dataList[component][row])
        }
        print(dataList2[component][row])
    
        //コンポーネントごとに現在選択されているデータを取得する。
//        let data1 = self.pickerView(pickerView, titleForRow: pickerView.selectedRowInComponent(0), forComponent: 0)
//        let data2 = self.pickerView(pickerView, titleForRow: pickerView.selectedRowInComponent(1), forComponent: 1)
//        let data3 = self.pickerView(pickerView, titleForRow: pickerView.selectedRowInComponent(2), forComponent: 2)
        // 選択時の処理
        print(dataList[component][row])
//        testLabel.text = "選択　\(data1!)　\(data2!)　\(data3!)"
    }
//
//    @objc func onClickSetButton(sender: UIButton){
//
//    }

    

}
