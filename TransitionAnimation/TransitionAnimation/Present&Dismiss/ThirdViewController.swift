//
//  ThirdViewController.swift
//  TransitionAnimation
//
//  Created by boco on 2017/12/19.
//  Copyright © 2017年 ZhangLe. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIViewControllerTransitioningDelegate {

    var img: UIImageView?
    var percentDrivenTransition: UIPercentDrivenInteractiveTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Third VC"
        self.transitioningDelegate = self
        
        self.img = UIImageView.init()
        self.img?.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        self.img?.image = UIImage.init(named: "apple_icon")
        self.img?.isUserInteractionEnabled = true
        self.view.addSubview(self.img!)
        
        let tapGR = UITapGestureRecognizer.init(target: self, action: #selector(presentAction))
        self.img?.addGestureRecognizer(tapGR)
        
        let panGR = UIScreenEdgePanGestureRecognizer.init(target: self, action: #selector(gestureAction))
        panGR.edges = .right
        self.view.addGestureRecognizer(panGR)
    }
    
    // MARK: - Action
    @objc func presentAction() {
        let fourthVC = FourthViewController()
        //tip: 第二个VC必须设置delegate，如果为nil，会调用系统的present
        fourthVC.transitioningDelegate = self
        let panGR = UIScreenEdgePanGestureRecognizer.init(target: self, action: #selector(gestureAction))
        panGR.edges = .left
        fourthVC.view.addGestureRecognizer(panGR)
        self.present(fourthVC, animated: true, completion: nil)
    }
    
    @objc func gestureAction(edgePan: UIScreenEdgePanGestureRecognizer) {
        let progress = abs(edgePan.translation(in: UIApplication.shared.keyWindow).x) / UIApplication.shared.keyWindow!.bounds.width
        
        if edgePan.state == .began {
            self.percentDrivenTransition = UIPercentDrivenInteractiveTransition()
            if edgePan.edges == .left {
                self.dismiss(animated: true, completion: nil)
            } else if edgePan.edges == .right {
                self.presentAction()
            }
        } else if edgePan.state == .changed {
            self.percentDrivenTransition?.update(progress)
        } else if edgePan.state == .ended || edgePan.state == .cancelled {
            if progress > 0.5 {
                self.percentDrivenTransition?.finish()
            } else {
                self.percentDrivenTransition?.cancel()
            }
            self.percentDrivenTransition = nil
        }
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MyPresentAnimation()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MyDismissAnimation()
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.percentDrivenTransition
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.percentDrivenTransition
    }

}
