//
//  testViewController.swift
//  XI
//
//  Created by 上田　護 on 2018/01/05.
//  Copyright © 2018年 上田　護. All rights reserved.
//

import UIKit

class testViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    let dataList = [
        "秋元 真夏",
        "生田 絵梨花",
        "生駒 里奈",
        "衛藤 美彩",
        "齋藤 飛鳥",
        "桜井 玲香",
        "白石 麻衣",
        "高山 一実",
        "西野 七瀬",
        "堀 未央奈",
        "松村 沙友理",
        "若月 佑美"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate設定
        pickerView.delegate = self
        pickerView.dataSource = self
        
        label.text = "乃木坂46\n十二福神"
        
    }
    
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return dataList[row]
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        
        
        label.text = dataList[row]
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
