//
//  RotationAnimation.swift
//  CoreAnimation
//
//  Created by boco on 2018/7/6.
//  Copyright © 2018年 zhangle. All rights reserved.
//

import UIKit

class RotationAnimation: UIViewController {

    let animationLayer = CALayer()
    let button = UIButton.init(type: .system)
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "翻转动画"
        self.view.backgroundColor = .white
        
        self.animationLayer.frame = CGRect.init(x: 100, y: 100, width: 84, height: 96)
        self.animationLayer.contents = UIImage.init(named: "my_apple")?.cgImage
        self.view.layer.addSublayer(self.animationLayer)
        
        self.button.frame = CGRect.init(x: 100, y: 450, width: 100, height: 40)
        self.button.setTitle("开始动画", for: .normal)
        self.button.addTarget(self, action: #selector(animationAction), for: .touchUpInside)
        self.view.addSubview(self.button)
    }
    
    // MARK: - Method
    @objc func animationAction() {
        let rotationAnimation = CABasicAnimation.init(keyPath: "transform.rotation.y")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = 2 * Double.pi
        rotationAnimation.duration = 3.0
        rotationAnimation.repeatCount = MAXFLOAT
        self.animationLayer.add(rotationAnimation, forKey: "mz.keyFrame")
    }
}
