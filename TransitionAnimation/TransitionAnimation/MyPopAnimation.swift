//
//  MyPopAnimation.swift
//  TransitionAnimation
//
//  Created by boco on 2017/12/14.
//  Copyright © 2017年 ZhangLe. All rights reserved.
//

import UIKit

class MyPopAnimation: UIViewController, UIViewControllerAnimatedTransitioning {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from) as! SecondViewController
        let toVC = transitionContext.viewController(forKey: .to) as! FirstViewController
        let container = transitionContext.containerView
        
        let snapshot = fromVC.img?.snapshotView(afterScreenUpdates: false)
        snapshot?.frame = container.convert((fromVC.img?.frame)!, from: fromVC.view)
        fromVC.img?.isHidden = true
        
        toVC.view.frame = transitionContext.finalFrame(for: toVC)
        toVC.img?.isHidden = true
        toVC.view.alpha = 0
        
        container.addSubview(toVC.view)
        container.addSubview(snapshot!)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            snapshot?.frame = (toVC.img?.frame)!
            toVC.view.alpha = 1
        }) { (finish) in
            fromVC.img?.isHidden = false
            toVC.img?.isHidden = false
            snapshot?.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
}
