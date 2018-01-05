//
//  File.swift
//  XI
//
//  Created by 上田　護 on 2017/11/17.
//  Copyright © 2017年 上田　護. All rights reserved.
//

import UIKit

class SimpleButton: UIButton {
    


    var selectView: UIView! = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        myInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        myInit()
    }
    
    func myInit() {
        
        // 角を丸くする
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
        // ボタンを押している時にボタンの色を暗くするためのView
        selectView = UIView(frame: self.bounds)
        selectView.backgroundColor = UIColor.black
        selectView.alpha = 0.0
        self.addSubview(selectView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        selectView.frame = self.bounds
    }
    
    // タッチ開始
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {() -> Void in
            
            self.selectView.alpha = 0.5
            
        }, completion: {(finished: Bool) -> Void in
        })
    }
    
    // タッチ終了
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {() -> Void in
            
            self.selectView.alpha = 0.0
            
        }, completion: {(finished: Bool) -> Void in
        })
        print("finish")
        
    }
}
