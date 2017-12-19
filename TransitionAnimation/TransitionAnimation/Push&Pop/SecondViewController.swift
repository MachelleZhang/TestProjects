//
//  SecondViewController.swift
//  TransitionAnimation
//
//  Created by boco on 2017/12/14.
//  Copyright © 2017年 ZhangLe. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UINavigationControllerDelegate {
    
    var img: UIImageView?
    var percentDrivenTransition: UIPercentDrivenInteractiveTransition?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Second VC"
        
        let edgePanGR = UIScreenEdgePanGestureRecognizer.init(target: self, action: #selector(edgePanGestureAction(edgePan:)))
        edgePanGR.edges = .left
        self.view.addGestureRecognizer(edgePanGR)
        
        self.img = UIImageView.init()
        self.img?.frame = CGRect.init(x: 150, y: 300, width: 100, height: 100)
        self.view.addSubview(self.img!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.delegate = self
    }
    
    @objc func edgePanGestureAction(edgePan: UIScreenEdgePanGestureRecognizer) {
        let progress = edgePan.translation(in: self.view).x / self.view.bounds.width
        
        if edgePan.state == .began {
            self.percentDrivenTransition = UIPercentDrivenInteractiveTransition()
            self.navigationController?.popViewController(animated: true)
        } else if edgePan.state == .changed {
            self.percentDrivenTransition?.update(progress)
        } else if edgePan.state == .cancelled || edgePan.state == .ended {
            if progress > 0.5 {
                self.percentDrivenTransition?.finish()
            } else {
                self.percentDrivenTransition?.cancel()
            }
            self.percentDrivenTransition = nil
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .pop {
            return MyPopAnimation()
        } else {
            return nil
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController is MyPopAnimation {
            return self.percentDrivenTransition
        } else {
            return nil
        }
    }
    
}
