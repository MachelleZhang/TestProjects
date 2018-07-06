//
//  MoveAnimation.swift
//  CoreAnimation
//
//  Created by boco on 2018/7/6.
//  Copyright © 2018年 zhangle. All rights reserved.
//

import UIKit

class MoveAnimation: UIViewController {

    let animationLayer = CALayer()
    let button = UIButton.init(type: .system)
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "沿路径移动动画"
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
        let path = UIBezierPath.init()
        path.move(to: CGPoint(x: 10, y: 100))
        path.addLine(to: CGPoint(x: 400, y: 400))
        path.addCurve(to: CGPoint(x: 50, y: 400),
                      controlPoint1: CGPoint(x: 200, y: 600),
                      controlPoint2: CGPoint(x: 200, y: 600))
        
        let keyAnimation = CAKeyframeAnimation.init(keyPath: "position")
        keyAnimation.path = path.cgPath
        keyAnimation.duration = 3.0
        keyAnimation.repeatCount = 3
        keyAnimation.autoreverses = true
        self.animationLayer.add(keyAnimation, forKey: "mz.keyFrame")
    }
}
