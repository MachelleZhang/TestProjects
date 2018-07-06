//
//  Transaction.swift
//  CoreAnimation
//
//  Created by boco on 2018/7/2.
//  Copyright © 2018年 zhangle. All rights reserved.
//

import UIKit

class Transaction: UIViewController {
    
    let animationLayer = CALayer()
    let button = UIButton.init(type: .system)
    
    let animationLayer2 = CALayer()
    let button2 = UIButton.init(type: .system)
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "事物"
        self.view.backgroundColor = .white
        
        self.animationLayer.frame = CGRect.init(x: 50, y: 100, width: 100, height: 100)
        self.animationLayer.backgroundColor = UIColor.green.cgColor
        self.view.layer.addSublayer(self.animationLayer)
        
        self.button.frame = CGRect.init(x: 50, y: 450, width: 100, height: 40)
        self.button.setTitle("开始动画", for: .normal)
        self.button.addTarget(self, action: #selector(animationAction), for: .touchUpInside)
        self.view.addSubview(self.button)
        
        self.animationLayer2.frame = CGRect.init(x: 200, y: 100, width: 100, height: 100)
        self.animationLayer2.backgroundColor = UIColor.green.cgColor
        self.view.layer.addSublayer(self.animationLayer2)
        
        self.button2.frame = CGRect.init(x: 200, y: 450, width: 100, height: 40)
        self.button2.setTitle("开始动画", for: .normal)
        self.button2.addTarget(self, action: #selector(animationAction2), for: .touchUpInside)
        self.view.addSubview(self.button2)
    }
    
    // MARK: - Method
    // 使用事物，将隐式动画的时间改到了10秒
    @objc func animationAction() {
        CATransaction.begin()
        CATransaction.setValue(10.0, forKey: kCATransactionAnimationDuration)
        self.animationLayer.backgroundColor = UIColor.red.cgColor
        CATransaction.commit()
    }
    
    // 事物可嵌套，外层事物commit后才会开始执行动画
    @objc func animationAction2() {
        CATransaction.begin() // outer begin
        CATransaction.setValue(10.0, forKey: kCATransactionAnimationDuration)
        self.animationLayer2.backgroundColor = UIColor.red.cgColor
        
            CATransaction.begin() // inner begin
            CATransaction.setValue(5.0, forKey: kCATransactionAnimationDuration)
            self.animationLayer2.opacity = 0.5
            self.animationLayer2.position = CGPoint.init(x: 250, y: 250)
            CATransaction.commit() // inner commit
        
        CATransaction.commit() // outer commit
    }
}
