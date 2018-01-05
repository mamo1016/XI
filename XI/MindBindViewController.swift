////
////  MindBindViewController.swift
////  XI
////
////  Created by 上田　護 on 2017/11/15.
////  Copyright © 2017年 上田　護. All rights reserved.
////
//

import UIKit


class MindBindViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // 選択肢
//    let dataList = []
    let dataArray:[Int] = ([Int])(0...12)
    let dataArray2:[Int] = ([Int])(0...60)
    @IBOutlet weak var timerMinute: UILabel!
    @IBOutlet weak var timerSecond: UILabel!
    @IBOutlet weak var timerMSec: UILabel!
    
    weak var timer: Timer!
    var setHour:Int = 0
    var setMinute:Int = 0
    var startTime = Date()
    var second2 = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        let simpleButton = SimpleButton(frame: frame)
        simpleButton.setTitle("MindBind", for: UIControlState.normal)
        simpleButton.backgroundColor = UIColor.blue
        simpleButton.center = self.view.center
        self.view.addSubview(simpleButton)
        
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "Setting") as! SetViewController
        self.present(nextView, animated: true, completion: nil)
        
        // ピッカーの作成
        let picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        picker.center = self.view.center
        
        // プロトコルの設定
        picker.delegate = self
        picker.dataSource = self
        
        // はじめに表示する項目を指定
        picker.selectRow(1, inComponent: 0, animated: true)
        picker.selectRow(2, inComponent: 1, animated: true)
        
        // 画面にピッカーを追加
        self.view.addSubview(picker)
        
    }
    
    
    // ピッカービューの設定
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // 表示する列数
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // アイテム表示個数を返す
        if component == 0 {
            // 1個目のピッカーの設定
            return dataArray.count
        }
        
        return dataArray2.count
    }
    
    // UIPickerViewDelegate
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        // 表示する文字列を返す
//        return String(dataArray[row])
//    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 表示する文字列を返す
        
        if component == 0 {
            // 1個目のピッカーの設定
            return String(dataArray[row])
        }
        
        return String(dataArray2[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 選択時の処理
        if component == 0 {
            // 1個目のピッカーの設定
            print(dataArray[row])
            setHour = dataArray[row]
        }
        print(dataArray2[row])
        setMinute = dataArray2[row]
    
    }
    
    
    @IBAction func startTimer(sender : AnyObject) {
        if timer != nil{
            // timerが起動中なら一旦破棄する
            timer.invalidate()
        }
        
        timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(self.timerCounter),
            userInfo: nil,
            repeats: true)
        
        startTime = Date()
    }
    
    @IBAction func stopTimer(sender : AnyObject) {
        if timer != nil{
            timer.invalidate()
            
            timerMinute.text = "00"
            timerSecond.text = "00"
            timerMSec.text = "00"
        }
        
    }
    
    @IBAction func timerCounter() {
        // タイマー開始からのインターバル時間
        let currentTime = Date().timeIntervalSince(startTime)

        // fmod() 余りを計算
        let minute = (Int)(fmod((currentTime/60), 60))
        // currentTime/60 の余り
        let second = (Int)(fmod(currentTime, 60))
        // floor 切り捨て、小数点以下を取り出して *100
        let msec = (Int)((currentTime - floor(currentTime))*100)
        

        // %02d： ２桁表示、0で埋める
        let sMinute = String(format:"%03d", setMinute-minute)
        let sSecond = String(format:"%03d", 60-second)
        let sMsec = String(format:"%03d", 100-msec)

        
        timerMinute.text = sMinute
        timerSecond.text = sSecond
        timerMSec.text = sMsec
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
//        timer.invalidate()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
