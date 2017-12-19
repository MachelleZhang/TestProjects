//
//  MyPresentAnimation.swift
//  TransitionAnimation
//
//  Created by boco on 2017/12/19.
//  Copyright © 2017年 ZhangLe. All rights reserved.
//

import UIKit

class MyPresentAnimation: UIViewController, UIViewControllerAnimatedTransitioning {

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from) as! UINavigationController
        let toVC = transitionContext.viewController(forKey: .to) as! FourthViewController
        let container = transitionContext.containerView
        container.addSubview(toVC.view)
        container.bringSubview(toFront: fromVC.view)
        
        //改变m34
        var transfrom = CATransform3DIdentity
        transfrom.m34 = -0.002
        container.layer.sublayerTransform = transfrom
        
        //设置anrchPoint 和 position
        let initalFrame = transitionContext.initialFrame(for: fromVC)
        toVC.view.frame = initalFrame
        fromVC.view.frame = initalFrame
        fromVC.view.layer.anchorPoint = CGPoint.init(x: 0, y: 0.5)
        fromVC.view.layer.position = CGPoint.init(x: 0, y: initalFrame.height / 2.0)
        
        //添加阴影效果
        let shadowLayer = CAGradientLayer()
        shadowLayer.colors = [UIColor.init(white: 0, alpha: 1).cgColor, UIColor.init(white: 0, alpha: 0.5).cgColor, UIColor.init(white: 1, alpha: 0.5).cgColor]
        shadowLayer.startPoint = CGPoint.init(x: 0, y: 0.5)
        shadowLayer.endPoint = CGPoint.init(x: 1, y: 0.5)
        shadowLayer.frame = initalFrame
        let shadow = UIView(frame: initalFrame)
        shadow.backgroundColor = UIColor.clear
        shadow.layer.addSublayer(shadowLayer)
        fromVC.view.addSubview(shadow)
        shadow.alpha = 0
        
        //动画
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseOut,
            animations: { () -> Void in
            fromVC.view.layer.transform = CATransform3DMakeRotation(CGFloat(-Double.pi/2), 0, 1, 0)
            shadow.alpha = 1.0
        }) { (finished: Bool) -> Void in
            fromVC.view.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
            fromVC.view.layer.position = CGPoint.init(x: initalFrame.midX, y: initalFrame.midY)
            fromVC.view.layer.transform = CATransform3DIdentity
            shadow.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }

}
