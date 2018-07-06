//
//  ImplicitlyAnimation.swift
//  CoreAnimation
//
//  Created by boco on 2018/6/25.
//  Copyright © 2018年 zhangle. All rights reserved.
//

import UIKit

class ImplicitlyAnimation: UIViewController {
    
    let animationLayer = CALayer()
    var index = 0
    var timer: Timer?

    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "隐式动画"
        self.view.backgroundColor = .white
        
        self.animationLayer.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        self.animationLayer.backgroundColor = UIColor.green.cgColor
        self.view.layer.addSublayer(self.animationLayer)
        
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(animationTimerAction), userInfo: nil, repeats: true)
        self.timer?.fire()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.timer?.invalidate()
        self.timer = nil
    }
    
    // MARK: - Method
    // 隐式动画有自己默认的动画时间
    @objc func animationTimerAction() {
        index += 1
        switch index {
        case 1:
            self.animationLayer.opacity = 0.5
            self.animationLayer.backgroundColor = UIColor.red.cgColor
            self.animationLayer.position = CGPoint.init(x: 100, y: 300)
        case 2:
            self.animationLayer.opacity = 1
            self.animationLayer.backgroundColor = UIColor.blue.cgColor
            self.animationLayer.position = CGPoint.init(x: 300, y: 300)
        case 3:
            self.animationLayer.opacity = 0.5
            self.animationLayer.backgroundColor = UIColor.yellow.cgColor
            self.animationLayer.position = CGPoint.init(x: 300, y: 500)
        case 4:
            self.animationLayer.opacity = 1
            self.animationLayer.backgroundColor = UIColor.green.cgColor
            self.animationLayer.position = CGPoint.init(x: 100, y: 500)
        default:
            break
        }
        if index == 4 {
            index = 0
        }
    }

}
