//
//  FirstViewController.swift
//  TransitionAnimation
//
//  Created by boco on 2017/12/14.
//  Copyright © 2017年 ZhangLe. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UINavigationControllerDelegate {

    var img: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "First VC"
        
        self.img = UIImageView.init()
        self.img?.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        self.img?.image = UIImage.init(named: "apple_icon")
        self.img?.isUserInteractionEnabled = true
        self.view.addSubview(self.img!)
        
        let tapGR = UITapGestureRecognizer.init(target: self, action: #selector(pushAction))
        self.img?.addGestureRecognizer(tapGR)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.delegate = self
    }
    
    @objc func pushAction() {
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return MyPushAnimation()
        } else {
            return nil
        }
    }
}
