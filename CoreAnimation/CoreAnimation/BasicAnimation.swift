//
//  BasicAnimation.swift
//  CoreAnimation
//
//  Created by boco on 2018/6/25.
//  Copyright © 2018年 zhangle. All rights reserved.
//

import UIKit
import CoreImage

class BasicAnimation: UIViewController {
    
    let animationLayer = CALayer()
    let button = UIButton.init(type: .system)

    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "基础动画"
        self.view.backgroundColor = .white
        
        self.animationLayer.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        self.animationLayer.backgroundColor = UIColor.green.cgColor
        self.view.layer.addSublayer(self.animationLayer)
        
        self.button.frame = CGRect.init(x: 100, y: 450, width: 100, height: 40)
        self.button.setTitle("开始动画", for: .normal)
        self.button.addTarget(self, action: #selector(animationAction), for: .touchUpInside)
        self.view.addSubview(self.button)
    }
    
    // MARK: - Method
    @objc func animationAction() {
        let basicAnimation = CABasicAnimation.init(keyPath: "opacity")
        basicAnimation.duration = 3.0
        basicAnimation.repeatCount = 3
        basicAnimation.autoreverses = true
        basicAnimation.fromValue = 1.0
        basicAnimation.toValue = 0.0
        self.animationLayer.add(basicAnimation, forKey: "basic")
    }
}
