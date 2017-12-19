//
//  MyDismissAnimation.swift
//  TransitionAnimation
//
//  Created by boco on 2017/12/19.
//  Copyright © 2017年 ZhangLe. All rights reserved.
//

import UIKit

class MyDismissAnimation: UIViewController, UIViewControllerAnimatedTransitioning {

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from) as! FourthViewController
        let toVC = transitionContext.viewController(forKey: .to) as! UINavigationController
        let container = transitionContext.containerView
        container.addSubview(toVC.view)
        
        //改变m34
        var transfrom = CATransform3DIdentity
        transfrom.m34 = -0.002
        container.layer.sublayerTransform = transfrom
        
        //设置anrchPoint 和 position
        let initalFrame = transitionContext.initialFrame(for: fromVC)
        toVC.view.frame = initalFrame
        toVC.view.frame = initalFrame
        toVC.view.layer.anchorPoint = CGPoint.init(x: 0, y: 0.5)
        toVC.view.layer.position = CGPoint.init(x: 0, y: initalFrame.height / 2.0)
        toVC.view.layer.transform = CATransform3DMakeRotation(CGFloat(-Double.pi/2), 0, 1, 0)
        
        //添加阴影效果
        let shadowLayer = CAGradientLayer()
        shadowLayer.colors = [UIColor.init(white: 0, alpha: 1).cgColor, UIColor.init(white: 0, alpha: 0.5).cgColor, UIColor.init(white: 1, alpha: 0.5).cgColor]
        shadowLayer.startPoint = CGPoint.init(x: 0, y: 0.5)
        shadowLayer.endPoint = CGPoint.init(x: 1, y: 0.5)
        shadowLayer.frame = initalFrame
        let shadow = UIView(frame: initalFrame)
        shadow.backgroundColor = UIColor.clear
        shadow.layer.addSublayer(shadowLayer)
        toVC.view.addSubview(shadow)
        shadow.alpha = 1
        
        //动画
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseOut,
                       animations: { () -> Void in
                        toVC.view.layer.transform = CATransform3DIdentity
                        shadow.alpha = 0
        }) { (finished: Bool) -> Void in
            toVC.view.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
            toVC.view.layer.position = CGPoint.init(x: initalFrame.midX, y: initalFrame.midY)
            shadow.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }

}
